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
    public class DaoProducto
    {
        AccesoDatos accesoDatos = new AccesoDatos();
        public DaoProducto() { }

        /*Devuelve una tabla general de los productos*/
        public DataTable obtenerTabla()
        {
            DataTable tabla = accesoDatos.ObtenerTabla("Productos", "SELECT CodProducto_Pr, CodCategoria_Ct_Pr, CodTipoProducto_T_Pr, stock_Pr, NombreProducto_Pr," +
                                                       "Descripcion_Pr, PrecioUnitario_Pr, ImagenURL_Pr, Estado_Pr FROM Productos");
            return tabla;
        }

        /*Devuelve el cod categoria y tipo*/
        public DataTable obtenerDDL()
        {
            DataTable tabla = accesoDatos.ObtenerTabla("Categoria", "SELECT CodCategoria_Ct FROM Categoria");
            return tabla;
        }

        public DataTable obtenerDDLtipo()
        {
            DataTable tabla = accesoDatos.ObtenerTabla("Tipo", "SELECT CodTipo_T, Nombre_T FROM Tipo");
            return tabla;
        }

        /*Devuelve tabla de las Categorias y Tipos*/
        public DataTable tablaCategorias()
        {
            DataTable tabla = accesoDatos.ObtenerTabla("Categoria", "SELECT * FROM Categoria");
            return tabla;
        }

        public DataTable tablaTipos()
        {
            DataTable tabla = accesoDatos.ObtenerTabla("Tipo", "SELECT * FROM Tipo");
            return tabla;
        }

        /*Procedimiento para editar un producto*/
        public void ArmarParametrosDeProductos(ref SqlCommand comando, Producto productos)
        {
            SqlParameter parametro = new SqlParameter();
            parametro = comando.Parameters.Add("@CodProducto_Pr", SqlDbType.Int);
            parametro.Value = productos.CodigoProductos;
            parametro = comando.Parameters.Add("@CodCategoria_Ct_Pr", SqlDbType.Int);
            parametro.Value = productos.CodigoCategorias;
            parametro = comando.Parameters.Add("@CodTipoProducto_T_Pr", SqlDbType.Int);
            parametro.Value = productos.CodigoTipoProductos;
            parametro = comando.Parameters.Add("@stock_Pr", SqlDbType.Int);
            parametro.Value = productos.Stock;
            parametro = comando.Parameters.Add("@NombreProducto_Pr", SqlDbType.VarChar);
            parametro.Value = productos.NombreProductos;
            parametro = comando.Parameters.Add("@Descripcion_Pr", SqlDbType.VarChar);
            parametro.Value = productos.Descripciones;
            parametro = comando.Parameters.Add("@PrecioUnitario_Pr", SqlDbType.Decimal);
            parametro.Value = productos.PrecioUnitarios;
            parametro = comando.Parameters.Add("@ImagenURL_Pr", SqlDbType.VarChar);
            parametro.Value = productos.ImagenesProducto;
            parametro = comando.Parameters.Add("@Estado_Pr", SqlDbType.Bit);
            parametro.Value = productos.Estados;
        }

        /*recibe el producto a modificar*/
        public int EditarProductos(Producto productos)
        {
            SqlCommand comando = new SqlCommand();
            ArmarParametrosDeProductos(ref comando, productos);
            return accesoDatos.EjectuarProcedimientoAlmacenado(comando, "spEditarProducto");
        }

        /*Procedimiento para agregar un producto*/
        public void ArmarParametrosDeAgregarProductos(ref SqlCommand comando, Producto productos)
        {
            SqlParameter SqlParametro = new SqlParameter();
            SqlParametro = comando.Parameters.Add("@CodCategoria_Ct_Pr", SqlDbType.Int);
            SqlParametro.Value = productos.CodigoCategorias;
            SqlParametro = comando.Parameters.Add("@CodTipoProducto_T_Pr", SqlDbType.Int);
            SqlParametro.Value = productos.CodigoTipoProductos;
            SqlParametro = comando.Parameters.Add("@stock_Pr", SqlDbType.Int);
            SqlParametro.Value = productos.Stock;
            SqlParametro = comando.Parameters.Add("@NombreProducto_Pr", SqlDbType.VarChar);
            SqlParametro.Value = productos.NombreProductos;
            SqlParametro = comando.Parameters.Add("@Descripcion_Pr", SqlDbType.VarChar);
            SqlParametro.Value = productos.Descripciones;
            SqlParametro = comando.Parameters.Add("@PrecioUnitario_Pr", SqlDbType.Decimal);
            SqlParametro.Value = productos.PrecioUnitarios;
            SqlParametro = comando.Parameters.Add("@ImagenURL_Pr", SqlDbType.VarChar);
            SqlParametro.Value = productos.ImagenesProducto;
        }

        /*Agregar un producto a la BD*/
        public int AgregarProducto(Producto Produc)
        {
            SqlCommand comando = new SqlCommand();
            ArmarParametrosDeAgregarProductos(ref comando, Produc);
            return accesoDatos.EjectuarProcedimientoAlmacenado(comando, "spAgregarProducto");
        }

        /*armado de parametro para eliminar un producto*/
        public void parametroEliminar(ref SqlCommand comando, Producto productos)
        {
            SqlParameter SqlParametro = new SqlParameter();
            SqlParametro = comando.Parameters.Add("@CodProducto_Pr", SqlDbType.Int);
            SqlParametro.Value = productos.CodigoProductos;
        }

        /*funcion para eliminar un pruducto*/
        public int eliminarProducto(Producto Produc)
        {
            SqlCommand comando = new SqlCommand();
            parametroEliminar(ref comando, Produc);
            return accesoDatos.EjectuarProcedimientoAlmacenado(comando, "spEliminarProducto");
        }

        public DataTable CargarListview()
        {
            DataTable tablaArticulos = accesoDatos.ObtenerTabla("Productos", "SELECT [NombreProducto_Pr], " +
            "[CodProducto_Pr], [Descripcion_Pr], [PrecioUnitario_Pr], [ImagenURL_Pr] FROM [Productos] WHERE [Estado_Pr] = 1 ");
            return tablaArticulos;
        }

        /*Buscar producto*/
        public DataTable obtenerBusqueda(string buscar)
        {
            string consulta = "SELECT [CodProducto_Pr], [CodCategoria_Ct_Pr], [CodTipoProducto_T_Pr], [stock_Pr], [NombreProducto_Pr], " +
            "[Descripcion_Pr], [PrecioUnitario_Pr], [ImagenURL_Pr] FROM [Productos] " +
            "WHERE [Estado_Pr] = 1 AND [NombreProducto_Pr] LIKE @buscar";

            DataTable tabla = accesoDatos.ObtenerTablaBusqueda("Productos", consulta, buscar);
            return tabla;
        }

        public DataTable obtenerTipo(int buscar)
        {
            string consulta;
            if (buscar != 0)
            {
                consulta = "SELECT [CodProducto_Pr], [CodCategoria_Ct_Pr], [CodTipoProducto_T_Pr], [stock_Pr], [NombreProducto_Pr], " +
                           "[Descripcion_Pr], [PrecioUnitario_Pr], [ImagenURL_Pr] FROM [Productos] " +
                           "WHERE [Estado_Pr] = 1 AND [CodTipoProducto_T_Pr] =" + buscar;

                DataTable tabla = accesoDatos.ObtenerTablaTipo("Productos", consulta);
                return tabla;
            }
            else
            {
                consulta = "SELECT [NombreProducto_Pr], " +
                          "[CodProducto_Pr], [Descripcion_Pr], [PrecioUnitario_Pr], [ImagenURL_Pr] FROM [Productos] WHERE [Estado_Pr] = 1 ";

                DataTable tabla = accesoDatos.ObtenerTabla("Productos", consulta);
                return tabla;

            }
            
        }

        public DataTable ObtenerProdXcod(int codigo)
        {
            DataTable tabla = accesoDatos.ObtenerTabla("Productos", "SELECT CodProducto_Pr, CodCategoria_Ct_Pr, CodTipoProducto_T_Pr, stock_Pr, NombreProducto_Pr," +
                                                       "Descripcion_Pr, PrecioUnitario_Pr, ImagenURL_Pr, Estado_Pr FROM Productos WHERE CodProducto_Pr = " + codigo);
            return tabla;
        }

        /*Ordenar por:*/
        public DataTable PrecioMayorMenor(string opc, int tipo)
        {
            string consulta;

            if (opc == "Menor" && tipo == 0)
            {
                consulta = "SELECT[NombreProducto_Pr], [CodProducto_Pr], [Descripcion_Pr], [PrecioUnitario_Pr], [ImagenURL_Pr] FROM[Productos] WHERE[Estado_Pr] = 1 ORDER BY[PrecioUnitario_Pr] ASC";
                DataTable tabla = accesoDatos.ObtenerTabla("Productos", consulta);
                return tabla;
            }
            if(opc == "Mayor" && tipo == 0)
            {
                consulta = "SELECT[NombreProducto_Pr], [CodProducto_Pr], [Descripcion_Pr], [PrecioUnitario_Pr], [ImagenURL_Pr] FROM[Productos] WHERE[Estado_Pr] = 1 ORDER BY[PrecioUnitario_Pr] DESC";
                DataTable tabla = accesoDatos.ObtenerTabla("Productos", consulta);
                return tabla;
            }
            if(opc == "Mayor" && tipo != 0)
            {
                consulta = "SELECT[NombreProducto_Pr], [CodProducto_Pr], [Descripcion_Pr], [PrecioUnitario_Pr], [ImagenURL_Pr] FROM[Productos] WHERE [Estado_Pr] = 1 AND Productos.CodTipoProducto_T_Pr = " + tipo + " ORDER BY[PrecioUnitario_Pr] DESC";
                DataTable tabla = accesoDatos.ObtenerTabla("Productos", consulta);
                return tabla;
            }
            if (opc == "Menor" && tipo != 0)
            {
                consulta = "SELECT[NombreProducto_Pr], [CodProducto_Pr], [Descripcion_Pr], [PrecioUnitario_Pr], [ImagenURL_Pr] FROM[Productos] WHERE [Estado_Pr] = 1 AND Productos.CodTipoProducto_T_Pr = " + tipo + " ORDER BY[PrecioUnitario_Pr] ASC";
                DataTable tabla = accesoDatos.ObtenerTabla("Productos", consulta);
                return tabla;
            }
            else
            {
                consulta = "SELECT [NombreProducto_Pr], " +
                          "[CodProducto_Pr], [Descripcion_Pr], [PrecioUnitario_Pr], [ImagenURL_Pr] FROM [Productos] WHERE [Estado_Pr] = 1 ";

                DataTable tabla = accesoDatos.ObtenerTabla("Productos", consulta);
                return tabla;
            }
        }

    }
}
