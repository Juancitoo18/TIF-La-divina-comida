<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Nosotros1.aspx.cs" Inherits="Vistas.Nosotros1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="icon" type="image/png" href="img/icono.png" />
    <link rel="styleSheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.4/font/bootstrap-icons.css" />
    <link href="Style.css" rel="StyleSheet" type="text/css" />
    <script src="https://kit.fontawesome.com/0440de58e7.js" crossorigin="anonymous"></script>
    <title>La Divina Comidad | Contacto</title>
    <style>
        .label {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            align-items: center;
        }
        .link-sin-estilo {
            text-decoration: none;
            color: inherit; 
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
                    <a href="PerfilUsuario.aspx" class="link-sin-estilo">
                        <b><asp:Label ID="LbUsuario" runat="server"></asp:Label></b>
                    </a>
                </div>
                <asp:HyperLink ID="hlCerrarSesion" runat="server" class="link" NavigateUrl="~/IniciarSesion.aspx">Cerrar Sesión</asp:HyperLink>
            </div>
        </header>
        <main class="nosotros">
            <h1>NOSOTROS</h1>
            <div class="nosotros_descripcion">
                <p>
                Iniciando este nuevo año con mucho esfuerzo y visión de futuro en nuestro pequeño emprendimiento, con ganas de crecer, presentamos con entusiasmo 'La Divina Comida', un restaurante con una especialización en brindar un servicio de entrega a domicilio. 
                </p>
                <p>
                    Hemos decidido adaptarnos a las necesidades de nuestros clientes y ofrecerles la comodidad de disfrutar de nuestros deliciosos platillos de alta calidad en la comodidad de su hogar. <br />
                    Con cada plato que preparamos, ponemos todo nuestro empeño y dedicación, y esperamos que nuestros clientes lo disfruten tanto como nosotros disfrutamos preparándolo para ellos.
                </p>
            </div>
            <img src="img/restaurante.jpg" alt="restaurante" />
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
