<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Error.aspx.cs" Inherits="Presentacion.Error" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container d-flex justify-content-center align-items-center" style="min-height: 70vh;">
        <div class="card shadow-sm p-4 text-center" style="max-width: 500px; width: 100%;">

            <div class="mb-3">
                <i class="bi bi-exclamation-triangle-fill text-danger" style="font-size: 3rem;"></i>
            </div>

            <h3 class="mb-2">Ocurrió un error</h3>

            <asp:Label CssClass="text-muted" ID="lblError" runat="server" />

            <div class="mt-4">
                <asp:Button Text="Volver al inicio" OnClick="btnRegresar_Click"
                    ID="btnRegresar" CssClass="btn btn-primary px-4" runat="server" />
            </div>

        </div>
    </div>


</asp:Content>
