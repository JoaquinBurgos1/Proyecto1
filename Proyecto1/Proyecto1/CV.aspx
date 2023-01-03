<%@ Page Title="" Language="C#" MasterPageFile="~/Proyecto1.Master" AutoEventWireup="true" CodeBehind="CV.aspx.cs" Inherits="Proyecto1.CV" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Styles/StylesCV.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>MI CURRICULUM</h1>

    
    <div class="CV">
        <div class="container-fluid cew-9">
            <div class="row">
                <%--PARTE DE LA IZQUIERDA--%>
                <div class="col col-4 Skills">
                    <asp:Image class="img-fluid fotoCV" alt="Responsive image" runat="server" src="img/FotoCV.jpeg" />
                    <div>
                        <h2>Joaquin Burgos</h2>
                        <h5 style="text-decoration: none; text-align: center;">Desarrollador de Software</h5>
                        <h5>Perfil</h5>
                        <asp:Label runat="server">Hola a todos, me llamo Joaquin Burgos y soy estudiante de la Universidad Tecnologica Nacional (UTN) de Pacheco,
          me encuentro cursando la ultima etapa de la Tecnicatura Superior en Programacion y a la vez estoy trabajando como desarrollador web en una empresa llamada Sarsy.
          Me encanta programar y estoy dispuesto a aprender y a capacitarme en nuevas tecnologias para ampliar mis conocimientos dentro del área de la informatica </asp:Label>
                    </div>

                    <h5>Habilidades</h5>
                    <asp:Label runat="server">-Trabajo en Equipo</asp:Label><br />
                    <asp:Label runat="server">-Capacidad para la resolución de problemas de forma efectiva</asp:Label><br />
                    <asp:Label runat="server">-	Rápido aprendizaje</asp:Label><br />

                    <h5>Conocimientos</h5>
                    <asp:Label runat="server">-HTML</asp:Label><br />
                    <asp:Label runat="server">-CSS</asp:Label>    <br />
                    <asp:Label runat="server">-Javascript</asp:Label><br />
                    <asp:Label runat="server">-C#</asp:Label><br />
                    <asp:Label runat="server">-Visual Basic</asp:Label><br />
                    <asp:Label runat="server">-SQL</asp:Label><br />
                    <asp:Label runat="server">-NodeJS</asp:Label><br />
                    <asp:Label runat="server">-Java</asp:Label><br />
                </div>
                    
                    
                    <asp:Label runat="server"></asp:Label>
                <%--PARTE DE LA DERECHA--%>
                <div class="col col-8 Experiencia" >
                    
                </div>
            </div>
        </div>

    </div>
</asp:Content>
