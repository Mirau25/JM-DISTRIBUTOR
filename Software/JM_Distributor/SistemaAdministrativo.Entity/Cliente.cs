using System;
using System.Collections.Generic;

namespace SistemaAdministrativo.Entity;


    public partial class Cliente
    {
        public int IdCliente { get; set; }
        public string? NombreCliente { get; set; }
        public string? DocumentoCliente { get; set; }
        public string? Telefono { get; set; }
        public bool? EsActivo { get; set; }
    }

