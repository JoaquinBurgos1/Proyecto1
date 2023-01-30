<%@ Page Title="" Language="C#" MasterPageFile="~/Proyecto1.Master" AutoEventWireup="true" CodeBehind="CV.aspx.cs" Inherits="Proyecto1.CV" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Styles/StylesCV.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>MI CURRICULUM</h1>


    <div class="CV">
        <div class="container-fluid cew-9">

            <div class="row form-group ">
                <%--PARTE DE LA IZQUIERDA--%>
                <div class="col col-4 Skills">

                    <asp:Image class="img-fluid fotoCV" alt="Responsive image" runat="server" src="img/FotoCV.jpeg" />
                    <div class="form-group m-2">
                        <h2>Joaquin Burgos</h2>
                        <h5 style="text-decoration: none; text-align: center;">Desarrollador de Software</h5>
                        <h5>Perfil</h5>
                        <asp:Label runat="server">Hola a todos, me llamo Joaquin Burgos y soy estudiante de la Universidad Tecnologica Nacional (UTN) de Pacheco,
          me encuentro cursando la ultima etapa de la Tecnicatura Superior en Programacion y a la vez estoy trabajando como desarrollador web en una empresa llamada Sarsy.
          Me encanta programar y estoy dispuesto a aprender y a capacitarme en nuevas tecnologias para ampliar mis conocimientos dentro del área de la informatica </asp:Label>
                    </div>
                    <div class="form-group m-2">
                        <h5>Habilidades</h5>
                        <asp:Label runat="server">-Trabajo en Equipo</asp:Label><br />
                        <asp:Label runat="server">-Capacidad para la resolución de problemas de forma efectiva</asp:Label><br />
                        <asp:Label runat="server">-	Rápido aprendizaje</asp:Label><br />
                    </div>
                    <div class="form-group m-2">
                        <h5>Conocimientos</h5>
                        <asp:Label runat="server">-HTML</asp:Label><br />
                        <asp:Label runat="server">-CSS</asp:Label>
                        <br />
                        <asp:Label runat="server">-Javascript</asp:Label><br />
                        <asp:Label runat="server">-C#</asp:Label><br />
                        <asp:Label runat="server">-Visual Basic</asp:Label><br />
                        <asp:Label runat="server">-SQL</asp:Label><br />
                        <asp:Label runat="server">-NodeJS</asp:Label><br />
                        <asp:Label runat="server">-Java</asp:Label><br />
                    </div>
                </div>


                <asp:Label runat="server"></asp:Label>
                <%--PARTE DE LA DERECHA--%>
                <div class="col col-8 Experiencia">
                    <%--EXPERIENCIA LABORAL--%>
                    <div id="divExperienciaLaboral" class="ExperienciaLab">
                    <h2 style="text-decoration: underline;">EXPERIENCIA LABORAL</h2>
                    <h5><b>Sarsy SRL-DESARROLLADOR DE SOFTWARE | AGOSTO 2022-ACTUALIDAD</b></h5>

                    <b><asp:Label runat="server" CssClass="form-check-inline subTit">Desarrollo y mantenimiento web para empresa Southbit.</asp:Label></b>
                    <asp:Label runat="server" CssClass="form-check-inline">Tecnologias: C#, .NetFramework 4.7,JQuery, JS, SQLServer</asp:Label>

                    <b><asp:Label runat="server" CssClass="form-check-inline subTit">Desarrollo y mantenimiento web para empresa bluLogistics.</asp:Label></b>
                    <asp:Label runat="server" CssClass="form-check-inline">Tecnologias: C#, .NetFramework 4.7,JQuery, JS, SQLServer</asp:Label>
                    </div>

                    <%--FORMACION ACADEMICA--%>
                    <div id="divFormacionAcademica" class="FormacionAcadem">
                    <h2 style="text-decoration: underline;">FORMACION ACADEMICA</h2>
                   <b><asp:Label runat="server" CssClass="form-check-inline subTit">Instituto Juan Segundo Fernandez,Don Bosco</asp:Label></b>
                    <asp:label runat="server" class="form-check-inline">Tecnico secundario en electromecanica.</asp:label>
                    
                    <b><asp:Label runat="server" CssClass="form-check-inline subTit" >Universidad Tecnologica Nacional |Marzo 2021-Actualidad.</asp:Label></b>
                    <asp:Label runat="server" cssClass="form-check-inline">Tecnicatura Superior en Programacion.</asp:Label>
                    </div>

                </div>
            </div>
        </div>

    </div>
</asp:Content>
