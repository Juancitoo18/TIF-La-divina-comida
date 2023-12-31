<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Menu.aspx.cs" Inherits="Vistas.Menu" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="icon" type="image/png" href="img/icono.png" />
    <link rel="styleSheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.4/font/bootstrap-icons.css" />
    <link href="Style.css" rel="StyleSheet" type="text/css" />
    <script src="https://kit.fontawesome.com/0440de58e7.js" crossorigin="anonymous"></script>
    <title>La Divina Comidad | Menú</title>
    <style>
        .listview-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
        }
        .espaciado-borde-redondeado {
            background-color: #70F0E8;
            color: #333333;
            text-align: center;
            padding: 10px;
            border: 1px solid black;
            border-radius: 15px;
            position: relative; 
        }

        .contenedor-con-borde-redondeado {
            border: 50px solid #caf0f8;
            background: #caf0f8;
        }

        .mi-label {
            font-family: 'Open Sans', sans-serif; 
            font-size: 16px; 
            color: black; 
        }

        .Descripcion{
            background-color: #70F0E8;
            height: 100px;
            overflow: hidden;
        }
        .Descripcion p{
            text-align: start;
            margin-left: 35px;
        }
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

        .Busqueda {
            font-size: 1.5em;
        }

        #btnFiltrar {
            font-size: 20px;
        }

       #ddlOrdenarPrecio, #DdlTipoProducto {
           font-size: 20px;
       }

        input {
            font-size: 20px;
        }
        .auto-style1 {
            position: absolute;
            bottom: 583px;
            width: 100%;
            background-color: #0077b6;
            color: white;
            text-align: center;
            font-size: 15px;
            left: 0px;
        }
        td{
            background: #caf0f8;
        }
        td:empty{
            display:none;
        }
        table{
            background: #caf0f8;
        }

        .vacio{
            margin-bottom: 35%;
            font-size: 2em;
        }

    </style>
    <script type="text/javascript">
        function limpiarAviso() {
            setTimeout(function () {
                document.getElementById('<%= LblAviso.ClientID %>').innerText = '';
            }, 2000);
        }
    </script>
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
        <main>
            <div class="titulo-carrito">
                <h1 class="titulo-productos"><b>Productos</b></h1>
            </div>
             <p class="Busqueda">
                Busqueda:&nbsp;&nbsp;&nbsp;&nbsp; <asp:TextBox ID="TxtBusqueda" runat="server" style="margin: 0 auto;" Height="20px" Width="161px"></asp:TextBox>
            &nbsp;&nbsp;&nbsp;
             <asp:Button ID="btnFiltrar" runat="server" OnClick="btnFiltrar_Click" Text="Filtrar"/>
                 &nbsp;&nbsp;&nbsp; Tipo:&nbsp;&nbsp;&nbsp;
                 <asp:DropDownList ID="DdlTipoProducto" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DdlTipoProducto_SelectedIndexChanged">
                 </asp:DropDownList>
                 &nbsp;&nbsp;Ordenar por:&nbsp;
                 <asp:DropDownList ID="ddlOrdenarPrecio" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlOrdenarPrecio_SelectedIndexChanged">
                     <asp:ListItem Value="Nada">---Seleccione una opción---</asp:ListItem>
                     <asp:ListItem Value="Menor">Menor a mayor precio</asp:ListItem>
                     <asp:ListItem Value="Mayor">Mayor a menor precio</asp:ListItem>
                 </asp:DropDownList>
                 &nbsp;
                 <asp:Label ID="LblAviso" runat="server"></asp:Label>
                 </p>
            <div class="listview-container">
            <asp:ListView ID="LvProductos" runat="server" GroupItemCount="3" OnPagePropertiesChanged="LvProductos_PagePropertiesChanged">
                   <%-- <AlternatingItemTemplate>
                        <td runat="server" style="background-color: #FFFFFF;color: #284775;">NombreProducto_Pr:
                            <asp:Label ID="NombreProducto_PrLabel" runat="server" Text='<%# Eval("NombreProducto_Pr") %>' />
                            <br />Descripcion_Pr:
                            <asp:Label ID="Descripcion_PrLabel" runat="server" Text='<%# Eval("Descripcion_Pr") %>' />
                            <br />ImagenURL_Pr:
                            <asp:Label ID="ImagenURL_PrLabel" runat="server" Text='<%# Eval("ImagenURL_Pr") %>' />
                            <br />PrecioUnitario_Pr:
                            <asp:Label ID="PrecioUnitario_PrLabel" runat="server" Text='<%# Eval("PrecioUnitario_Pr") %>' />
                            <br /></td>
                    </AlternatingItemTemplate> --%>
                    <EditItemTemplate>
                        <td runat="server" style="background-color: #999999;">NombreProducto_Pr:
                            <asp:TextBox ID="NombreProducto_PrTextBox" runat="server" Text='<%# Bind("NombreProducto_Pr") %>' />
                            <asp:Label ID="LblId" runat="server" Text='<%# Eval("CodProducto_Pr") %>' Visible="False"></asp:Label>
                            <br />Descripcion_Pr:
                            <asp:TextBox ID="Descripcion_PrTextBox" runat="server" Text='<%# Bind("Descripcion_Pr") %>' />
                            <br />ImagenURL_Pr:
                            <asp:TextBox ID="ImagenURL_PrTextBox" runat="server" Text='<%# Bind("ImagenURL_Pr") %>' />
                            <br />PrecioUnitario_Pr:
                            <asp:TextBox ID="PrecioUnitario_PrTextBox" runat="server" Text='<%# Bind("PrecioUnitario_Pr") %>' />
                            <br />
                            <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Actualizar" />
                            <br />
                            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancelar" />
                            <br /></td>
                    </EditItemTemplate>
                    <EmptyDataTemplate>
                        <table runat="server" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;">              
                            <tr>
                                <td class="vacio">No se han devuelto datos.</td>
                            </tr>
                        </table>
                        <div class="vacio"></div>
                    </EmptyDataTemplate>
                    <EmptyItemTemplate>
<td runat="server" />
                    </EmptyItemTemplate>
                    <GroupTemplate>
                        <tr id="itemPlaceholderContainer" runat="server">
                            <td id="itemPlaceholder" runat="server"></td>
                        </tr>
                    </GroupTemplate>
                    <InsertItemTemplate>
                        <td runat="server" style="">NombreProducto_Pr:
                            <asp:TextBox ID="NombreProducto_PrTextBox" runat="server" Text='<%# Bind("NombreProducto_Pr") %>' />
                            <asp:Label ID="LblId" runat="server" Text='<%# Eval("CodProducto_Pr") %>' Visible="False"></asp:Label>
                            <br />Descripcion_Pr:
                            <asp:TextBox ID="Descripcion_PrTextBox" runat="server" Text='<%# Bind("Descripcion_Pr") %>' />
                            <br />ImagenURL_Pr:
                            <asp:TextBox ID="ImagenURL_PrTextBox" runat="server" Text='<%# Bind("ImagenURL_Pr") %>' />
                            <br />PrecioUnitario_Pr:
                            <asp:TextBox ID="PrecioUnitario_PrTextBox" runat="server" Text='<%# Bind("PrecioUnitario_Pr") %>' />
                            <br />
                            <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insertar" />
                            <br />
                            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Borrar" />
                            <br /></td>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <td runat="server" class="contenedor-con-borde-redondeado" >
                            <div class="espaciado-borde-redondeado">
                            <asp:Image ID="Image1" runat="server" Height="190px" style="vertical-align: middle;" ImageUrl= '<%# Eval("ImagenURL_Pr") %>' Width="215px" />
                            <br />
                            <div class="Descripcion"> 
                            <br />
                            <p> <b> Nombre:
                            <asp:Label ID="NombreProducto_PrLabel" runat="server" CssClass="mi-label" Text='<%# Eval("NombreProducto_Pr") %>' /> </b>  </p> 
                            <asp:Label ID="LblId" runat="server" Text='<%# Eval("CodProducto_Pr") %>' Visible="False"></asp:Label>
                            <p> <b> Precio:
                            <asp:Label ID="PrecioUnitario_PrLabel" runat="server" CssClass="mi-label"  Text='<%# Eval("PrecioUnitario_Pr") %>' /></b>  </p> 
                            </div>
                                <asp:Button ID="BtnAgregarCarrito" runat="server" Text="Agregar al Carrito" BackColor="#FFFFCC" Font-Bold="True" CommandArgument='<%# Eval("CodProducto_Pr") %>' CommandName="EventSeleccion1" OnCommand="BtnAgregarCarrito_Command" OnClientClick="limpiarAviso()"/>
                               
                            <br />
                           </div>     
                           </td>

                    </ItemTemplate>
                     
                    <LayoutTemplate>
                        <table runat="server">
                            <tr runat="server">
                                <td runat="server">
                                    <table id="groupPlaceholderContainer" runat="server" border="1" style="border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                                        <tr id="groupPlaceholder" runat="server">
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr runat="server">
                                <td runat="server" style="text-align: center;background-color: #5D7B9D;font-family: Verdana, Arial, Helvetica, sans-serif;color: #FFFFFF">
                                    <asp:DataPager ID="DataPager1" runat="server" PageSize="6">
                                        <Fields>
                                            <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                                            <asp:NumericPagerField />
                                            <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                                        </Fields>
                                    </asp:DataPager>
                                </td>
                            </tr>
                        </table>
                    </LayoutTemplate>
                    <SelectedItemTemplate>
                        <td runat="server" class="Descripcion">NombreProducto_Pr:
                            <asp:Label ID="NombreProducto_PrLabel" runat="server" Text='<%# Eval("NombreProducto_Pr") %>' />
                            <asp:Label ID="LblId" runat="server" Text='<%# Eval("CodProducto_Pr") %>' Visible="False"></asp:Label>
                            <br />Descripcion_Pr:
                            <asp:Label ID="Descripcion_PrLabel" runat="server" Text='<%# Eval("Descripcion_Pr") %>' />
                            <br />ImagenURL_Pr:
                            <asp:Label ID="ImagenURL_PrLabel" runat="server" Text='<%# Eval("ImagenURL_Pr") %>' />
                            <br />PrecioUnitario_Pr:
                            <asp:Label ID="PrecioUnitario_PrLabel" runat="server" Text='<%# Eval("PrecioUnitario_Pr") %>' />
                            <br /></td>
                    </SelectedItemTemplate>
                </asp:ListView>
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
