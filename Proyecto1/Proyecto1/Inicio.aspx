<%@ Page Title="" Language="C#" MasterPageFile="~/Proyecto1.Master" AutoEventWireup="true" CodeBehind="Inicio.aspx.cs" Inherits="Proyecto1.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Styles/StylesInicio.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    

<h1>PROYECTO WEB</h1>


        <div class="row">

            <a href="CV.aspx" class="card">
                <div class="card-info">
                    <p class="title">CV</p>
                </div>
            </a>

            <a class="card">
                <div class="card-info">
                    <p class="title">Facultad</p>
                </div>
            </a>

            <a class="card">
                <div class="card-info">
                    <p class="title">Titulos</p>
                </div>
            </a>
        </div>



</asp:Content>
