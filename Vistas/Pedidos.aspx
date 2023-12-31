<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Pedidos.aspx.cs" Inherits="Vistas.Pedidos" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
        <link rel="icon" type="image/png" href="img/icono.png" />
    <link rel="styleSheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.4/font/bootstrap-icons.css" />
    <link href="Style.css" rel="StyleSheet" type="text/css" />
    <script src="https://kit.fontawesome.com/0440de58e7.js" crossorigin="anonymous"></script>
    <title>La divina Comida | Pedidos</title>
    <style type="text/css">
        .auto-style1 {
            font-size: large;
        }
        .auto-style2 {
            font-size: xx-large;
        }
        .auto-style3 {
            color: #FF0000;
        }
        .blanco {
            margin-top: 11%;
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
        <main class="margen20">
        <div style="height: 1600px;">
            <strong>
            <br />
            <br />
            <asp:Label ID="lblConfirmar" runat="server" CssClass="auto-style2" Text="Confirmar pedidos entregados"></asp:Label>
            <br />
            <br />
            <asp:Label ID="Label4" runat="server" Text="Ingrese número de factura de pedido a confirmar:" CssClass="auto-style1"></asp:Label>
&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="txtConfirmar" runat="server" Class="textbox" ValidationGroup="grupo1"></asp:TextBox>
&nbsp;&nbsp;&nbsp;
            <script type="text/javascript">
              function mostrarVentanaConfirmar() {
                  if (Page_ClientValidate('grupo1')) {
                      if (confirm('¿Deseas confirmar el pedido?')) {
                          // El usuario hizo clic en "Aceptar"
                          __doPostBack('<%= btnConfirmar.UniqueID %>', '');
                      } else {
                          // El usuario hizo clic en "Cancelar"
                          alert('Acción cancelada');
                      }
                  }
              }
            </script>
            <asp:Button ID="btnConfirmar" runat="server" OnClientClick="mostrarVentanaConfirmar(); return false;" OnClick="btnConfirmar_Click" Text="Confirmar" class="button" ValidationGroup="grupo1"/>
            <asp:RegularExpressionValidator ID="revConfirmar" runat="server" ControlToValidate="txtConfirmar" CssClass="auto-style1" ValidationExpression="^\d+$" ValidationGroup="grupo1">*Sólo se permiten números</asp:RegularExpressionValidator>
            <asp:RequiredFieldValidator ID="rfvConfirmar" runat="server" ControlToValidate="txtConfirmar" CssClass="auto-style1" ValidationGroup="grupo1">*Ingrese número de factura</asp:RequiredFieldValidator>
            <br />
            <br />
            <asp:Label ID="lblPendientes" runat="server" CssClass="auto-style3"></asp:Label>
            <asp:GridView ID="gvPendientes" runat="server" CssClass="gridview">
            </asp:GridView>
            <br />
            <br />
            <asp:Label ID="Label1" runat="server" CssClass="auto-style2" Text="Historial de pedidos"></asp:Label>
            </strong>
            <asp:GridView ID="gvVentas" runat="server" CssClass="gridview">
            </asp:GridView>
            <br />
            <br />
            <strong>
            <asp:Label ID="Label2" runat="server" CssClass="auto-style2" Text="Buscar detalles de un determinado pedido"></asp:Label>
            <br />
            <br />
&nbsp;<asp:Label ID="Label3" runat="server" Text="Ingrese número de factura:" CssClass="auto-style1"></asp:Label>
&nbsp;&nbsp;
            <asp:TextBox ID="txtNumFac" runat="server" Class="textbox" ValidationGroup="grupo2"></asp:TextBox>
&nbsp;&nbsp;&nbsp;
            <asp:Button ID="btnBuscar" runat="server" OnClick="btnBuscar_Click" Text="Buscar" class="button" ValidationGroup="grupo2" />
            <asp:RegularExpressionValidator ID="revDetalles" runat="server" ControlToValidate="txtNumFac" CssClass="auto-style1" ValidationExpression="^\d+$" ValidationGroup="grupo2">*Sólo se permiten números</asp:RegularExpressionValidator>
            <asp:RequiredFieldValidator ID="rfvDetalle" runat="server" ControlToValidate="txtNumFac" CssClass="auto-style1" ValidationGroup="grupo2">*Ingrese número de factura</asp:RequiredFieldValidator>
            <br />
            <br />
            <asp:Label ID="lblDetalleF" runat="server" CssClass="auto-style1"></asp:Label>
            <br />
            <asp:GridView ID="gvDetalles" runat="server" CssClass="gridview">
            </asp:GridView>
            </strong>
            </div>
            <div class="blanco">

            </div>
        </main>
         <footer class="footer" id="foter">
                    <div class="grupo-2">
                        <small>&copy; 2023 <b>La Divina Comida</b> - Todos los Derechos Reservados.</small>
                    </div>
                </footer>
    </form>
</body>
</html>
