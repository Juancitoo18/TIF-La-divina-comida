using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entidades;
using System.Data;
using System.Data.SqlClient;


namespace Dao
{
    public class DaoUsuarios
    {
        AccesoDatos accesoDatos = new AccesoDatos();

        public DaoUsuarios() { }

        public void ArmarParametrosDeAgregarUsuarios(ref SqlCommand comando, Usuario usuario)
        {
            SqlParameter SqlParametro = new SqlParameter();
            SqlParametro = comando.Parameters.Add("@NombreUsuario_U", SqlDbType.VarChar);
            SqlParametro.Value = usuario._NombreUsuario;
            SqlParametro = comando.Parameters.Add("@NombreCompleto_U", SqlDbType.VarChar);
            SqlParametro.Value = usuario._NombreCompleto;
            SqlParametro = comando.Parameters.Add("@Mail_U", SqlDbType.VarChar);
            SqlParametro.Value = usuario._Mail;
            SqlParametro = comando.Parameters.Add("@Contrasenia_U", SqlDbType.VarChar);
            SqlParametro.Value = usuario._Contrasenia;
            SqlParametro = comando.Parameters.Add("@RepetirContrasenia_U", SqlDbType.VarChar);
            SqlParametro.Value = usuario._RepetirContrasenia;
        }

        public int AgregarUsuario(Usuario Usu)
        {
            SqlCommand comando = new SqlCommand();
            ArmarParametrosDeAgregarUsuarios(ref comando, Usu);
            return accesoDatos.EjectuarProcedimientoAlmacenado(comando, "spAgregarUsuario");
        }
        public Boolean usuarioexistente(string usuario)
        {
            string Consulta = $"SELECT [NombreUsuario_U] FROM Usuario WHERE NombreUsuario_U = '{usuario}'";
            return accesoDatos.existe(Consulta);
        }
        public Boolean DNIExistente(string DNI, string usuario)
        {
            string Consulta = $"SELECT [Dni_U] FROM Usuario WHERE Dni_U = '{DNI}' AND NombreUsuario_U != '{usuario}'";
            return accesoDatos.existe(Consulta);
        }

        public Boolean MailExistente(string Mail, string usuario)
        {
            string Consulta = $"SELECT [Mail_U] FROM Usuario WHERE Mail_U = '{Mail}' AND NombreUsuario_U != '{usuario}'";
            return accesoDatos.existe(Consulta);
        }

        public string VerificarCredenciales(string nombreUsuario, string contrasenia)
        {
            string consulta = "SELECT Rol_U FROM Usuario WHERE NombreUsuario_U = @NombreUsuario AND Contrasenia_U = @Contrasenia";
            return accesoDatos.VerificarCredenciales(nombreUsuario, contrasenia, consulta);
        }

        public int ActualizarContraseña(string nombreUsuario, string nuevaContraseña)
        {
            string consulta = "UPDATE Usuario SET Contrasenia_U = @NuevaContraseña WHERE NombreUsuario_U = @NombreUsuario";
            return accesoDatos.ActualizarContraseña(nombreUsuario, nuevaContraseña, consulta);
        }

        public string Contraseña(string usuario)
        {
            string consulta = "SELECT [Contrasenia_U] FROM Usuario WHERE NombreUsuario_U = @NombreUsuario";
            return accesoDatos.ObtenerInfo(usuario, consulta);
        }

        public string NombreCompleto(string usuario)
        {
            string consulta = "SELECT [NombreCompleto_U] FROM Usuario WHERE NombreUsuario_U = @NombreUsuario";
            return accesoDatos.ObtenerInfo(usuario, consulta);
        }

        public string Direccion(string usuario)
        {
            string consulta = "SELECT [Direccion_U] FROM Usuario WHERE NombreUsuario_U = @NombreUsuario";
            return accesoDatos.ObtenerInfo(usuario, consulta);
        }

        public string Edad(string usuario)
        {
            string consulta = "SELECT [Edad_U] FROM Usuario WHERE NombreUsuario_U = @NombreUsuario";
            return accesoDatos.ObtenerInfo(usuario, consulta);
        }

        public string DNI(string usuario)
        {
            string consulta = "SELECT [Dni_U] FROM Usuario WHERE NombreUsuario_U = @NombreUsuario";
            return accesoDatos.ObtenerInfo(usuario, consulta);
        }

        public string Telefono(string usuario)
        {
            string consulta = "SELECT [Telefono_U] FROM Usuario WHERE NombreUsuario_U = @NombreUsuario";
            return accesoDatos.ObtenerInfo(usuario, consulta);
        }

        public string Mail(string usuario)
        {
            string consulta = "SELECT [Mail_U] FROM Usuario WHERE NombreUsuario_U = @NombreUsuario";
            return accesoDatos.ObtenerInfo(usuario, consulta);
        }

        public string Url(string usuario)
        {
            string consulta = "SELECT [Img_Perfil_URL_U] FROM Usuario WHERE NombreUsuario_U = @NombreUsuario";
            return accesoDatos.ObtenerInfo(usuario, consulta);
        }

        public string Estado(string usuario)
        {
            string consulta = "SELECT [Estado_U] FROM Usuario WHERE NombreUsuario_U = @NombreUsuario";
            return accesoDatos.ObtenerInfo(usuario, consulta);
        }

        public int ActualizarDatos(string nombreUsuario, string nuevaContraseña, string Dire, string Edad, string DNI, string Telefono, string Mail)
        {
            string consulta = "UPDATE Usuario SET NombreUsuario_U = @NombreUsuario, Contrasenia_U = @Contrasenia, " +
                "Mail_U = @Mail, Dni_U = @DNI, Edad_U = @Edad, Telefono_U = @Telefono, " +
                "Direccion_U = @Direccion WHERE NombreUsuario_U = @NombreUsuario ";
            return accesoDatos.ActualizarDatos(nombreUsuario, nuevaContraseña, Dire, Edad, DNI, Telefono, Mail, consulta);
        }

        public int ObtenerCodigo(string nombreUsuario)
        {
            string consulta = "SELECT CodUsuario_U FROM Usuario WHERE NombreUsuario_U = @NombreUsuario";

            string codigo = accesoDatos.ObtenerInfo(nombreUsuario, consulta);

            if (!string.IsNullOrEmpty(codigo) && int.TryParse(codigo, out int codigoUsuario))
            {
                return codigoUsuario;
            }

            return -1;
        }
        public int ActualizarImagen(string nombreUsuario, string UrlPerfil)
        {
            string consulta = "UPDATE Usuario SET [Img_Perfil_URL_U] = @UrlPerfil FROM Usuario " +
             "WHERE NombreUsuario_U = @NombreUsuario AND RIGHT(@UrlPerfil, 4) IN ('.jpg', '.png', 'jpeg')";
            return accesoDatos.ActualizarPerfil(nombreUsuario, UrlPerfil, consulta);
        }

        public DataTable HistorialFactura(int Codigo)
        {
            DataTable tabla = accesoDatos.ObtenerTabla("Usuario", "SELECT Factura.fecha_F, Factura.CodUsuario_U_F, Factura.Total_F, Factura.NrFactura_F " +
                                                                  "FROM Usuario INNER JOIN Factura "+
                                                                  "ON Usuario.CodUsuario_U = Factura.CodUsuario_U_F " +
                                                                  "WHERE Usuario.CodUsuario_U = " + Codigo);

            return tabla;
        }

        public DataTable HistorialDetalleVentas(int factura)
        {
            DataTable tabla = accesoDatos.ObtenerTabla("Usuario", "SELECT DISTINCT Productos.NombreProducto_Pr AS [Nombre], Detalle_Venta.cantidad AS [Cantidad], Detalle_Venta.PrecioUnitario AS [Precio]" +
                                                     "FROM Factura INNER JOIN Detalle_Venta " +
                                                     "ON Factura.NrFactura_F = Detalle_Venta.NrFactura_F_DV " +
                                                     "INNER JOIN Productos "+
                                                     "ON Detalle_Venta.CodProducto_Pr_DV = Productos.CodProducto_Pr "+
                                                     "WHERE NrFactura_F ="+ factura);
            return tabla;
        }

        public DataTable CargarListviewCuentas()
        {
            DataTable tablaArticulos = accesoDatos.ObtenerTabla("Usuario", "SELECT [CodUsuario_U], [Img_Perfil_URL_U]," +
                " [NombreCompleto_U], [Mail_U], [Telefono_U], [Rol_U], [Estado_U], [NombreUsuario_U] FROM Usuario");
            return tablaArticulos;
        }

        public int ActualizarRol(string nombreUsuario, string UrlPerfil)
        {
            string consulta = "UPDATE Usuario SET [Rol_U] = @Rol FROM Usuario WHERE NombreUsuario_U = @NombreUsuario";
            return accesoDatos.ActualizarRol(nombreUsuario, UrlPerfil, consulta);
        }

        public int ActualizarEstado(string nombreUsuario, int Estado)
        {
            string consulta = "UPDATE Usuario SET [Estado_U] = @Estado FROM Usuario WHERE NombreUsuario_U = @NombreUsuario";
            return accesoDatos.ActualizarEstado(nombreUsuario, Estado, consulta);
        }
    }
}
