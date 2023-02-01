<%@ Page Title="" Language="C#" MasterPageFile="~/Proyecto1.Master" AutoEventWireup="true" CodeBehind="Torneito.aspx.cs" Inherits="Proyecto1.Torneito" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Styles/StylesFutbol.css" rel="stylesheet" />
    <link href="Styles/StylesTablaResultados.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:Panel ID="pnlTabla" runat="server" Visible="false">
                        <div class="form-group" >
                            
                            <table id="tblTorneito" style="color:black!important"  class=" table-bordered table-responsive-xl">
                    <thead>
                        <tr >

                            <th >Nombre</th>
                            <th>Ganados </th>
                            <th>Empatados</th>
                            <th>Perdidos</th>
                            <th>Puntos</th>
                        </tr>
                    </thead>
                    <tbody>
                        <asp:Repeater ID="rpTablaTorneito" runat="server"  >
                            <ItemTemplate>
                                <tr class="stl-tr ">
                                    
                                    <td ><%#Eval("Nombre") %></td>

                                    <td ><%#Eval("Ganados") %></td>

                                    <td><%#Eval("Empatados") %></>

                                    <td><%# Eval("Perdidos") %></td>

                                    <td><%# Eval("Puntos") %></td>
                                </tr>
                            </ItemTemplate>
                        </asp:Repeater>
                </tbody>
                </table>
                        </div>
            
        </asp:Panel>

    <asp:Panel ID="pnlEquipos" runat="server" Visible="true">
         <div class="container-fluid">
        <div class="row" style="text-align:center;">
            <div class="col-4" style="margin:0 auto">EQUIPO 1</div>
            <div class="col-4">VERSUS</div>
            <div class="col-4">EQUIPO 2</div>
        </div>
</div>
    </asp:Panel>
        


    <script>

        $('#tblTorneito').DataTable({

            "language": {
                "processing": "Procesando...",
                "lengthMenu": "Mostrar _MENU_ registros",
                "zeroRecords": "No se encontraron resultados",
                "emptyTable": "Ningún dato disponible en esta tabla",
                "infoEmpty": "Mostrando registros del 0 al 0 de un total de 0 registros",
                "infoFiltered": "(filtrado de un total de _MAX_ registros)",
                "search": "Buscar:",
                "infoThousands": ",",
                "loadingRecords": "Cargando...",
                "paginate": {
                    "first": "Primero",
                    "last": "Último",
                    "next": "Siguiente",
                    "previous": "Anterior"
                },
            },
            
            lengthMenu: [[5, 10, -1], [5, 10, "All"]],
            ordering: false,
            "bPaginate": false, //Ocultar paginación
            
            

        });

        

    </script>
</asp:Content>
