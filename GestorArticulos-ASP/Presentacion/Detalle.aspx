<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Detalle.aspx.cs" Inherits="Presentacion.Detalle" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container mt-4">
        <div class="card shadow-lg p-4">
            <div class="row g-4">

                <!-- Imagen -->
                <div class="col-md-5 text-center">
                    <asp:Image ID="imgArticulo" runat="server" CssClass="img-fluid rounded"
                        onerror="this.onerror=null; this.src='Images/Fallback.png';" />
                </div>

                <!-- Datos -->
                <div class="col-md-7">
                    <h2 class="mb-3">
                        <asp:Label ID="lblNombre" runat="server" />
                    </h2>

                    <p class="text-muted">
                        <asp:Label ID="lblDescripcion" runat="server" />
                    </p>

                 
                       
                        <asp:Label CssClass="fs-4 fw-bold text-success" ID="lblPrecio" runat="server" />
                    

                    <hr />

                    <p><strong>Categoría:</strong>
                        <asp:Label ID="lblCategoria" runat="server" /></p>
                    <p><strong>Marca:</strong>
                        <asp:Label ID="lblMarca" runat="server" /></p>

                    <a href="Default.aspx" class="btn btn-outline-dark mt-3">Volver</a>
                </div>

            </div>
        </div>
    </div>

</asp:Content>
