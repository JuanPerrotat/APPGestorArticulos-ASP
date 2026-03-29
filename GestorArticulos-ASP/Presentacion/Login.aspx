<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Presentacion.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container d-flex justify-content-center align-items-center" style="min-height: 80vh;">

        <div class="col-12 col-sm-10 col-md-6 col-lg-4">

            <div class="card shadow-lg border-0 rounded-4 p-4 fade-in">

                <div class="text-center mb-4">
                    <h2 class="fw-bold">Login</h2>
                    <p class="text-muted mb-0">Ingresá a tu cuenta</p>
                </div>

                <div class="mb-3">
                    <label class="form-label">Mail</label>
                    <asp:TextBox runat="server" ID="txtEmail" CssClass="form-control form-control-lg" />
                </div>

                <div class="mb-4">
                    <label class="form-label">Password</label>
                    <asp:TextBox runat="server" ID="txtPass" TextMode="Password" CssClass="form-control form-control-lg" />
                </div>
                <asp:Label
                    ID="lblError"
                    runat="server"
                    CssClass="alert alert-danger d-block text-center"
                    Visible="false">
                </asp:Label>

                <div class="d-grid gap-2">
                    <asp:Button
                        Text="Ingresar"
                        ID="btnIngresar"
                        OnClick="btnIngresar_Click"
                        CssClass="btn btn-primary btn-lg rounded-3"
                        runat="server" />

                    <asp:Button
                        Text="Cancelar"
                        ID="btnCancelar"
                        OnClick="btnCancelar_Click"
                        CssClass="btn btn-outline-secondary rounded-3"
                        runat="server" />
                </div>
                <hr />

                <div class="text-center mt-3">
                    <p class="mb-2 text-muted">¿No tenés cuenta?</p>

                    <asp:Button
                        Text="Crear usuario"
                        ID="btnCrearUsuario"
                        CssClass="btn btn-outline-primary rounded-3 px-4"
                        OnClick="btnCrearUsuario_Click"
                        runat="server" />
                </div>

            </div>

        </div>

    </div>

</asp:Content>
