<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="FormularioArticulos.aspx.cs" Inherits="Presentacion.FormularioArticulos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .form-check-input input[type="checkbox"] {
            width: 1em;
            height: 1em;
            margin-top: 0.2em;
            box-shadow: none !important;
            border: 1px solid #6c757d;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server" />

    <div class="row">
        <div class="col-6">
            <div class="mb-3">
                <asp:Label class="form-label" runat="server" Text="Id"></asp:Label>
                <asp:TextBox CssClass="form-control" ID="txtId" runat="server" />
            </div>
            <div class="mb-3">
                <asp:Label class="form-label" runat="server" Text="Código"></asp:Label>
                <asp:TextBox CssClass="form-control" ID="txtCodigo" runat="server" />
            </div>
            <div class="mb-3">
                <asp:Label class="form-label" runat="server" Text="Nombre"></asp:Label>
                <asp:TextBox CssClass="form-control" ID="txtNombre" runat="server" />
            </div>
            <div class="mb-3">
                <asp:Label class="form-label" runat="server" Text="Categoría"></asp:Label>
                <asp:DropDownList AppendDataBoundItems="true" ID="ddlCategoria" CssClass="form-select" runat="server"></asp:DropDownList>
            </div>
            <div class="mb-3">
                <asp:Label class="form-label" runat="server" Text="Marca"></asp:Label>
                <asp:DropDownList ID="ddlMarca" CssClass="form-select" runat="server"></asp:DropDownList>
            </div>
            <div class="mb-3">
                <asp:Label class="form-label" runat="server" Text="Precio"></asp:Label>
                <asp:TextBox CssClass="form-control" ID="txtPrecio" runat="server" />
            </div>
            <div class="mb-3">
                <asp:Button Text="Aceptar" ID="btnAceptar" OnClick="btnAceptar_Click" CssClass="btn btn-outline-success" runat="server" />
            </div>
            <div class="mb-3">
                <a href="Default.aspx" class="btn btn-outline-primary">Cancelar</a>

            </div>

            <asp:UpdatePanel runat="server">
                <ContentTemplate>
                    <!-- Bloque de acciones -->

                    <div class="mt-4">
                        <asp:Button Text="Eliminar" ID="btnEliminar" OnClick="btnEliminar_Click" CssClass="btn btn-outline-danger" runat="server" />

                        <%if (confirmaEliminacion)
                            {   %>
                        <!-- Caja de confirmación -->
                        <div class="border rounded p-3 mt-3 bg-light">
                            <div class="form-check mb-2">
                                <asp:CheckBox CssClass="form-check-input" ID="chkConfirmaEliminacion" runat="server" />
                                <label class="form-check-label" for="<%= chkConfirmaEliminacion.ClientID %>">¿Confirmar eliminación? Esta acción no se puede deshacer</label>
                            </div>
                            <asp:Button Text="Eliminar definitivamente" OnClick="btnEliminarConfirmado_Click" CssClass="btn btn-danger" ID="btnEliminarConfirmado" runat="server" />
                        </div>
                        <% } %>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>


        <div class="col-6">
            <div class="mb-3">
                <div class="mb-3">
                    <asp:Label class="form-label" runat="server" Text="Descripción"></asp:Label>
                    <asp:TextBox CssClass="form-control" ID="txtDescripcion" runat="server" />
                </div>
                <asp:UpdatePanel ID="updatePanel1" runat="server">
                    <ContentTemplate>
                        <div class="mb-3">
                            <label for="txtUrlImagen" class="form-label">URL Imagen</label>
                            <asp:TextBox ID="txtImagenUrl" class="form-control" AutoPostBack="true"
                                OnTextChanged="txtImagenUrl_TextChanged" runat="server" />
                        </div>
                        <asp:Image ImageUrl="https://grupoact.com.ar/wp-content/uploads/2020/04/placeholder.png"
                            onerror="this.onerror=null; this.src='/Images/ErrorUrl.png';"
                            Width="60%" ID="imgArticulo" runat="server" />
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>

    </div>
</asp:Content>
