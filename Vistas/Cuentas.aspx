<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Cuentas.aspx.cs" Inherits="Vistas.Cuentas" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="icon" type="image/png" href="img/icono.png" />
    <link rel="styleSheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.4/font/bootstrap-icons.css" />
    <link href="Style.css" rel="StyleSheet" type="text/css" />
    <script src="https://kit.fontawesome.com/0440de58e7.js" crossorigin="anonymous"></script>
    <title>La divina Comida | Cuentas</title>
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
         
        .titulo-Cliente{
            text-align:center;
        }

        .titulo-C{
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .mi-label {
            font-family: 'Open Sans', sans-serif; 
            font-size: 16px; 
            color: black; 
        }

        .Descripcion{
            background-color: #70F0E8;
            height: auto;
            overflow: hidden;
        }
        .Descripcion p{
            text-align: start;
            margin-left: 10px;
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

        td{
            background: #caf0f8;
        }
        td:empty{
            display:none;
        }
        table{
            background: #caf0f8;
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
                <main>
                    <div class="titulo-C">
                        <h1 class="titulo-Cliente"><b>Cuentas</b></h1>
                    </div>

                    <div class="listview-container">
                        <br />
                        <asp:ListView ID="LvClientes" runat="server" DataKeyNames="CodUsuario_U" GroupItemCount="3" OnItemDataBound="LvClientes_ItemDataBound" OnPagePropertiesChanged="LvClientes_PagePropertiesChanged1">
                            <%--<AlternatingItemTemplate>
                                <td runat="server" style="background-color: #FFFFFF;color: #284775;">CodUsuario_U:
                                    <asp:Label ID="CodUsuario_ULabel" runat="server" Text='<%# Eval("CodUsuario_U") %>' />
                                    <br />Img_Perfil_URL_U:
                                    <asp:Label ID="Img_Perfil_URL_ULabel" runat="server" Text='<%# Eval("Img_Perfil_URL_U") %>' />
                                    <br />NombreCompleto_U:
                                    <asp:Label ID="NombreCompleto_ULabel" runat="server" Text='<%# Eval("NombreCompleto_U") %>' />
                                    <br />Mail_U:
                                    <asp:Label ID="Mail_ULabel" runat="server" Text='<%# Eval("Mail_U") %>' />
                                    <br />Telefono_U:
                                    <asp:Label ID="Telefono_ULabel" runat="server" Text='<%# Eval("Telefono_U") %>' />
                                    <br />Rol_U:
                                    <asp:Label ID="Rol_ULabel" runat="server" Text='<%# Eval("Rol_U") %>' />
                                    <br /></td>
                            </AlternatingItemTemplate>--%>
                            <EditItemTemplate>
                                <td runat="server" style="background-color: #999999;">CodUsuario_U:
                                    <asp:Label ID="CodUsuario_ULabel1" runat="server" Text='<%# Eval("CodUsuario_U") %>' />
                                    <br />Img_Perfil_URL_U:
                                    <asp:TextBox ID="Img_Perfil_URL_UTextBox" runat="server" Text='<%# Bind("Img_Perfil_URL_U") %>' />
                                    <br />NombreCompleto_U:
                                    <asp:TextBox ID="NombreCompleto_UTextBox" runat="server" Text='<%# Bind("NombreCompleto_U") %>' />
                                    <br />Mail_U:
                                    <asp:TextBox ID="Mail_UTextBox" runat="server" Text='<%# Bind("Mail_U") %>' />
                                    <br />Telefono_U:
                                    <asp:TextBox ID="Telefono_UTextBox" runat="server" Text='<%# Bind("Telefono_U") %>' />
                                    <br />Rol_U:
                                    <asp:TextBox ID="Rol_UTextBox" runat="server" Text='<%# Bind("Rol_U") %>' />
                                    <br />
                                    <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Actualizar" />
                                    <br />
                                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancelar" />
                                    <br /></td>
                            </EditItemTemplate>
                            <EmptyDataTemplate>
                                <table runat="server" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;">
                                    <tr>
                                        <td>No se han devuelto datos.</td>
                                    </tr>
                                </table>
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
                                <td runat="server" style="">Img_Perfil_URL_U:
                                    <asp:TextBox ID="Img_Perfil_URL_UTextBox" runat="server" Text='<%# Bind("Img_Perfil_URL_U") %>' />
                                    <br />NombreCompleto_U:
                                    <asp:TextBox ID="NombreCompleto_UTextBox" runat="server" Text='<%# Bind("NombreCompleto_U") %>' />
                                    <br />Mail_U:
                                    <asp:TextBox ID="Mail_UTextBox" runat="server" Text='<%# Bind("Mail_U") %>' />
                                    <br />Telefono_U:
                                    <asp:TextBox ID="Telefono_UTextBox" runat="server" Text='<%# Bind("Telefono_U") %>' />
                                    <br />Rol_U:
                                    <asp:TextBox ID="Rol_UTextBox" runat="server" Text='<%# Bind("Rol_U") %>' />
                                    <br />
                                    <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insertar" />
                                    <br />
                                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Borrar" />
                                    <br /></td>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <td runat="server" class="contenedor-con-borde-redondeado" >
                                    <div class="espaciado-borde-redondeado">
                                    <asp:Label ID="CodUsuario_ULabel" runat="server" Text='<%# Eval("CodUsuario_U") %>' />
                                    <br />
                                    <asp:Image ID="Image1" runat="server" Height="150px" ImageUrl='<%# Eval("Img_Perfil_URL_U") %>' Width="192px" />
                                    <div class="Descripcion"> 
                                    <p> <b> <br />Nombre Completo:
                                    <asp:Label ID="NombreCompleto_ULabel" CssClass="mi-label" runat="server" Text='<%# Eval("NombreCompleto_U") %>' /> </b>  </p> 
                                    <p> <b> <br />Mail:
                                    <asp:Label ID="Mail_ULabel" CssClass="mi-label" runat="server" Text='<%# Eval("Mail_U") %>' /> </b>  </p> 
                                    <p> <b> <br />Telefono:
                                    <asp:Label ID="Telefono_ULabel" CssClass="mi-label" runat="server" Text='<%# Eval("Telefono_U") %>' /> </b>  </p> 
                                    <p> <b> <br />Rol:
                                    <asp:Label ID="Rol_ULabel"  CssClass="mi-label" runat="server" Text='<%# Eval("Rol_U") %>' /> </b>  </p> 
                                    <p> <b> <br />
                                    <asp:Label ID="LblEstado" runat="server" Text="Label"></asp:Label> </b>  </p> 
                                    <p> <b> <br />
                                    <asp:Label ID="Estado_ULabel"  CssClass="mi-label" runat="server" Text='<%# Eval("Estado_U") %>' Visible="False" /> </b>  </p> 
                                    
                                    </div>
                                        <br />
                                     <div>
                                         <asp:Button ID="BtnAdmin" runat="server" Text="Dar Admin" CommandName="CambiarRolADM" CommandArgument='<%# Eval("NombreUsuario_U") %>' BackColor="#FFFF99" Font-Bold="False"  Visible="False" OnClick="BtnAdmin_Click" />
                                         <asp:Button ID="BtnQuitar" runat="server" Text="Quitar Admin" CommandName="CambiarRolUSU" CommandArgument='<%# Eval("NombreUsuario_U") %>' BackColor="#FFFF99" Font-Bold="False"  Visible="False" OnClick="BtnQuitar_Click" />
 
                                         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp 
                                         <asp:Button ID="BtnEliminar" runat="server" Text="Eliminar" CommandName="Eliminar" CommandArgument='<%# Eval("NombreUsuario_U") %>' BackColor="#FFFF99"  Visible="False" OnClick="BtnEliminar_Click" />
                                         <asp:Button ID="BtnDarAlta" runat="server" Text="Dar de Alta" CommandName="Alta" CommandArgument='<%# Eval("NombreUsuario_U") %>' BackColor="#FFFF99"  Visible="False" OnClick="BtnDarAlta_Click" />
                                     </div>
                                    </div>
                                    <br />
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
                                <td runat="server" style="background-color: #E2DED6;font-weight: bold;color: #333333;">CodUsuario_U:
                                    <asp:Label ID="CodUsuario_ULabel" runat="server" Text='<%# Eval("CodUsuario_U") %>' />
                                    <br />Img_Perfil_URL_U:
                                    <asp:Label ID="Img_Perfil_URL_ULabel" runat="server" Text='<%# Eval("Img_Perfil_URL_U") %>' />
                                    <br />NombreCompleto_U:
                                    <asp:Label ID="NombreCompleto_ULabel" runat="server" Text='<%# Eval("NombreCompleto_U") %>' />
                                    <br />Mail_U:
                                    <asp:Label ID="Mail_ULabel" runat="server" Text='<%# Eval("Mail_U") %>' />
                                    <br />Telefono_U:
                                    <asp:Label ID="Telefono_ULabel" runat="server" Text='<%# Eval("Telefono_U") %>' />
                                    <br />Rol_U:
                                    <asp:Label ID="Rol_ULabel" runat="server" Text='<%# Eval("Rol_U") %>' />
                                    <br /></td>
                            </SelectedItemTemplate>
                        </asp:ListView>
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
