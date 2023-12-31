<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AgregarProducto.aspx.cs" Inherits="Vistas.AgregarProducto" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="icon" type="image/png" href="img/icono.png" />
    <link rel="styleSheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.4/font/bootstrap-icons.css" />
    <link href="Style.css" rel="StyleSheet" type="text/css" />
    <script src="https://kit.fontawesome.com/0440de58e7.js" crossorigin="anonymous"></script>
    <title>La divina Comida | Carrito de compras</title>

    <style>

        main {
            margin-top: 30px;
            margin-bottom: 30px;
        }

        .Contenedor-agregar {
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: start;
            height: 100%;
            margin-left: 5px;
            font-size: 25px;
            padding-left: 30px;
        }

        .Contenedor-agregar p {
        text-align: justify;
        padding: 3%;
        margin: 0;
        }

        .volver {
            font-size: 25px;
        }

        input {
            font-size: 20px;
        }

        .ddl {
            font-size: 23px;
        }

        .blanco1 {
            margin-top: 8%;
        }
    </style>

</head>
<body>
    <form id="form1" runat="server">
            <header class="header">
            <div class="logo">
                <a href="AgregarProducto.aspx">
                    <img class="logo_img" src="img/logo.png" />
                </a>
            </div>
            <div class="menu">
                <asp:HyperLink ID="hlAgregarProducto" runat="server" NavigateUrl="~/AgregarProducto.aspx" class="link">Agregar Producto</asp:HyperLink>
                <asp:HyperLink ID="hlEditarProducto" runat="server" NavigateUrl="~/EditarProductos.aspx" class="link">Editar/Eliminar Producto</asp:HyperLink>
                <asp:HyperLink ID="hlPedidos" runat="server" NavigateUrl="~/Pedidos.aspx" class="link">Pedidos</asp:HyperLink>
                <asp:HyperLink ID="hlReportes" runat="server" NavigateUrl="~/Reporte.aspx" class="link">Reporte</asp:HyperLink>
                <asp:HyperLink ID="hlCuentas" runat="server" NavigateUrl="~/Cuentas.aspx" class="link">Cuentas</asp:HyperLink>
                <asp:HyperLink ID="hlCerrarSesion" runat="server" class="link" NavigateUrl="~/IniciarSesion.aspx">Cerrar Sesión</asp:HyperLink>
            </div>
        </header>
        <main class="ContenedorRegister">
                <div class="FormR">
                    <h1 style="text-align: center">Agregar Productos</h1>
                    <div class="Contenedor-agregar">
                        <p>
                            <b>Seleccione Categoria:&nbsp;&nbsp;&nbsp;&nbsp; </b>&nbsp;<asp:DropDownList ID="ddlCategoria" runat="server" CssClass="ddl">
                            </asp:DropDownList>
                        </p>
                        <p>
                            <b>Seleccione Tipo:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </b>
                            <asp:DropDownList ID="ddlTipo" runat="server" CssClass="ddl">
                            </asp:DropDownList>
                        </p>
                        <p>
                            <b>Stock:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </b><asp:TextBox ID="TxtStock" runat="server" ValidationGroup="AgregarProducto"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvStock" runat="server" ControlToValidate="TxtStock" ErrorMessage="Ingrese stock" ForeColor="Red" ValidationGroup="AgregarProducto">*</asp:RequiredFieldValidator>
                            <asp:CompareValidator ID="cvStock" runat="server" ControlToValidate="TxtStock" ErrorMessage="Ingrese stock mayor a 0" ForeColor="Red" Type="Integer" ValidationGroup="AgregarProducto" ValueToCompare="0" Operator="GreaterThan">*</asp:CompareValidator>
                        </p>
                        <p>
                            <b>Nombre :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </b>&nbsp;<asp:TextBox ID="TxtNombre" runat="server" ValidationGroup="AgregarProducto"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvNombre" runat="server" ControlToValidate="TxtNombre" ErrorMessage="Ingrese un nombre" ForeColor="Red" ValidationGroup="AgregarProducto">*</asp:RequiredFieldValidator>
                        </p>
                        <p>
                            <b>Descripcion :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </b>
                            &nbsp;<asp:TextBox ID="TxtDescripcion" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvDescripcion" runat="server" ControlToValidate="TxtDescripcion" ErrorMessage="Escriba una descripción" ForeColor="Red" ValidationGroup="AgregarProducto">*</asp:RequiredFieldValidator>
                        </p>
                        <p>
                            <b>Precio Unitario :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </b>&nbsp;<asp:TextBox ID="TxtPrecioUnitario" runat="server" ValidationGroup="AgregarProducto"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvPrecio" runat="server" ControlToValidate="TxtPrecioUnitario" ErrorMessage="Ingrese precio" ForeColor="Red" ValidationGroup="AgregarProducto">*</asp:RequiredFieldValidator>
                            <asp:CompareValidator ID="cvPrecio" runat="server" ControlToValidate="TxtPrecioUnitario" ErrorMessage="Ingrese un precio mayor a 0" ForeColor="Red" Type="Integer" ValidationGroup="AgregarProducto" ValueToCompare="0" Operator="GreaterThan">*</asp:CompareValidator>
                        </p>
                         <p>
                            <b>Url Link Imagenes :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </b>&nbsp;<asp:TextBox ID="TxtImagenes" runat="server" ValidationGroup="AgregarProducto"></asp:TextBox>
                             <asp:RequiredFieldValidator ID="rfvImagenURL" runat="server" ControlToValidate="TxtImagenes" ErrorMessage="Ingrese URL de la imagen" ForeColor="Red" ValidationGroup="AgregarProducto">*</asp:RequiredFieldValidator>
                        </p> 
                    </div>
                    <div  class="volver" >
                        <p>Guardar Registro: </p>
                            <asp:Button ID="BtnAceptar" runat="server" Text="Aceptar" OnClick="BtnAceptar_Click" ValidationGroup="AgregarProducto" />
                        <asp:ValidationSummary ID="vsRequired" runat="server" ShowMessageBox="True" ShowSummary="False" ValidationGroup="AgregarProducto" />
                        <br />
                    </div>
                    <br />
                </div>

        </main>
            <div class="blanco1">

            </div>
        <footer class="footer" id="foter">
                    <div class="grupo-2">
                        <small>&copy; 2023 <b>La Divina Comida</b> - Todos los Derechos Reservados.</small>
                    </div>
                </footer>
    </form>
</body>
</html>
