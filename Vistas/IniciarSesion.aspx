<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="IniciarSesion.aspx.cs" Inherits="Vistas.IniciarSesion" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="icon" type="image/png" href="img/icono.png" />
    <link rel="styleSheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.4/font/bootstrap-icons.css" />
    <link href="Style.css" rel="StyleSheet" type="text/css" />
    <script src="https://kit.fontawesome.com/0440de58e7.js" crossorigin="anonymous"></script>
    <title>La Divina Comidad | Iniciar Sesión</title>
    <style>
            .menu h1{padding-right:20%;}
            .size {font-size: 25px;}
            .grupo1 {font-size: 20px;}
            .textBox {font-size: 20px;}
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <header class="header">
            <div class="logo">
                <a>
                    <img class="logo_img" src="img/logo.png" />
                </a>
            </div>
            <div class="menu">
                <h1>INICIO DE SESION</h1>
            </div>
        </header>
        <main class="Contenedor">
                <div class="Form">
                    <h1 style="text-align: center">Ingreso de usuario</h1>
                    <div class="Contenedor-p">
                        <p class="size">
                            <b>Usuario:</b>  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; 
                            <asp:TextBox ID="TxtUsuario" runat="server" class="textBox"></asp:TextBox>
                        </p>
                        <p class="size">
                            <b>Contraseña:</b>&nbsp;&nbsp; 
                            <asp:TextBox ID="TxtContraseña" runat="server" TextMode="Password" class="textBox"></asp:TextBox>
                        </p>
                        <p class="size">
                    <asp:Label ID="LblMensaje" runat="server"></asp:Label>
                        </p>
                        
                        <br />
                    </div>
                    <div  class="Regis" >
                        <a class="size" href="./Cambiar_contraseña.aspx">¿Olvidaste tu contraseña?</a><br /><br />
                        <p class="size">¿No tenes cuenta?&nbsp;&nbsp;&nbsp;&nbsp;&nbsp<a href="./Register.aspx">Registrate</a> </p>
                        <br />
                    </div>
                     <div class="buttonR">
                         <br />
                        <asp:Button ID="BtnIniciarSesion" runat="server" Text="Iniciar Sesion" OnClick="BtnIniciarSesion_Click" Font-Bold="True" Font-Size="25px" />
                         <br />
                         <br />
                    </div>
                    <br />
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
