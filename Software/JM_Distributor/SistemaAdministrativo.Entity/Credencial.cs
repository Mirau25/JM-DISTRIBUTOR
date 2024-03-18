using System;
using System.Collections.Generic;

namespace SistemaAdministrativo.Entity;

public partial class Credencial
{
    public string? Recurso { get; set; }

    public string? Propiedad { get; set; }

    public string? Valor { get; set; }
}
