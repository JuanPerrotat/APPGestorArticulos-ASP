<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="ListaArticulos.aspx.cs" Inherits="Presentacion.ListaArticulos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <h1>Lista de Artículos</h1>
    <h5 class="text-muted">Aquí vas a poder administrar tus artículos de forma eficiente</h5>


    <div class="row align-items-center mb-3">
        <div class="col-auto">
            <asp:Label Text="Filtro por nombre de artículo:" runat="server" />
        </div>
        <div class="col-4">
            <asp:TextBox ID="txtFiltro" AutoPostBack="true"
                CssClass="form-control" runat="server" OnTextChanged="txtFiltro_TextChanged" />
        </div>
        <div class="col-auto d-flex align-items-center">
            <asp:CheckBox ID="chkFiltroAvanzado"
                AutoPostBack="true" OnCheckedChanged="chkFiltroAvanzado_CheckedChanged"
                runat="server" />
            <asp:Label runat="server" Text="Filtro avanzado"
                AssociatedControlID="chkFiltroAvanzado" CssClass="ms-2" />
        </div>
        <div class="col-auto d-flex align-items-center">
            <asp:Button ID="btnReiniciarFiltro" CssClass="btn btn-primary" AutoPostBack="true"
                Text="Reiniciar filtro" OnClick="btnReiniciarFiltro_Click" runat="server" />
        </div>
    </div>

    <%if (chkFiltroAvanzado.Checked)
        {%>


    <div class="row">
        <div class="col-3">
            <div class="mb-3">
                <asp:Label Text="Campo" ID="lblCampo" CssClass="ms-2" runat="server" />
                <asp:DropDownList ID="ddlCampo" AutoPostBack="true" CssClass="form-select"
                    runat="server" OnSelectedIndexChanged="ddlCampo_SelectedIndexChanged">
                    <asp:ListItem Text="Código" />
                    <asp:ListItem Text="Categoría" />
                    <asp:ListItem Text="Marca" />
                </asp:DropDownList>                
            </div>
        </div>
        <div class="col-3">
            <div class="mb-3">
                <asp:Label Text="Criterio" ID="lblCriterio" CssClass="ms-2" runat="server" />
                <asp:DropDownList ID="ddlCriterio" runat="server" CssClass="form-select"></asp:DropDownList>
            </div>
        </div>
        <div class="col-3">
            <div class="mb-3">
                <asp:Label text="Filtro" Id="lblFiltro" runat="server" />
                <asp:TextBox ID="txtFiltroAvanzado" CssClass="form-control" runat="server" />
            </div>
        </div>
        <div class="col-auto d-flex align-items-center">
            <div class="mt-2">
                <asp:Button ID="btnBuscarFiltro" Text="Buscar" OnClick="btnBuscarFiltro_Click" CssClass="btn btn-primary" runat="server" />
            </div>
        </div>
    </div>

    <div class="row">
    </div>

    <% } %>


    <hr />
    <asp:GridView ID="dgvArticulos" CssClass="table table-hover" AutoGenerateColumns="false"
        AllowPaging="true" PageSize="8" OnPageIndexChanging="dgvArticulos_PageIndexChanging"
        OnSelectedIndexChanged="dgvArticulos_SelectedIndexChanged" DataKeyNames="Id" runat="server">
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
