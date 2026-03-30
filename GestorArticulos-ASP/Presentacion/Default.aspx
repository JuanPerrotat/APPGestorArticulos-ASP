<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Presentacion.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Content/Estilos.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container mt-6">
        <div class="hero-banner mb-5">
            <div class="hero-content text-center text-md-start">
                <h1 class="hero-title">Stocker</h1>
                <p class="hero-subtitle">Gestioná tu inventario de forma simple, rápida y profesional</p>

            </div>
        </div>
        <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-4">
            <asp:Repeater ID="repRepetidor" runat="server">
                <ItemTemplate>
                    <div class="col">
                        <div class="card h-100 shadow-sm card-articulo">
                            <img src="<%#Eval("ImagenUrl") %>" onerror="this.onerror=null; this.src='Images/Fallback.png';"
                                id="imgArticulo" class="card-img-top img-articulo" alt="imgArticulo">
                            <div class="card-body d-flex flex-column">
                                <h5 class="card-title"><%#Eval("Nombre") %></h5>
                                <p class="card-text text-muted flex-grow-1"><%#Eval("Descripcion") %></p>
                                <p class="fw-bold precio mb-2">$ <%#Eval("Precio", "{0:N2}") %></p>
                                <a href="Detalle.aspx?Id=<%#Eval("Id") %>" class="btn btn-detalle btn-dark mx-auto mt-auto d-block">Ver detalle</a>
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </div>
</asp:Content>
