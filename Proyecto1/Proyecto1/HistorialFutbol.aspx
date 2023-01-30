<%@ Page Title="" Language="C#" MasterPageFile="~/Proyecto1.Master" AutoEventWireup="true" CodeBehind="HistorialFutbol.aspx.cs" Inherits="Proyecto1.HistorialFutbol" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Styles/StylesFutbol.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <asp:Panel ID="pnlHistorial" runat="server" >
        <table id="tblHistorial" class="stl-tbl-hover table-bordered"  >
                    <thead>
                        <tr class="" style="table-layout: fixed" >
                            <th style="width:160px!important; margin: auto;">Operacion</th>
                            <th>Resultado</th>
                            <th>Ganador </th>
                            <th>Fecha</th>
                            <th>Observaciones</th>
                        </tr>
                    </thead>
                    <tbody>
                        <asp:Repeater ID="rpHistorial" runat="server" OnItemDataBound="rpHistorial_ItemDataBound" OnItemCommand="rpHistorial_ItemCommand">
                            <ItemTemplate>
                                <tr class="stl-tr ">
                                    <td >
                                       <asp:Button runat="server"  ID="btnEliminar" CommandName="Eliminar" Text="Borrar" CommandArgument='<%# Eval("idResultado") %>'/>
                                        <asp:Button runat="server"  ID="btnEditar" CommandName="Editar" Text="Editar" Visible="true"/>
                                        <asp:Button runat="server"  ID="btnConfirmar" CommandName="Confirmar" Text="Confirmar" Visible="false" CommandArgument='<%# Eval("idResultado") %> '/>
                                        <asp:Button runat="server"  ID="btnCancelar" CommandName="Cancelar" Text="Cancelar" Visible="false" />
                                    </td>

                                    <td>
                                        <asp:Label runat="server" ID="lblResultado" Visible="true"> <%# Eval("Resultado") %></asp:Label>
                                        <asp:TextBox runat="server" ID="txtResultado1" Visible="false" style="max-width:20px"></asp:TextBox>
                                        <asp:Label runat="server" ID="lblGuion" Visible="false">-</asp:Label>
                                        <asp:TextBox runat="server" ID="txtResultado2" Visible="false" style="max-width:20px"></asp:TextBox>
                                        <asp:Button runat="server" ID="btnConfirmarResultado" CommandName="ConfirmarResultado" CssClass=" btn-success" Visible="false" Text="OK" />
                                    </td>

                                    <td>
                                        <asp:DropDownList runat="server" ID="ddlGanador" CssClass="form-control" Visible="false">
                                            
                                        </asp:DropDownList>
                                        
                                        <asp:Label runat="server" ID="lblGanador" Visible="true"> <%# Eval("Ganador") %></asp:Label>
                                        
                                        
                                    </td>

                                    <td><%# Eval("Fecha") %></td>
                                    <td>
                                        <asp:Label runat="server" ID="lblObservacion" Visible="true"> <%# Eval("Observaciones") %></asp:Label>
                                        <asp:TextBox runat="server" ID="txtObservacion" Visible="false" style="width:1000px" placeholder='<%# Eval("Observaciones") %>'></asp:TextBox>
                                    </td>                          
                                </tr>
                            </ItemTemplate>
                        </asp:Repeater>
                </tbody>
                </table>

    </asp:Panel>

    <script>
        $('#tblHistorial').DataTable({

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
            }

        });
    </script>
</asp:Content>
