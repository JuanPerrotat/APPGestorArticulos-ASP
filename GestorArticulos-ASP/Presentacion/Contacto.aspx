<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Contacto.aspx.cs" Inherits="Presentacion.Contacto" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" rel="stylesheet">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server" />
    <div class="container py-5">

        <div class="row justify-content-center">
            <div class="col-12 col-lg-10">

                <div class="card shadow-lg contacto-card p-4 p-md-5">

                    <!-- Header -->
                    <div class="text-center mb-4">
                        <h2 class="fw-bold">Contacto</h2>
                        <p class="text-muted mb-0">
                            Envianos un mensaje y te responderemos lo antes posible
                   
                        </p>
                    </div>
                    <asp:UpdatePanel ID="updContacto" runat="server">
                        <ContentTemplate>
                            <asp:UpdateProgress ID="updProgress" runat="server" AssociatedUpdatePanelID="updContacto">
                                <ProgressTemplate>
                                    <div class="text-center my-3">
                                        <span class="spinner-border text-primary"></span>
                                        <p>Enviando mensaje...</p>
                                    </div>
                                </ProgressTemplate>
                            </asp:UpdateProgress>

                            <asp:Panel ID="pnlExito" runat="server" Visible="false" CssClass="alert alert-success text-center mb-4">
                                <i class="bi bi-check-circle-fill"></i>
                                <strong>¡Mensaje enviado!</strong><br />
                                Gracias por contactarte. Te responderemos a la brevedad.
                            </asp:Panel>

                            <asp:Panel ID="pnlFormulario" runat="server">
                                <!-- Form -->
                                <div class="row">

                                    <!-- Email -->
                                    <div class="col-12 col-md-6 mb-3">
                                        <label class="form-label">Correo electrónico</label>
                                        <div class="input-group">
                                            <span class="input-group-text">
                                                <i class="bi bi-envelope"></i>
                                            </span>
                                            <asp:TextBox
                                                ID="txtMail"
                                                runat="server"
                                                TextMode="Email"
                                                Required="true"
                                                CssClass="form-control form-control-lg"
                                                placeholder="ejemplo@mail.com" />
                                        </div>
                                    </div>

                                    <!-- Asunto -->
                                    <div class="col-12 col-md-6 mb-3">
                                        <label class="form-label">Asunto</label>
                                        <div class="input-group">
                                            <span class="input-group-text">
                                                <i class="bi bi-chat-left-text"></i>
                                            </span>
                                            <asp:TextBox
                                                ID="txtAsunto"
                                                runat="server"
                                                CssClass="form-control form-control-lg"
                                                placeholder="Motivo del mensaje" />
                                        </div>
                                    </div>

                                    <!-- Mensaje -->
                                    <div class="col-12 mb-4">
                                        <label class="form-label">Mensaje</label>
                                        <asp:TextBox
                                            ID="txtMensaje"
                                            runat="server"
                                            TextMode="MultiLine"
                                            Rows="5"
                                            CssClass="form-control form-control-lg"
                                            placeholder="Escribí tu mensaje acá..." />
                                    </div>

                                    <!-- Botón -->
                                    <div class="col-12 d-grid">
                                        <asp:Button
                                            ID="btnEnviar"
                                            runat="server"
                                            Text="Enviar mensaje"
                                            CssClass="btn btn-primary btn-lg btn-enviar"
                                            OnClick="btnEnviar_Click" />
                                    </div>

                                </div>


                            </asp:Panel>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>

            </div>
        </div>

    </div>
</asp:Content>
