﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="Vistas.Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="icon" type="image/png" href="img/icono.png" />
    <link rel="styleSheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.4/font/bootstrap-icons.css" />
    <link href="Style.css" rel="StyleSheet" type="text/css" />
    <script src="https://kit.fontawesome.com/0440de58e7.js" crossorigin="anonymous"></script>
    <title>La Divina Comidad | Iniciar Sesión</title>

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
                <h1>REGISTER</h1>
            </div>
        </header>
        <main class="ContenedorRegister">
                <div class="FormR">
                    <h1 style="text-align: center">Registrar usuario</h1>
                    <div class="Contenedor-pr">
                        <p>
                            <b>Usuario:</b>  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox ID="TxtUsuario" runat="server" style="font-size:20px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RfvUsuario" runat="server" ControlToValidate="TxtUsuario" ErrorMessage="Complete el campo"></asp:RequiredFieldValidator>
                        </p>
                        <p>
                            <b>Nombre completo:</b>  &nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:TextBox ID="TxtNombre" runat="server" style="font-size:20px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RfvNombre" runat="server" ControlToValidate="TxtNombre" ErrorMessage="Complete el campo"></asp:RequiredFieldValidator>
                        </p>
                        <p>
                            <b>Mail: </b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:TextBox ID="TxtMail" runat="server" style="font-size:20px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RfvMail" runat="server" ControlToValidate="TxtMail" ErrorMessage="Complete el campo"></asp:RequiredFieldValidator>
                        </p>
                        <p>
                            <b>Contraseña:</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp;<asp:TextBox ID="TxtContraseña" runat="server" TextMode="Password" style="font-size:20px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RfvContra" runat="server" ControlToValidate="TxtContraseña" ErrorMessage="Complete el campo"></asp:RequiredFieldValidator>
                        </p>
                        <p>
                            <b>Repetir Contraseña:</b>&nbsp;&nbsp
                            <asp:TextBox ID="TxtRepetirContraseña" runat="server" TextMode="Password" style="font-size:20px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RfvContraR" runat="server" ControlToValidate="TxtRepetirContraseña" ErrorMessage="Complete el campo"></asp:RequiredFieldValidator>
                            
                        </p> 
                        <asp:CompareValidator ID="CvContra" runat="server" ControlToCompare="TxtContraseña" ControlToValidate="TxtRepetirContraseña" ErrorMessage="La Contraseña no es la misma" ForeColor="Red"></asp:CompareValidator>
                        <asp:Label ID="LblMensaje" runat="server"></asp:Label>
                    </div>
                    <div  class="volver" >
                        <p style="font-size:20px">¿Tenes cuenta?&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href="./iniciarSesion.aspx" style="font-size:20px">Iniciar sesion</a> </p>
                        <br />
                    </div>
                    <div class="buttonR">
                        <asp:Button ID="BtnIniciar" runat="server" Text="Resgitrarme" OnClick="BtnIniciar_Click" Font-Bold="True" Font-Italic="False" Font-Size="20px" />
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
