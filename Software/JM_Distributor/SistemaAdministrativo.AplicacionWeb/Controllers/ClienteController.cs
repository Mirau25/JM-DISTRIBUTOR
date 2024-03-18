using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Http;
using AutoMapper;
using SistemaAdministrativo.AplicacionWeb.Models.ViewModels;
using SistemaAdministrativo.AplicacionWeb.Utilidades.Response;
using SistemaAdministrativo.BLL.Interfaces;
using SistemaAdministrativo.Entity;
using Microsoft.AspNetCore.Authorization;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SistemaAdministrativo.AplicacionWeb.Controllers
{
    [Authorize]
    public class ClienteController : Controller
    {
        private readonly IMapper _mapper;
        private readonly IClienteService _clienteServicio;

        public ClienteController(IMapper mapper, IClienteService clienteServicio)
        {
            _mapper = mapper;
            _clienteServicio = clienteServicio;
        }

        public IActionResult Index()
        {
            return View();
        }

        [HttpGet]
        public async Task<IActionResult> Lista()
        {
            List<VMCliente> vmClienteLista = _mapper.Map<List<VMCliente>>(await _clienteServicio.Lista());
            return StatusCode(StatusCodes.Status200OK, new { data = vmClienteLista });
        }

        [HttpGet]
        public async Task<IActionResult> BuscarPorDocumento(string documentoCliente)
        {
            // Lógica para buscar clientes por documento en la base de datos
            List<Cliente> clientesEncontrados = await _clienteServicio.Buscar(documentoCliente);

            // Devuelve los resultados como JSON
            return StatusCode(StatusCodes.Status200OK, clientesEncontrados);
        }

        [HttpPost]
        public async Task<IActionResult> Crear([FromBody] VMCliente modelo)
        {
            GenericResponse<VMCliente> gResponse = new GenericResponse<VMCliente>();
            try
            {
                Cliente clienteCreado = await _clienteServicio.Crear(_mapper.Map<Cliente>(modelo));
                modelo = _mapper.Map<VMCliente>(clienteCreado);

                gResponse.Estado = true;
                gResponse.Objeto = modelo;
            }
            catch (Exception ex)
            {
                gResponse.Estado = false;
                gResponse.Mensaje = ex.Message;
            }
            return StatusCode(StatusCodes.Status200OK, gResponse);
        }

        [HttpPut]
        public async Task<IActionResult> Editar([FromBody] VMCliente modelo)
        {
            GenericResponse<VMCliente> gResponse = new GenericResponse<VMCliente>();
            try
            {
                Cliente clienteEditado = await _clienteServicio.Editar(_mapper.Map<Cliente>(modelo));
                modelo = _mapper.Map<VMCliente>(clienteEditado);

                gResponse.Estado = true;
                gResponse.Objeto = modelo;
            }
            catch (Exception ex)
            {
                gResponse.Estado = false;
                gResponse.Mensaje = ex.Message;
            }
            return StatusCode(StatusCodes.Status200OK, gResponse);
        }

        [HttpDelete]
        public async Task<IActionResult> Eliminar(int idCliente)
        {
            GenericResponse<string> gResponse = new GenericResponse<string>();
            try
            {
                gResponse.Estado = await _clienteServicio.Eliminar(idCliente);
            }
            catch (Exception ex)
            {
                gResponse.Estado = false;
                gResponse.Mensaje = ex.Message;
            }
            return StatusCode(StatusCodes.Status200OK, gResponse);
        }
    }
}