<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="ListaArticulos.aspx.cs" Inherits="Presentacion.ListaArticulos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Lista de Artículos</h1>
    <hr />
    <asp:GridView ID="dgvArticulos" CssClass="table table-hover" AutoGenerateColumns="false"
    AllowPaging="true" PageSize="3" OnPageIndexChanging="dgvArticulos_PageIndexChanging" 
     OnSelectedIndexChanged="dgvArticulos_SelectedIndexChanged"   DataKeyNames="Id" runat="server">
    <Columns>
        <asp:BoundField HeaderText="Código" DataField="Codigo" />
        <asp:BoundField HeaderText="Nombre" DataField="Nombre" />
        <asp:BoundField HeaderText="Descripción" DataField="Descripcion" />
        <asp:BoundField HeaderText="Marca" DataField="Marca.Descripcion" />
        <asp:BoundField HeaderText="Categoría" DataField="Categoria.Descripcion" />
        <asp:BoundField HeaderText="Precio" DataField="Precio" DataFormatString="{0:N2}" HtmlEncode="false" />
        <asp:CommandField HeaderText="Acción" ShowSelectButton="true" SelectText="✍️" />
    </Columns>
</asp:GridView>
    <a href="FormularioArticulos.aspx" class="btn btn-primary">Agregar nuevo artículo</a>
</asp:Content>
