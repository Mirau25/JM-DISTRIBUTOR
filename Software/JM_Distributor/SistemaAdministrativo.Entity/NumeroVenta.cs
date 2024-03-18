using System;
using System.Collections.Generic;

namespace SistemaAdministrativo.Entity;

public partial class NumeroVenta
{
    public int IdNumeroVenta { get; set; }

    public int? UltimoNumero { get; set; }

    public int? CantidadDigitos { get; set; }

    public string? Gestion { get; set; }

    public DateTime? FechaActualizacion { get; set; }
}
