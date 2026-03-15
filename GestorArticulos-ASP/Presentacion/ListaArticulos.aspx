<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="ListaArticulos.aspx.cs" Inherits="Presentacion.ListaArticulos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Lista de Artículos</h1>
    <hr />
    <asp:GridView ID="dgvArticulos" CssClass="table" AutoGenerateColumns="false"
    AllowPaging="true" PageSize="8" DataKeyNames="Id" runat="server">
    <Columns>
        <asp:BoundField HeaderText="Nombre" DataField="Nombre" />
        <asp:BoundField HeaderText="Marca" DataField="Marca.Descripcion" />
        <asp:BoundField HeaderText="Categoría" DataField="Categoria.Descripcion" />
        <asp:BoundField HeaderText="Descripción" DataField="Descripcion" />
        <asp:BoundField HeaderText="Precio" DataField="Precio" />
    </Columns>
</asp:GridView>
</asp:Content>
