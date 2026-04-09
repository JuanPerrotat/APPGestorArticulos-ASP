<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="ListaArticulos.aspx.cs" Inherits="Presentacion.ListaArticulos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="px-2 px-md-0 py-4">
        <% if (Session["mensaje"] != null)
            { %>
        <div id="alertaMensaje" class="alert alert-<%= Session["tipoMensaje"] %> text-center shadow-sm">
            <%= Session["mensaje"].ToString() %>
        </div>
        <% 
                Session.Remove("mensaje");
                Session.Remove("tipoMensaje");
            } %>
        <!-- HEADER -->
        <div class="mb-4 text-center text-md-start">
            <h1 class="fw-bold">Lista de Artículos</h1>
            <p class="text-muted mb-0">
                Administrá tus artículos de forma simple y eficiente
           
            </p>
        </div>

        <!-- FILTRO SIMPLE -->

        <div class="row g-3 align-items-center">
            <div class="col-12 col-md-4">
                <asp:Label CssClass="form-label mb-1" Text="Buscar por nombre de artículo:" runat="server" />
                <asp:TextBox ID="txtFiltro" AutoPostBack="true"
                    CssClass="form-control" runat="server" OnTextChanged="txtFiltro_TextChanged" />
            </div>

            <div class="col-6 col-md-3">
                <label class="form-label d-none d-md-block">&nbsp;</label>
                <div class="form-check d-flex align-items-center">

                    <asp:CheckBox ID="chkFiltroAvanzado"
                        AutoPostBack="true" OnCheckedChanged="chkFiltroAvanzado_CheckedChanged"
                        runat="server" />
                    <asp:Label runat="server" Text="Filtro avanzado"
                        AssociatedControlID="chkFiltroAvanzado" CssClass="form-check-label ms-2" />

                </div>
            </div>

            <div class="col-6 col-md-3 d-flex align-items-end">
                <asp:Button ID="btnReiniciarFiltro" CssClass="btn btn-outline-secondary w-100" AutoPostBack="true"
                    Text="Reiniciar filtro" OnClick="btnReiniciarFiltro_Click" runat="server" />
            </div>
        </div>

        <%if (chkFiltroAvanzado.Checked)
            {%>


        <div class="row g-3">

            <div class="col-12 col-md-3">
                <div class="mt-3">
                    <asp:Label Text="Campo" ID="lblCampo" CssClass="form-label" runat="server" />
                    <asp:DropDownList ID="ddlCampo" AutoPostBack="true" CssClass="form-select"
                        runat="server" OnSelectedIndexChanged="ddlCampo_SelectedIndexChanged">
                        <asp:ListItem Text="Código" />
                        <asp:ListItem Text="Categoría" />
                        <asp:ListItem Text="Marca" />
                    </asp:DropDownList>
                </div>
            </div>
            <div class="col-12 col-md-3">
                <div class="mt-3">
                    <asp:Label Text="Criterio" ID="lblCriterio" CssClass="form-label" runat="server" />
                    <asp:DropDownList ID="ddlCriterio" runat="server" CssClass="form-select"></asp:DropDownList>
                </div>
            </div>
            <div class="col-12 col-md-4">
                <div class="mt-3">
                    <asp:Label CssClass="form-label" Text="Filtro" ID="lblFiltro" runat="server" />
                    <asp:TextBox ID="txtFiltroAvanzado" CssClass="form-control" runat="server" />
                </div>
            </div>
            <div class="col-12 col-md-2 d-flex align-items-end">
                <div class="mt-3">
                    <asp:Button ID="btnBuscarFiltro" Text="Buscar" OnClick="btnBuscarFiltro_Click" CssClass="btn btn-primary w-100" runat="server" />
                </div>
            </div>
        </div>

        <div class="row">
        </div>

        <% } %>

        <div class="card shadow-sm mt-4">
            <div class="card-body">

                <div class="table-responsive">
                    <asp:GridView ID="dgvArticulos" CssClass="table table-hover table-striped align-middle" AutoGenerateColumns="false"
                        AllowPaging="true" PageSize="8" OnPageIndexChanging="dgvArticulos_PageIndexChanging"
                        OnSelectedIndexChanged="dgvArticulos_SelectedIndexChanged" DataKeyNames="Id" runat="server">
                        <Columns>
                            <asp:BoundField HeaderText="Código" DataField="Codigo" />
                            <asp:BoundField HeaderText="Nombre" DataField="Nombre" />
                            <asp:BoundField HeaderText="Descripción" DataField="Descripcion" />
                            <asp:BoundField HeaderText="Marca" DataField="Marca.Descripcion" />
                            <asp:BoundField HeaderText="Categoría" DataField="Categoria.Descripcion" />
                            <asp:BoundField HeaderText="Precio" DataField="Precio" DataFormatString="{0:C0}" HtmlEncode="false" />
                            <asp:CommandField HeaderText="Acción" ShowSelectButton="true" SelectText="✍️" />
                        </Columns>
                    </asp:GridView>
                </div>

            </div>
        </div>
        <div class="mt-4">
            <a href="FormularioArticulos.aspx" class="btn btn-success">+ Nuevo artículo</a>
        </div>
    </div>
    <script>
        window.onload = function () {
            const alerta = document.getElementById("alertaMensaje");
            if (alerta) {
                alerta.style.opacity = 0;
                alerta.style.transform = "translateY(-10px)";
                alerta.style.transition = "all 0.5s ease";

                setTimeout(() => {
                    alerta.style.opacity = 1;
                    alerta.style.transform = "translateY(0)";
                }, 100);

                setTimeout(() => {
                    alerta.style.opacity = 0;
                }, 2500);
            }
        }
</script>
</asp:Content>
