<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="AltaUser.aspx.cs" Inherits="Presentacion.AltaUser" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Panel runat="server" DefaultButton="btnRegistrarse">
        <div class="row justify-content-center align-items-center mt-5">

            <div class="col-12 col-md-8 col-lg-5">

                <div class="card shadow-lg border-0 rounded-4 card-login">
                    <div class="card-body p-4 p-md-5">


                        <h2 class="mb-4 text-center fw-semibold">Crea tú usuario</h2>

                        <div class="form-group mb-3 form-group">
                            <asp:Label Text="Nombre" required="required" ID="lblNombre" CssClass="form-label" runat="server" />
                            <asp:TextBox ID="txtNombre" required="required" TextMode="SingleLine" MaxLength="50" CssClass="form-control" runat="server" />
                            <div class="invalid-feedback"></div>
                        </div>

                        <div class="mb-3 form-group">
                            <asp:Label Text="Email" CssClass="form-label" runat="server" />
                            <asp:TextBox ID="txtMail" required="required" TextMode="Email" MaxLength="100" CssClass="form-control" runat="server" />
                            <div class="invalid-feedback"></div>
                        </div>

                        <div class="mb-3 form-group">
                            <asp:Label Text="Contraseña" CssClass="form-label" runat="server" />
                            <div class="input-group">
                                <asp:TextBox ID="txtPassword" MaxLength="20" required="required" TextMode="Password" CssClass="form-control" runat="server" />
                                <button type="button" id="btnEyeRegister" class="btn btn-outline-secondary" onclick="togglePasswordRegister()">
                                    <i id="iconEyeRegister" class="bi bi-eye"></i>
                                </button>
                                <div class="invalid-feedback"></div>
                            </div>
                        </div>

                        <div class="d-grid gap-2 mt-4">
                            <asp:Button Text="Registrarse" ID="btnRegistrarse"
                                CssClass="btn btn-primary btn-lg"
                                OnClientClick="return validarFormulario()"
                                OnClick="btnRegistrarse_Click" runat="server" />


                            <asp:Button Text="Cancelar" ID="btnCancelar"
                                CssClass="btn btn-outline-secondary"
                                CausesValidation="false"
                                UseSubmitBehavior="false"
                                OnClick="btnCancelar_Click" runat="server" />

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </asp:Panel>
    <script>
        function togglePasswordRegister() {
            var passInput = document.getElementById('<%= txtPassword.ClientID %>');
            var icon = document.getElementById('iconEyeRegister');

            if (passInput.type === "password") {
                passInput.type = "text";
                icon.classList.remove("bi-eye");
                icon.classList.add("bi-eye-slash");
            } else {
                passInput.type = "password";
                icon.classList.remove("bi-eye-slash");
                icon.classList.add("bi-eye");
            }
        }
    </script>
</asp:Content>
