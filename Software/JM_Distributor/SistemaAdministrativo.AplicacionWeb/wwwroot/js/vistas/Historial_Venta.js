$(document).ready(function () {
    // Inicializar datepickers
    $.datepicker.setDefaults($.datepicker.regional["es"]);
    $("#txtFechaInicio").datepicker({ dateFormat: "dd/mm/yy" });
    $("#txtFechaFin").datepicker({ dateFormat: "dd/mm/yy" });

    // Inicializar DataTable
    let tablaData = $('#tbdata').DataTable({
        responsive: true,
        "columns": [
            { "data": "fechaRegistro" },
            { "data": "numeroVenta" },
            { "data": "tipoDocumento" },
            { "data": "documentoCliente" },
            { "data": "nombreCliente" },
            { "data": "total" },
            {
                "data": null,
                "render": function (data, type, full, meta) {
                    return '<button class="btn btn-info btn-sm btnVerDetalle" data-toggle="modal" data-target="#modalData" data-venta=\'' + JSON.stringify(data) + '\'><i class="fas fa-eye"></i> Ver Detalle</button>';
                }
            }
        ],
        order: [[0, "desc"]],
        dom: "Bfrtip",
        buttons: [
            {
                text: 'Exportar Excel',
                extend: 'excelHtml5',
                title: '',
                filename: 'Historial Ventas '
            },
            'pageLength'
        ],
        language: {
            url: "https://cdn.datatables.net/plug-ins/1.11.5/i18n/es-ES.json"
        },
    });

    // Evento click para buscar datos
    $("#btnBuscar").click(function () {
        if ($("#txtFechaInicio").val().trim() == "" || $("#txtFechaFin").val().trim() == "") {
            toastr.warning("", "Debe ingresar fecha inicio y fin");
            return;
        }

        let fechaInicio = $("#txtFechaInicio").val().trim();
        let fechaFin = $("#txtFechaFin").val().trim();
        let nueva_url = `/Reporte/ReporteVenta?fechaInicio=${fechaInicio}&fechaFin=${fechaFin}`;

        tablaData.ajax.url(nueva_url).load();
    });

    // Evento click para mostrar detalles en el modal
    $(document).on("click", ".btnVerDetalle", function () {
        let data = $(this).data("venta");
        console.log(data);
        $("#txtFechaRegistro").val(data.fechaRegistro);
        $("#txtNumVenta").val(data.numeroVenta);
        $("#txtUsuarioRegistro").val(data.usuarioRegistro);
        $("#txtTipoDocumento").val(data.tipoDocumentoVenta);
        $("#txtDocumentoCliente").val(data.documentoCliente);
        $("#txtNombreCliente").val(data.nombreCliente);
        $("#txtSubTotal").val(data.subTotal);
        $("#txtIGV").val(data.impuestoTotal);
        $("#txtTotal").val(data.total);

        // Añadir los siguientes campos
        $("#txtIGV").val(data.impuestoTotalVenta);
        $("#txtSubTotal").val(data.subTotalVenta);
        $("#txtTipoDocumento").val(data.tipoDocumento);


        $("#linkImprimir").attr("href", `/Venta/MostrarPDFVenta?numeroVenta=${data.numeroVenta}`)

        $("#modalData").modal("show");
    });
});
