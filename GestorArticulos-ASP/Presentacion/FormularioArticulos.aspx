<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="FormularioArticulos.aspx.cs" Inherits="Presentacion.FormularioArticulos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server" />

    <div class="container">
        <div class="card shadow-sm p-4 mt-4">
            <h4><%= txtId.Text == "" ? "Nuevo Artículo" : "Editar Artículo" %></h4>

            <div class="row mt-2">
                <div class="col-12 col-lg-6">
                    <div class="mb-3">
                        <asp:Label class="form-label" runat="server" Text="Id"></asp:Label>
                        <asp:TextBox CssClass="form-control shadow-sm" placeholder="ID generado automáticamente" ID="txtId" runat="server" />
                    </div>
                    <div class="mb-3">
                        <asp:Label class="form-label" runat="server" Text="Código"></asp:Label>
                        <asp:TextBox CssClass="form-control shadow-sm" ID="txtCodigo" runat="server" />
                    </div>
                    <div class="mb-3">
                        <asp:Label class="form-label" runat="server" Text="Nombre"></asp:Label>
                        <asp:TextBox CssClass="form-control shadow-sm" ID="txtNombre" runat="server" />
                    </div>
                    <div class="mb-3">
                        <asp:Label class="form-label" runat="server" Text="Categoría"></asp:Label>
                        <asp:DropDownList AppendDataBoundItems="true" ID="ddlCategoria" CssClass="form-select shadow-sm" runat="server"></asp:DropDownList>
                    </div>
                    <div class="mb-3">
                        <asp:Label class="form-label" runat="server" Text="Marca"></asp:Label>
                        <asp:DropDownList ID="ddlMarca" CssClass="form-select shadow-sm" runat="server"></asp:DropDownList>
                    </div>
                    <div class="mb-3">
                        <asp:Label class="form-label" runat="server" Text="Precio"></asp:Label>
                        <asp:TextBox CssClass="form-control shadow-sm" ID="txtPrecio" runat="server" />
                    </div>
                    <div class="d-flex gap-2 mt-3">
                        <asp:Button Text="Aceptar" ID="btnAceptar" OnClick="btnAceptar_Click" CssClass="btn btn-outline-success" runat="server" />
                        <a href="Default.aspx" class="btn btn-outline-primary">Cancelar</a>
                    </div>



                    <asp:UpdatePanel runat="server">
                        <ContentTemplate>
                            <div class="mt-3">
                                <asp:Button Text="Eliminar" ID="btnEliminar" OnClick="btnEliminar_Click" CssClass="btn btn-outline-danger" runat="server" />
                                <%if (confirmaEliminacion)
                                    {   %>
                                <div class="alert alert-warning mt-3">
                                    <div class="d-flex align-items-start gap-2">
                                        <asp:CheckBox CssClass="checkbox-fix" ID="chkConfirmaEliminacion" runat="server" />
                                        <label class="mb-0" for="<%= chkConfirmaEliminacion.ClientID %>">¿Confirmar eliminación? Esta acción no se puede deshacer</label>
                                    </div>
                                    <asp:Button Text="Eliminar definitivamente" OnClick="btnEliminarConfirmado_Click" CssClass="btn btn-danger mt-3" ID="btnEliminarConfirmado" runat="server" />
                                </div>
                                <% } %>
                            </div>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>

                <div class="col-12 col-lg-6">
                    <div class="mb-3">
                        <div class="mb-3">
                            <asp:Label class="form-label" runat="server" Text="Descripción"></asp:Label>
                            <asp:TextBox CssClass="form-control shadow-sm" ID="txtDescripcion" runat="server" />
                        </div>
                        <asp:UpdatePanel ID="updatePanel1" runat="server">
                            <ContentTemplate>
                                <div class="card p-3">
                                    
                                        <label for="txtUrlImagen" class="form-label">URL Imagen</label>
                                        <asp:TextBox ID="txtImagenUrl" class="form-control shadow-sm" AutoPostBack="true"
                                            OnTextChanged="txtImagenUrl_TextChanged" runat="server" />
                                    
                                    <h6 class="mt-2">Vista previa</h6>
                                    <asp:Image
                                        onerror="this.onerror=null; this.src='/Images/Fallback.png';"
                                        Style="max-height: 300px; object-fit: contain;" ID="imgArticulo" runat="server" />
                                    </div>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                </div>

            </div>
        </div>
    </div>
</asp:Content>
