<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Reporte.aspx.cs" Inherits="Vistas.Reporte" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="icon" type="image/png" href="img/icono.png" />
    <link rel="styleSheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.4/font/bootstrap-icons.css" />
    <link href="Style.css" rel="StyleSheet" type="text/css" />
    <script src="https://kit.fontawesome.com/0440de58e7.js" crossorigin="anonymous"></script>
    <title>La divina Comida | Reporte</title>
    <style type="text/css">
        .auto-style1 {
            font-size: small;
        }
        .auto-style2 {
            font-size: large;
        }
        .auto-style4 {
            width: 100%;
            height: 291px;
        }
        .auto-style5 {
            height: 10px;
        }
        .auto-style6 {
            height: 10px;
            width: 533px;
        }
        .auto-style7 {
            font-size: x-large;
        }
        .auto-style8 {
            color: #FF0000;
        }
        .blanco {
            margin-top: 7%;
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
        <main>
        <div style="height:760px; width:100% " class="margen20">
            <strong>
            <br />
            <asp:Label ID="Label1" runat="server" CssClass="auto-style1" Text="Reporte de Ingresos" style="font-size: x-large"></asp:Label>
            <br />
            <br />
            </strong>
            <asp:Label ID="Label5" runat="server" Text="A continuación, podrá ver el ingreso de dinero que generaron las ventas" CssClass="auto-style2"></asp:Label>
            <br />
            <br />
            <br />
            <asp:Label ID="Label2" runat="server" Text="Porfavor, elija un intervalo de fechas para ver el reporte" CssClass="auto-style2"></asp:Label>
            <br />
            <table class="auto-style4">
                <tr>
                    <td class="auto-style6">
                        <br />
            <asp:Label ID="Label3" runat="server" Text="Fecha de inicio:" CssClass="auto-style7"></asp:Label>
&nbsp; <strong>
            <asp:Label ID="lblInicio" runat="server"></asp:Label>
                        </strong>
                        <br />
                        <br />
                        <asp:Calendar ID="cInicio" runat="server" BackColor="White" BorderColor="Black" BorderStyle="Solid" CellSpacing="1" Font-Names="Verdana" Font-Size="9pt" ForeColor="Black" Height="250px" NextPrevFormat="ShortMonth" OnSelectionChanged="Calendar1_SelectionChanged" Width="330px">
                <DayHeaderStyle Font-Bold="True" Font-Size="8pt" ForeColor="#333333" Height="8pt" />
                <DayStyle BackColor="#CCCCCC" />
                <NextPrevStyle Font-Bold="True" Font-Size="8pt" ForeColor="White" />
                <OtherMonthDayStyle ForeColor="#999999" />
                <SelectedDayStyle BackColor="#333399" ForeColor="White" />
                <TitleStyle BackColor="#333399" BorderStyle="Solid" Font-Bold="True" Font-Size="12pt" ForeColor="White" Height="12pt" />
                <TodayDayStyle BackColor="#999999" ForeColor="White" />
            </asp:Calendar>
                    </td>
                    <td class="auto-style5">
                        <br />
            <asp:Label ID="Label4" runat="server" Text="Fecha de Fin:" CssClass="auto-style7"></asp:Label>
&nbsp; <strong>
                        <asp:Label ID="lblFin" runat="server"></asp:Label>
                        </strong>
                        <br />
                        <br />
                        <asp:Calendar ID="cFin" runat="server" BackColor="White" BorderColor="Black" BorderStyle="Solid" CellSpacing="1" Font-Names="Verdana" Font-Size="9pt" ForeColor="Black" Height="250px" NextPrevFormat="ShortMonth" OnSelectionChanged="cFin_SelectionChanged" Width="330px">
                            <DayHeaderStyle Font-Bold="True" Font-Size="8pt" ForeColor="#333333" Height="8pt" />
                            <DayStyle BackColor="#CCCCCC" />
                            <NextPrevStyle Font-Bold="True" Font-Size="8pt" ForeColor="White" />
                            <OtherMonthDayStyle ForeColor="#999999" />
                            <SelectedDayStyle BackColor="#333399" ForeColor="White" />
                            <TitleStyle BackColor="#333399" BorderStyle="Solid" Font-Bold="True" Font-Size="12pt" ForeColor="White" Height="12pt" />
                            <TodayDayStyle BackColor="#999999" ForeColor="White" />
                        </asp:Calendar>
                    </td>
                    
                </tr>


                <tr>
                    <td class="auto-style6">&nbsp;</td>
                    <td class="auto-style5">&nbsp;</td>
                    
                </tr>


            </table>
            <br />
&nbsp;&nbsp;&nbsp;<br />
            <br />
            <asp:Button ID="btnVerReporte" runat="server" Text="Ver reporte" class="button" Height="51px" OnClick="btnVerReporte_Click" Width="142px" />
            &nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;<asp:Label ID="lblError" runat="server" CssClass="auto-style8"></asp:Label>
            <br />
            &nbsp;
            <br />
            <br />
            <strong>
            <asp:Label ID="lblResultado" runat="server" CssClass="auto-style7"></asp:Label>
            </strong>
            <br />
            &nbsp;&nbsp;&nbsp;
            </div>
        </main>
        <div class="blanco">

            </div>
         <footer class="footer" id="foter">
                    <div class="grupo-2">
                        <small>&copy; 2023 <b>La Divina Comida</b> - Todos los Derechos Reservados.</small>
                    </div>
                </footer>
    </form>
</body>
</html>
