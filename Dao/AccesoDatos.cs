using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;

namespace Dao
{
    class AccesoDatos
    {
        public AccesoDatos() { }

        string ruta = "Data Source=localhost\\sqlexpress;;Initial Catalog=La_Divina_Comida;Integrated Security=True";

        private SqlConnection ObtenerConexion()
        {
            SqlConnection cn = new SqlConnection(ruta);
            try
            {
                cn.Open();
                return cn;

            }
            catch (Exception ex)
            {
                return null;
            }
        }
        private SqlDataAdapter ObtenerAdaptador(string consultaSql, SqlConnection cn)
        {
            SqlDataAdapter adaptador;
            try
            {
                adaptador = new SqlDataAdapter(consultaSql, cn);
                return adaptador;
            }
            catch (Exception ex)
            {
                return null;
            }
        }
        public DataTable ObtenerTabla(string NombreTabla, String Sql)
        {
            DataSet ds = new DataSet();
            SqlConnection Conexion = ObtenerConexion();
            SqlDataAdapter adp = ObtenerAdaptador(Sql, Conexion);
            adp.Fill(ds, NombreTabla);
            Conexion.Close();
            return ds.Tables[NombreTabla];
        }
        public DataTable obtenerTablaId(string consulta)
        {
            DataTable dt = new DataTable();
            SqlConnection conexion = ObtenerConexion();
            SqlCommand cmd = new SqlCommand(consulta, conexion);
            SqlDataAdapter adap = new SqlDataAdapter(cmd);
            adap.Fill(dt);
            return dt;
        }

        public DataTable obtenerTablaInnerJoin(string consulta)
        {
            DataTable dt = new DataTable();
            SqlConnection Conexion = ObtenerConexion();
            SqlCommand cmd = new SqlCommand(consulta, Conexion);
            SqlDataAdapter adapter = new SqlDataAdapter(cmd);
            adapter.Fill(dt);
            return dt;
        }

        public DataTable ObtenerTablaBusqueda(string NombreTabla, string consulta, string buscar)
        {
            DataSet ds = new DataSet();
            SqlConnection Conexion = ObtenerConexion();
            SqlDataAdapter adp = ObtenerAdaptador(consulta, Conexion);
            adp.SelectCommand.Parameters.AddWithValue("@buscar", "%" + buscar + "%");
            adp.Fill(ds, NombreTabla);
            Conexion.Close();
            return ds.Tables[NombreTabla];
        }

        public DataTable ObtenerTablaTipo(string NombreTabla, string consulta)
        {
            DataSet ds = new DataSet();
            SqlConnection Conexion = ObtenerConexion();
            SqlDataAdapter adp = ObtenerAdaptador(consulta, Conexion);
            adp.Fill(ds, NombreTabla);
            Conexion.Close();
            return ds.Tables[NombreTabla];
        }

        public string obtenerResultado(string consulta)
        {
            String resultado = string.Empty;
            SqlConnection conexion = ObtenerConexion();
            SqlCommand cmd = new SqlCommand(consulta, conexion);
            object valor = cmd.ExecuteScalar();
            resultado = valor.ToString();
            return resultado;
        }

        public int EjectuarProcedimientoAlmacenado(SqlCommand Comando, String NombreSP)
        {
            int filasCambiadas;
            SqlConnection Conexion = ObtenerConexion();
            SqlCommand cmd = new SqlCommand();
            cmd = Comando;
            cmd.Connection = Conexion;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = NombreSP;
            filasCambiadas = cmd.ExecuteNonQuery();
            Conexion.Close();
            return filasCambiadas;
        }

        public Boolean existe(String Consulta)
        {
            Boolean estado = false;
            SqlConnection Conexion = ObtenerConexion();
            SqlCommand cmd = new SqlCommand(Consulta, Conexion);
            SqlDataReader datos = cmd.ExecuteReader();
            if (datos.Read())
            {
                estado = true;
            }
            return estado;
        }

        public SqlCommand CrearComando(string consulta, string nombreUsuario, string contrasenia, SqlConnection conexion)
        {
            SqlCommand cmd = new SqlCommand(consulta, conexion);
            cmd.Parameters.AddWithValue("@NombreUsuario", nombreUsuario);
            cmd.Parameters.AddWithValue("@Contrasenia", contrasenia);
            return cmd;
        }
        public SqlCommand CrearComando2(string consulta, string nombreUsuario, string contrasenia, SqlConnection conexion)
        {
            SqlCommand cmd = new SqlCommand(consulta, conexion);
            cmd.Parameters.AddWithValue("@NombreUsuario", nombreUsuario);
            cmd.Parameters.AddWithValue("@NuevaContraseña", contrasenia);
            return cmd;
        }
        
        public SqlDataReader EjecutarConsulta(SqlCommand cmd)
        {
            return cmd.ExecuteReader();
        }

        public int EjecutarConsulta1(string NombreTabla, String consulta)
        {
            int filasCambiadas;
            SqlConnection Conexion = ObtenerConexion();
            SqlCommand cmd = new SqlCommand(consulta,Conexion);
            filasCambiadas = cmd.ExecuteNonQuery();
            Conexion.Close();
            return filasCambiadas;
        }
        public string VerificarCredenciales(string nombreUsuario, string contrasenia, string consulta)
        {
            SqlConnection conexion = ObtenerConexion();
            SqlCommand cmd = CrearComando(consulta, nombreUsuario, contrasenia, conexion);
            object result = cmd.ExecuteScalar();
            if (result != null)
            {
                return result.ToString();
            }
            return null;
        }

        public int ActualizarContraseña(string nombreUsuario, string nuevaContraseña, string consulta)
        {
            SqlConnection conexion = ObtenerConexion();
            SqlCommand cmd = CrearComando2(consulta, nombreUsuario, nuevaContraseña, conexion);
            return cmd.ExecuteNonQuery();
        }

        public SqlCommand usuario(string consulta, string nombreUsuario, SqlConnection conexion)
        {
            SqlCommand cmd = new SqlCommand(consulta, conexion);
            cmd.Parameters.AddWithValue("@NombreUsuario", nombreUsuario);
            return cmd;
        }

        public string ObtenerInfo(string nombreUsuario, string consulta)
        {
            SqlConnection conexion = ObtenerConexion();
            SqlCommand cmd = usuario(consulta, nombreUsuario, conexion);
            object result = cmd.ExecuteScalar();
            if (result != null)
            {
                return result.ToString();
            }
            return null;
        }
        public SqlCommand comando(string consulta, string nombreUsuario, string contrasenia, string Dire, string Edad, string DNI, string Telefono, string Mail, SqlConnection conexion)
        {
            SqlCommand cmd = new SqlCommand(consulta, conexion);
            cmd.Parameters.AddWithValue("@NombreUsuario", nombreUsuario);
            cmd.Parameters.AddWithValue("@Contrasenia", contrasenia);
            cmd.Parameters.AddWithValue("@Direccion", Dire);
            cmd.Parameters.AddWithValue("@Edad", Edad);
            cmd.Parameters.AddWithValue("@DNI", DNI);
            cmd.Parameters.AddWithValue("@Telefono", Telefono);
            cmd.Parameters.AddWithValue("@Mail", Mail);
            return cmd;
        }

        public int ActualizarDatos(string nombreUsuario, string nuevaContraseña, string Dire, string Edad, string DNI, string Telefono, string Mail, string consulta)
        {
            SqlConnection conexion = ObtenerConexion();
            SqlCommand cmd = comando(consulta, nombreUsuario, nuevaContraseña, Dire, Edad, DNI, Telefono, Mail, conexion);
            return cmd.ExecuteNonQuery();
        }

        public SqlCommand comandoPerfil(string consulta, string nombreUsuario, string UrlPerfil, SqlConnection conexion)
        {
            SqlCommand cmd = new SqlCommand(consulta, conexion);
            cmd.Parameters.AddWithValue("@NombreUsuario", nombreUsuario);
            cmd.Parameters.AddWithValue("@UrlPerfil", UrlPerfil);
            return cmd;
        }

        public int ActualizarPerfil(string nombreUsuario, string UrlPerfil, string consulta)
        {
            SqlConnection conexion = ObtenerConexion();
            SqlCommand cmd = comandoPerfil(consulta, nombreUsuario, UrlPerfil, conexion);
            return cmd.ExecuteNonQuery();
        }

        public SqlCommand comandoROL(string consulta, string nombreUsuario, string ROL, SqlConnection conexion)
        {
            SqlCommand cmd = new SqlCommand(consulta, conexion);
            cmd.Parameters.AddWithValue("@NombreUsuario", nombreUsuario);
            cmd.Parameters.AddWithValue("@Rol", ROL);
            return cmd;
        }
        public SqlCommand comandoEstado(string consulta, string nombreUsuario, int Estado, SqlConnection conexion)
        {
            SqlCommand cmd = new SqlCommand(consulta, conexion);
            cmd.Parameters.AddWithValue("@NombreUsuario", nombreUsuario);
            cmd.Parameters.AddWithValue("@Estado", Estado);
            return cmd;
        }

        public int ActualizarRol(string nombreUsuario, string Rol, string consulta)
        {
            SqlConnection conexion = ObtenerConexion();
            SqlCommand cmd = comandoROL(consulta, nombreUsuario, Rol, conexion);
            return cmd.ExecuteNonQuery();
        }
        public int ActualizarEstado(string nombreUsuario, int Estado, string consulta)
        {
            SqlConnection conexion = ObtenerConexion();
            SqlCommand cmd = comandoEstado(consulta, nombreUsuario, Estado, conexion);
            return cmd.ExecuteNonQuery();
        }

    }
}
