using SistemaAdministrativo.Entity;

namespace SistemaAdministrativo.AplicacionWeb.Models.ViewModels
{
    public class VMCliente
    {
        public int IdCliente { get; set; }
        public string? NombreCliente { get; set; }
        public string? DocumentoCliente { get; set; }
        public string? Telefono { get; set; }
        public int? EsActivo { get; set; }
    }
}
