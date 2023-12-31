<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CarritoPedidoActual.aspx.cs" Inherits="Vistas.CarritoPedidoActual" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="icon" type="image/png" href="img/icono.png" />
    <link rel="styleSheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.4/font/bootstrap-icons.css" />
    <link href="Style.css" rel="StyleSheet" type="text/css" />
    <script src="https://kit.fontawesome.com/0440de58e7.js" crossorigin="anonymous"></script>
    <title>La divina Comida | Carrito de compras</title>
    <style type="text/css">
        .auto-style1 {
            font-size: xx-large;
        }
        .label {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            align-items: center;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
            <header class="header">
            <div class="logo">
                <a href="Menu.aspx">
                    <img class="logo_img" src="img/logo.png" />
                </a>
            </div>
            <div class="menu">
                <asp:HyperLink ID="hlMenu" runat="server" NavigateUrl="~/Menu.aspx" class="link">Menú</asp:HyperLink>
                <asp:HyperLink ID="hlNosotros" runat="server" NavigateUrl="~/Nosotros1.aspx" class="link">Nosotros</asp:HyperLink>
                <asp:HyperLink ID="hlContacto" runat="server" NavigateUrl="~/Contacto.aspx" class="link">Contacto</asp:HyperLink>
                <asp:HyperLink ID="hlPerfilUsuario" runat="server" NavigateUrl="~/PerfilUsuario.aspx" class="link">Mi perfil</asp:HyperLink>
                <asp:HyperLink ID="hlCarrito" runat="server" class="link" NavigateUrl="~/CarritoPedidoActual.aspx"><svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-shopping-cart" width="48" height="48" viewBox="0 0 24 24" stroke-width="2" stroke="#ffffff" fill="none" stroke-linecap="round" stroke-linejoin="round">
                <path stroke="none" d="M0 0h24v24H0z" fill="none"/>
                <path d="M6 19m-2 0a2 2 0 1 0 4 0a2 2 0 1 0 -4 0" />
                <path d="M17 19m-2 0a2 2 0 1 0 4 0a2 2 0 1 0 -4 0" />
                <path d="M17 17h-11v-14h-2" />
                <path d="M6 5l14 1l-1 7h-13" />
                </svg></asp:HyperLink>
                <div class="label">
                 <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-user-circle" width="56" height="56" viewBox="0 0 24 24" stroke-width="1.5" stroke="#ffffff" fill="none" stroke-linecap="round" stroke-linejoin="round">
                  <path stroke="none" d="M0 0h24v24H0z" fill="none"/>
                  <path d="M12 12m-9 0a9 9 0 1 0 18 0a9 9 0 1 0 -18 0" />
                  <path d="M12 10m-3 0a3 3 0 1 0 6 0a3 3 0 1 0 -6 0" />
                  <path d="M6.168 18.849a4 4 0 0 1 3.832 -2.849h4a4 4 0 0 1 3.834 2.855" />
                </svg>
                    <b><asp:Label ID="LbUsuario" runat="server"></asp:Label> </b>
                </div>
                <asp:HyperLink ID="hlCerrarSesion" runat="server" class="link" NavigateUrl="~/IniciarSesion.aspx">Cerrar Sesión</asp:HyperLink>
            </div>
        </header>
        <main class="ContenedorRegister">
            <div style="height: 600px;" class="descripcionContacto">

                <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />
&nbsp;<strong><asp:Label ID="lblCarrito" runat="server" Text="CARRITO DE COMPRAS" CssClass="auto-style1"></asp:Label>
                </strong>
                <br />
                <br />
                <asp:GridView ID="gvCarrito" runat="server" CssClass="gridview">
                </asp:GridView>
                <asp:Label ID="lblVacio" runat="server"></asp:Label>
                <br />
                <strong>
                <asp:Label ID="lblTextoTotal" runat="server"></asp:Label>
                <asp:Label ID="lblTotal" runat="server"></asp:Label>
                </strong>
                <br />
                <br />
                <script type="text/javascript">
                    function mostrarVentanaVaciar() {
                        if (confirm('¿Deseas vaciar el carrito?')) {
                            // El usuario hizo clic en "Aceptar"
                            __doPostBack('<%= btnVaciar.UniqueID %>', '');
                        } else {
                            // El usuario hizo clic en "Cancelar"
                            alert('Acción cancelada');
                        }
                    }
                    function mostrarVentanaComprar() {
                        if (confirm('¿Deseas realizar la compra?')) {
                            // El usuario hizo clic en "Aceptar"
                            __doPostBack('<%= btnComprar.UniqueID %>', '');
                          } else {
                          // El usuario hizo clic en "Cancelar"
                          alert('Acción cancelada');
                         }
                     }
                </script>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="btnComprar" runat="server" class="button" Text="Comprar" OnClientClick="mostrarVentanaComprar(); return false;" OnClick="btnComprar_Click" />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="btnVaciar" runat="server" class="button" Text="Vaciar carrito" OnClientClick="mostrarVentanaVaciar(); return false;" OnClick="btnVaciar_Click" />

                <br />
                <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                
            </div>
        </main>
                        <footer class="footer" id="foter">
            <div class="grupo-1">
                <div class="box">
                    <figure>
                        <a href="#">
                            <p>La Divina Comida </p>
                        </a>
                    </figure>
                </div>
                <div class="box">
                    <h2>Creado por:</h2>
                    <p>Fernandez, Juan Manuel - Trebbaiocchi, Mateo - Vera, Tamara Soledad - Correa, Elizabeth Florencia Solana - Rios, Juan José</p>
                </div>
                <div class="box">
                    <h2>SIGUENOS</h2>
                    <div class="red-social">
                        <a href="https://www.facebook.com" class="fa fa-facebook" target="_blank"></a>
                        <a href="https://www.instagram.com" class="fa fa-instagram" target="_blank"></a>
                        <a href="https://twitter.com" class="fa fa-twitter" target="_blank"></a>
                    </div>
                </div>
            </div>
            <div class="grupo-2">
                <small>&copy; 2023 <b>La Divina Comida</b> - Todos los Derechos Reservados.</small>
            </div>
        </footer>
        
    </form>
</body>
</html>
