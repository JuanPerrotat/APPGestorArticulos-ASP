<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Presentacion.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
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

    <div class="container mt-4">
        <h1>Artículos disponibles</h1>
        <br />
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
