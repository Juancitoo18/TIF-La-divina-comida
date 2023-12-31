<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PerfilUsuario.aspx.cs" Inherits="Vistas.PerfilUsuario" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
        <link rel="icon" type="image/png" href="img/icono.png" />
    <link rel="styleSheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.4/font/bootstrap-icons.css" />
    <link href="Style.css" rel="StyleSheet" type="text/css" />
    <script src="https://kit.fontawesome.com/0440de58e7.js" crossorigin="anonymous"></script>
    <title>La divina comida | Perfil Usuario</title>
    <style type="text/css">
        .auto-style1 {
            font-size: x-large;
        }
        .auto-style2 {
            margin-left: 40px;
        }
        .auto-style3 {
            margin-left: 15px;
        }
        .centrar {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            align-items: center;
            
        }
        .label {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            align-items: center;
        }
        #lblUsuario {
            text-align:justify;
        }
        .Padre{
            display: flex;
            flex-direction: row;
            justify-content: space-evenly;
            align-items: center;
        }
        .blanco{
            margin-top: 11%;
        }
    </style>
    <script type="text/javascript">
        function limpiarAviso() {
            setTimeout(function () {
                document.getElementById('<%= Lblmensaje.ClientID %>').innerText = '';
            }, 3000);
        }
        function limpiarlabel() {
            setTimeout(function () {
                document.getElementById('<%= LblCambio.ClientID %>').innerText = '';
            }, 3000);
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
                    <b><asp:Label ID="LbUsuario" runat="server"></asp:Label> </b>
                </div>
                <asp:HyperLink ID="hlCerrarSesion" runat="server" class="link" NavigateUrl="~/IniciarSesion.aspx">Cerrar Sesión</asp:HyperLink>
            </div>
        </header>
        <main class="fuenteGeneral">
            <div class="auto-style1">
                <p class="auto-style2">
                    &nbsp;
                </p>
                <p class="auto-style2">
                    <strong>PERFIL USUARIO&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <br />
                    </strong>
                </p>
                <br />
            </div>
            <div class="Padre">
            <div class="auto-style2">
                <asp:Image ID="ImgPerfil" runat="server" Height="180px" Width="210px" />
                <br />
                <asp:FileUpload ID="FuImagen" runat="server" Visible="False" />
                <asp:Button ID="BtnCargarImagen" runat="server" Text="Cargar Imagen" OnClick="BtnCargarImagen_Click" Visible="False" />
                &nbsp;
                <asp:Button ID="BtnEliminarImg" runat="server" OnClick="BtnEliminarImg_Click" Text="Eliminar Foto" Visible="False" />
                <br />
                <asp:Label ID="LblCambio" runat="server"></asp:Label>
                <br />
                <h2>
                    <asp:Label ID="LblNombreUsuario" runat="server"></asp:Label></h2>
            </div>
            <div class="auto-style3">
                <br />
                <strong>DATOS<br />
                </strong><br />
                <strong>Usuario:</strong>
                &nbsp; <asp:Label ID="lblUsuario" runat="server"></asp:Label>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;<asp:TextBox ID="TxtUsu" runat="server" Visible="False"></asp:TextBox>
                <br />
                <br />
                <strong>Contraseña:</strong>
                &nbsp;<asp:Label ID="LblContraseña" runat="server">*********</asp:Label>
                <asp:TextBox ID="TxtContraseña" runat="server" Visible="False"></asp:TextBox>
                <br />
                <br />
                <strong>Dirección:</strong>
                &nbsp;<asp:Label ID="lblDirecion" runat="server"></asp:Label>
                &nbsp;&nbsp;
                &nbsp;<asp:TextBox ID="TxtDire" runat="server" Visible="False"></asp:TextBox>
                <br />
                <br />
                <strong>Edad:</strong>
                &nbsp;<asp:Label ID="lblEdad" runat="server"></asp:Label>
                &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:TextBox ID="TxtEdad" runat="server" Visible="False"></asp:TextBox>
                &nbsp;<asp:RegularExpressionValidator ID="RevEdad" runat="server" ControlToValidate="TxtEdad" ErrorMessage="Solo se aceptan datos numericos" ForeColor="Red" ValidationExpression="^\d+$"></asp:RegularExpressionValidator>
                <br />
                <br />
                <strong>DNI:</strong>
                &nbsp;<asp:Label ID="lblDNI" runat="server"></asp:Label>
                &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; <asp:TextBox ID="TxtDNI" runat="server" Visible="False"></asp:TextBox>
                &nbsp;<asp:RegularExpressionValidator ID="RevDNI" runat="server" ControlToValidate="TxtDNI" ErrorMessage="Solo se aceptan datos numericos" ForeColor="Red" ValidationExpression="^\d+$"></asp:RegularExpressionValidator>
                <br />
                <br />
                <strong>Telefono:</strong>
                &nbsp;<asp:Label ID="lblTelefono" runat="server" Text=""></asp:Label>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:TextBox ID="TxtTelefono" runat="server" Visible="False"></asp:TextBox>
                &nbsp;<asp:RegularExpressionValidator ID="RevTelefono" runat="server" ControlToValidate="TxtTelefono" ErrorMessage="Solo se aceptan datos numericos" ForeColor="Red" ValidationExpression="^\d+$"></asp:RegularExpressionValidator>
                <br />
                <br />
                <strong>Mail:</strong>
                 &nbsp;<asp:Label ID="lblMail" runat="server"></asp:Label>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:TextBox ID="TxtMail" runat="server" Visible="False"></asp:TextBox>
                &nbsp;<br />
                <br />
                <asp:Label ID="Lblmensaje" runat="server"></asp:Label>
                <br />
                <br />
                <asp:Button ID="BtnEditarP" runat="server" OnClick="BtnEditarP_Click" Text="Editar Perfil" /> &nbsp;&nbsp;&nbsp;<asp:Button ID="BtnCancelar" runat="server" OnClick="BtnCancelar_Click" Text="Cancelar" Visible="False" />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="BtnConfirmar" runat="server" Text="Guardar Cambios" Visible="False" OnClick="BtnConfirmar_Click" />
                <br />
                <br />
                </div>
                
                <div class="centrar">
                    
                    <div>
                        <p><strong>HISTORIAL DE PEDIDOS:
                    </strong><br /></p> 
                    <br />
                      <asp:GridView ID="GrdHistorialFactura" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical" Width="338px" OnRowCommand="GrdHistorialPedidos_RowCommand">
                    <AlternatingRowStyle BackColor="#CCCCCC" />
                    <Columns>
                        <asp:TemplateField HeaderText="Nr Factura">
                            <ItemTemplate>
                                <asp:Label ID="Lbl_it_NrFactura" runat="server" Text='<%# Bind("NrFactura_F") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Codigo Usuario">
                            <ItemTemplate>
                                <asp:Label ID="Lbl_it_CodUsuario" runat="server" Text='<%# Bind("CodUsuario_U_F") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Fecha De Compra">
                            <ItemTemplate>
                                <asp:Label ID="Lbl_it_FechaPedido" runat="server" Text='<%# Bind("fecha_F") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Total">
                            <ItemTemplate>
                                <asp:Label ID="Lbl_it_Tot" runat="server" Text='<%# Bind("Total_F") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Detalles de venta">
                            <ItemTemplate>
                                <asp:LinkButton ID="Lkb_it_DetalleVentas" runat="server" CommandName="MostrarDato" CommandArgument='<%# Container.DataItemIndex %>'>Click</asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <FooterStyle BackColor="#CCCCCC" />
                    <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                    <SortedAscendingHeaderStyle BackColor="Gray" />
                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                    <SortedDescendingHeaderStyle BackColor="#383838" />
                    </asp:GridView>
                        <asp:GridView ID="GrdDetalleDeVentas" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical">
                            <AlternatingRowStyle BackColor="#CCCCCC" />
                            <Columns>
                                <asp:TemplateField HeaderText="Producto">
                                    <ItemTemplate>
                                        <asp:Label ID="Lbl_it_NombreProducto" runat="server" Text='<%# Bind("Nombre") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Cantidad">
                                    <ItemTemplate>
                                        <asp:Label ID="Lbl_it_Cantidad" runat="server" Text='<%# Bind("cantidad") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Precio Unitario">
                                    <ItemTemplate>
                                        <asp:Label ID="Lbl_it_PrecioUnitario" runat="server" Text='<%# Bind("Precio") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <FooterStyle BackColor="#CCCCCC" />
                            <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                            <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                            <SortedAscendingCellStyle BackColor="#F1F1F1" />
                            <SortedAscendingHeaderStyle BackColor="#808080" />
                            <SortedDescendingCellStyle BackColor="#CAC9C9" />
                            <SortedDescendingHeaderStyle BackColor="#383838" />
                        </asp:GridView>
                        <br />
&nbsp;&nbsp;&nbsp;
                        <br />
                        <asp:Button ID="BtnVolver" runat="server" OnClick="BtnVolver_Click" Text="Volver" />
                </div>
                <br />
                <br />
                </div>
                </div>
            <div class="blanco">

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
