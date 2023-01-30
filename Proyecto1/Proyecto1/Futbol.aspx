<%@ Page Title="" Language="C#" MasterPageFile="~/Proyecto1.Master" AutoEventWireup="true" CodeBehind="Futbol.aspx.cs" Inherits="Proyecto1.Futbol" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Styles/StylesFutbol.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <asp:Panel ID="pnlFutbol" runat="server" Visible="true">
    <div class="container-fluid">
       
        <div class="row ">
        <div class="col" >
            <div style="text-align:center" class="mt-5">
                <video class="Gif mt-5" src="img/GIFmichi.mp4" autoplay muted loop></video>

            <div>Joabu</div>
            <div>Partidos Ganados:
                <asp:Label ID="lblGanadosJugador1" runat="server"></asp:Label>
            </div>
            <div >Partidos Empatados:
                <asp:Label ID="lblEmpatadosJugador1" runat="server"></asp:Label>
            </div>
            <div>Partidos Perdidos:
                <asp:Label ID="lblPerdidosJugador1" runat="server"></asp:Label>
            </div>

                
          </div>
        </div>
                <div class="col col-5" style="margin:20px ;text-align:center">

                        <h1>PARTIDO <asp:Label runat="server" ID="lblNumeroPartido"> </asp:Label></h1>
                        
                    <asp:Label ID="lblFecha" runat="server"></asp:Label><br/>
                    
                     <asp:LinkButton runat="server" OnClick="lbVerHistorialJugador1_Click" ID="lbVerHistorialJugador1">Ver Historial</asp:LinkButton>
   
                    

                    <asp:Image class="img-fluid fotoCancha mt-4" alt="Responsive image" runat="server" src="img/FotoCancha.jpg" /><br /><br />

                   <div><h5> RESULTADO </h5></div>
                    <div class="mt-3">
                <asp:TextBox ID="txtResultado1"  runat="server" placeholder="0" class="input" autocomplete="off"  ></asp:TextBox>
                <asp:TextBox ID="txtResultado2"  runat="server" placeholder="0" class="input" autocomplete="off" ></asp:TextBox>
                        </div>
                                
                    <div id="divObs" runat="server" class="input-group" style="margin:20px 24%" >
                       <asp:TextBox ID="txtObs" runat="server" autocomplete="off" CssClass="inputObs" TextMode="MultiLine"></asp:TextBox>
                        <label class="user-label">Observaciones</label>
                    </div>
                   
     
                   
                    
                    <div>
                        <asp:Button  CssClass="btn" ID="btnConfirmar" OnClick="btnConfirmar_Click" runat="server" Text="Confirmar"/>
                    </div>
                </div>
       


            <div class="col" >
           <div style="text-align:center" class="mt-5">
               <video class="Gif mt-5" src="img/GIFmichi.mp4" autoplay muted ></video>
            <div>Merqui</div>
            <div>Partidos Ganados:
                <asp:Label ID="lblGanadosJugador2"  runat="server"></asp:Label>
            </div>
            <div >Partidos Empatados:
                <asp:Label ID="lblEmpatadosJugador2" runat="server"></asp:Label>
            </div>
            <div>Partidos Perdidos:
                <asp:Label ID="lblPerdidosJugador2" runat="server"></asp:Label>
            </div>
              
          </div>
        </div>

            </div>
       
        </div>
        </asp:Panel>

    <%--HISTORIAL--%>
   
    <%--MODAL--%>


    <div class="modal fade"  id="modalModificarResultados" aria-labelledby="TituloModal" tabindex="-1" aria-hidden="true">
        
        <div class="modal-dialog modal-xl">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" >Modificar Servicio</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">

                        <div class="form-group">
                            
                            <table id="tblHistorial" class=" table-bordered table-responsive-xl">
                    <thead>
                        <tr class="" style="color:black!important; table-layout: fixed">
                            <th style="width:160px!important; margin: auto;">Operacion</th>
                            <th>Resultado</th>
                            <th>Ganador </th>
                            <th>Fecha</th>
                            <th>Observaciones</th>
                        </tr>
                    </thead>
                    <tbody>
                        <asp:Repeater ID="rpHistorial" runat="server" OnItemCommand="rpHistorial_ItemCommand" OnItemDataBound="rpHistorial_ItemDataBound" >
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
                                        <asp:TextBox runat="server" ID="txtObservacion" Visible="false"  placeholder='<%# Eval("Observaciones") %>'></asp:TextBox>
                                    </td>                          
                                </tr>
                            </ItemTemplate>
                        </asp:Repeater>
                </tbody>
                </table>
                        </div>
                </div>
            </div>
        </div>
    </div>





    <script>


        $('[id$=btnConfirmar]').on('click', event => {

            if ($('[id$=txtResultado1]').val() == "" || $('[id$=txtResultado2]').val() == "") {
                event.preventDefault();
                swal("Ingrese un resultado valido");
            }
        })

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
