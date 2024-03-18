using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using SistemaAdministrativo.BLL.Interfaces;
using SistemaAdministrativo.DAL.Interfaces;
using SistemaAdministrativo.Entity;

namespace SistemaAdministrativo.BLL.Implementacion
{
    public class ClienteService : IClienteService
    {
        private readonly IGenericRepository<Cliente> _repositorio;

        public ClienteService(IGenericRepository<Cliente> repositorio)
        {
            _repositorio = repositorio;
        }

        public async Task<List<Cliente>> Lista()
        {
            IQueryable<Cliente> query = await _repositorio.Consultar();
            return query.ToList();
        }

        public async Task<Cliente> Crear(Cliente entidad)
        {
            try
            {
                Cliente clienteCreado = await _repositorio.Crear(entidad);
                if (clienteCreado.IdCliente == 0) // Si no se crea.
                    throw new InvalidOperationException("No se pudo crear el cliente");
                return clienteCreado;
            }
            catch
            {
                throw;
            }
        }

        public async Task<Cliente> Editar(Cliente entidad)
        {
            try
            {
                Cliente clienteEncontrado = await _repositorio.Obtener(c => c.IdCliente == entidad.IdCliente);
                clienteEncontrado.NombreCliente = entidad.NombreCliente;
                clienteEncontrado.DocumentoCliente = entidad.DocumentoCliente;
                clienteEncontrado.Telefono = entidad.Telefono;
                clienteEncontrado.EsActivo = entidad.EsActivo;

                bool respuesta = await _repositorio.Editar(clienteEncontrado);

                if (!respuesta)
                    throw new InvalidOperationException("No se pudo modificar el cliente");
                return clienteEncontrado;
            }
            catch
            {
                throw;
            }
        }

        public async Task<bool> Eliminar(int idCliente)
        {
            try
            {
                Cliente clienteEncontrado = await _repositorio.Obtener(c => c.IdCliente == idCliente);

                if (clienteEncontrado == null)
                    throw new InvalidOperationException("El cliente no existe");

                bool respuesta = await _repositorio.Eliminar(clienteEncontrado);
                return respuesta;
            }
            catch
            {
                throw;
            }

        }
        public async Task<List<Cliente>> Buscar(string criterio)
        {
            IQueryable<Cliente> query = await _repositorio.Consultar();
            return query.Where(c => c.NombreCliente.Contains(criterio) || c.DocumentoCliente.Contains(criterio)).ToList();
        }

        public Task<Cliente> ObtenerClientePorId(object idCliente)
        {
            throw new NotImplementedException();
        }
    }
}
