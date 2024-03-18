using SistemaAdministrativo.Entity;

namespace SistemaAdministrativo.AplicacionWeb.Models.ViewModels
{
    public class VMMenu
    {

        public string? Descripcion { get; set; }

        public int? IdMenuPadre { get; set; }


        public string? Controlador { get; set; }

        public string? PaginaAccion { get; set; }

        public virtual ICollection<VMMenu> SubMenus { get; set; }
    }
}
