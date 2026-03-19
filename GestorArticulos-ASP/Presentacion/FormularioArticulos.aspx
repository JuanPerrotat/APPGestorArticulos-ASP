<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="FormularioArticulos.aspx.cs" Inherits="Presentacion.FormularioArticulos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
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
                <asp:Label class="form-label" runat="server" Text="Nombre"></asp:Label>
                <asp:TextBox CssClass="form-control" ID="txtCódigo" runat="server" />
            </div>
            <div class="mb-3">
                <asp:Label class="form-label" runat="server" Text="Código"></asp:Label>
                <asp:TextBox CssClass="form-control" ID="txtNombre" runat="server" />
            </div>
            <div class="mb-3">
                <asp:Label class="form-label" runat="server" Text="Categoría"></asp:Label>
                <asp:DropDownList ID="ddlCategoria" CssClass="form-select" runat="server"></asp:DropDownList>
            </div>
            <div class="mb-3">
                <asp:Label class="form-label" runat="server" Text="Marca"></asp:Label>
                <asp:DropDownList ID="ddlMarca" CssClass="form-select" runat="server"></asp:DropDownList>
            </div>
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
                            Width="60%" Id="imgArticulo" runat="server" />
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>
    </div>
</asp:Content>
