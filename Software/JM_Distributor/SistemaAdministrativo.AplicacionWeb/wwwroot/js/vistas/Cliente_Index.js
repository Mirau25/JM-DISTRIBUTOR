const MODELO_BASE_CLIENTE = {
    idCliente: 0,
    nombreCliente: "",
    documentoCliente: "",
    telefono: "",
    esActivo: 1
};

let tablaData;

$(document).ready(function () {
    tablaData = $('#tbdata').DataTable({
        responsive: true,
        "ajax": {
            "url": '/Cliente/Lista',
            "type": "GET",
            "dataType": "json",
            "error": function (xhr, error, thrown) {
                console.log("Error en la solicitud Ajax:", error);
                console.log("Detalles:", xhr.responseText);
                $('#tbdata').DataTable().clear().draw();
            }
        },
        "columns": [
            { "data": "idCliente", "visible": false, "searchable": false },
            { "data": "nombreCliente" },
            { "data": "documentoCliente" },
            { "data": "telefono" },
            {
                "data": "esActivo", render: function (data) {
                    if (data == 1)
                        return '<span class="badge badge-info">Activo</span>';
                    else
                        return '<span class ="badge badge-danger">No Activo</span>';
                }
            },
            {
                "defaultContent": '<button class="btn btn-primary btn-editar btn-sm mr-2"><i class="fas fa-pencil-alt"></i></button>' +
                    '<button class="btn btn-danger btn-eliminar btn-sm"><i class="fas fa-trash-alt"></i></button>',
                "orderable": false,
                "searchable": false,
                "width": "80px"
            }
        ],
        order: [[0, "desc"]],
        dom: "Bfrtip",
        buttons: [
            {
                text: 'Exportar Excel',
                extend: 'excelHtml5',
                title: '',
                filename: 'Reporte Clientes',
                exportOptions: {
                    columns: [1, 2, 3, 4]
                }
            }, 'pageLength'
        ],
        language: {
            url: "https://cdn.datatables.net/plug-ins/1.11.5/i18n/es-ES.json"
        },
    });

    // Código para mostrar el modal del cliente
    function mostrarModalCliente(modelo = MODELO_BASE_CLIENTE) {
        $("#txtId").val(modelo.idCliente);
        $("#txtNombreCliente").val(modelo.nombreCliente);
        $("#txtDocumentoCliente").val(modelo.documentoCliente);
        $("#txtTelefono").val(modelo.telefono);
        $("#cboEstado").val(modelo.esActivo);

        $("#modalData").modal("show");
    }

    // Código para abrir el modal al hacer clic en el botón Nuevo
    $("#btnNuevo").click(function () {
        mostrarModalCliente();
    });

    // Código para guardar los cambios del cliente
    $("#btnGuardar").click(function () {
        const modelo = Object.assign({}, MODELO_BASE_CLIENTE);
        modelo.idCliente = parseInt($("#txtId").val());
        modelo.nombreCliente = $("#txtNombreCliente").val();
        modelo.documentoCliente = $("#txtDocumentoCliente").val();
        modelo.telefono = $("#txtTelefono").val();
        modelo.esActivo = $("#cboEstado").val();

        if (modelo.idCliente === 0) { // Crear cliente
            fetch("/Cliente/Crear", {
                method: "POST",
                headers: {
                    "Content-Type": "application/json"
                },
                body: JSON.stringify(modelo)
            })
                .then(response => {
                    return response.ok ? response.json() : Promise.reject(response);
                })
                .then(responseJson => {
                    if (responseJson.estado) {
                        tablaData.row.add(responseJson.objeto).draw(false);
                        $("#modalData").modal("hide");
                        swal("Listo!", "Cliente creado", "success");
                    } else {
                        swal("Lo sentimos", responseJson.mensaje, "error");
                    }
                });
        } else { // Editar cliente
            fetch("/Cliente/Editar", {
                method: "PUT",
                headers: {
                    "Content-Type": "application/json"
                },
                body: JSON.stringify(modelo)
            })
                .then(response => {
                    return response.ok ? response.json() : Promise.reject(response);
                })
                .then(responseJson => {
                    if (responseJson.estado) {
                        tablaData.row(filaSeleccionada).data(responseJson.objeto).draw(false);
                        $("#modalData").modal("hide");
                        swal("Listo!", "Cliente modificado", "success");
                    } else {
                        swal("Lo sentimos", responseJson.mensaje, "error");
                    }
                });
        }
    });

    // Código para eliminar un cliente
    $("#tbdata tbody").on("click", ".btn-eliminar", function () {
        const fila = $(this).closest("tr");
        const data = tablaData.row(fila).data();

        swal({
            title: "¿Está seguro?",
            text: `Eliminar al cliente "${data.nombreCliente}"`,
            type: "warning",
            showCancelButton: true,
            confirmButtonClass: "btn-danger",
            confirmButtonText: "Si, eliminar",
            cancelButtonText: "No, cancelar",
            closeOnConfirm: false,
            closeOnCancel: true
        },
            function (respuesta) {
                if (respuesta) {
                    fetch(`/Cliente/Eliminar?idCliente=${data.idCliente}`, {
                        method: "DELETE"
                    })
                        .then(response => {
                            return response.ok ? response.json() : Promise.reject(response);
                        })
                        .then(responseJson => {
                            if (responseJson.estado) {
                                tablaData.row(fila).remove().draw();
                                swal("Listo!", "El cliente fue eliminado", "success");
                            } else {
                                swal("Lo sentimos", responseJson.mensaje, "error");
                            }
                        });
                }
            }
        );
    });

    // Código para editar un cliente
    let filaSeleccionada;
    $("#tbdata tbody").on("click", ".btn-editar", function () {
        filaSeleccionada = $(this).closest("tr");
        const data = tablaData.row(filaSeleccionada).data();
        mostrarModalCliente(data);
    });

});
