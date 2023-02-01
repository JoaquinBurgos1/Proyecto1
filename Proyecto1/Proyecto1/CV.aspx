<%@ Page Title="" Language="C#" MasterPageFile="~/Proyecto1.Master" AutoEventWireup="true" CodeBehind="CV.aspx.cs" Inherits="Proyecto1.CV" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Styles/StylesCV.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div style="text-align:center">
        
               <iframe  src="./img/CV.pdf" contenteditable="true" style="width:50%; height:900px;"   frameborder="0" ></iframe>
        </div>
</asp:Content>
