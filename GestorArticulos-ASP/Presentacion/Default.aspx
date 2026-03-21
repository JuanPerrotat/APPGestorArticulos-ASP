<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Presentacion.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .hero-banner {
            background:  #f8f9fa;
            color: black;
            padding: 15px 8px;
            border-radius: 12px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.2);
        }

        .hero-content {
            max-width: 500px;
        }

        .hero-title {
            font-size: 2rem;
            font-weight: 700;
            margin-bottom: 6px;
        }

        .hero-subtitle {
            font-size: 1rem;
            opacity: 0.9;
        }

        .img-articulo {
            height: 200px;
            object-fit: contain;
            background-color: #f8f9fa
        }

        .card-articulo {
            border: none;
            border-radius: 12px;
            transition: transform 0.4s ease, box-shadow 0.2s ease;
        }

            .card-articulo:hover {
                transform: translateY(-10px);
                box-shadow: 0 10px 35px rgba(0,0,0,0.15);
            }

        .card-title {
            font-size: 1.1rem;
            font-weight: 600;
        }

        .card-text {
            font-size: 0.9rem;
        }

        .btn {
            border-radius: 8px;
        }

        .precio {
            color: #1a237e;
        }

        .btn-detalle {
            font-size: 0.8rem;
            padding: 10px 18px;
            display: block;
            margin: auto;
            width: 160px;
            border-radius: 6px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container mt-6">
        <%--<h1>Stock Manager</h1>
        <h6>Tu aplicación de control de stock</h6>
        <br />--%>
        <div class="hero-banner mb-5">
            <div class="hero-content text-center text-md-start">
                <h1 class="hero-title">Stock Manager</h1>
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
