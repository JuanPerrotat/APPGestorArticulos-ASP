<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="MiPerfil.aspx.cs" Inherits="Presentacion.MiPerfil" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="row justify-content-center mt-4">

        <div class="col-12 col-lg-8">

            <div class="card shadow-sm">
                <div class="card-body">

                    <h3 class="mb-4 text-center">Mí Perfil</h3>
                    <asp:Panel ID="pnlAltaUser" runat="server" Visible="false" CssClass="alert alert-success text-center">
                        <i class="bi bi-check-circle-fill"></i>
                        <asp:Label ID="lblMensajeExito" CssClass="ms-2" runat="server" />
                    </asp:Panel>


                    <div class="row g-4">
                        <div class="col-12 col-md-6">

                            <div class="mb-3">
                                <asp:Label Text="Email" CssClass="form-label" runat="server" />
                                <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" TextMode="Email" />
                            </div>
                            <div class="mb-3">
                                <asp:Label Text="Nombre" CssClass="form-label" runat="server" />
                                <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control" />
                            </div>
                            <div class="mb-3">
                                <asp:Label Text="Apellido" CssClass="form-label" runat="server" />
                                <asp:TextBox ID="txtApellido" runat="server" CssClass="form-control" required="false" />
                            </div>
                        </div>

                        <div class="col-12 col-md-6 text-center">

                            <asp:Image
                                onerror="this.onerror=null; this.src='/Images/Fallback.png';"
                                ID="imgNuevoPerfil" CssClass="img-thumbnail mb-3" runat="server" />

                            <asp:FileUpload ID="txtImagen" onchange="previewImage(this)" runat="server" class="form-control" />

                        </div>
                    </div>
                    <div class="d-flex flex-column flex-md-row gap-2 mt-4 justify-content-end">

                        <asp:Button Text="Guardar" CssClass="btn btn-primary" OnClick="btnGuardar_Click" ID="btnGuardar" runat="server" />
                        <asp:Button Text="Regresar" CssClass="btn btn-outline-secondary" OnClick="btnRegresar_Click" ID="btnRegresar" runat="server" />

                    </div>
                </div>
            </div>
        </div>
    </div>
    <script>
        function previewImage(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();

                reader.onload = function (e) {
                    var img = document.getElementById('<%= imgNuevoPerfil.ClientID %>');
                    img.src = e.target.result;
                };

                reader.readAsDataURL(input.files[0]);
            }
        }
    </script>
</asp:Content>
