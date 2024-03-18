using System.Collections.Generic;
using System.Threading.Tasks;
using SistemaAdministrativo.Entity;

namespace SistemaAdministrativo.BLL.Interfaces
{
    public interface IClienteService
    {
        Task<List<Cliente>> Lista();
        Task<Cliente> Crear(Cliente entidad);
        Task<Cliente> Editar(Cliente entidad);
        Task<bool> Eliminar(int idCliente);
        Task<List<Cliente>> Buscar(string criterio);
        Task<Cliente> ObtenerClientePorId(object idCliente);
    }
}
