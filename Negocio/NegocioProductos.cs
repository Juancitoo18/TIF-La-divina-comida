using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entidades;
using Dao;
using System.Data;

namespace Negocio
{
    public class NegocioProductos
    {
        DaoProducto daoProductos = new DaoProducto();
        Producto productos = new Producto();

        public NegocioProductos() { }

        /*Devuelve una tabla general de los productos*/
        public DataTable obtenerTabla()
        {
            return daoProductos.obtenerTabla();
        }

        public DataTable obtenerDDL()
        {
            return daoProductos.obtenerDDL();
        }

        public DataTable obtenerDDLtipo()
        {
            return daoProductos.obtenerDDLtipo();
        }

        /*Devuelve tabla de las Categorias y Tipos*/
        public DataTable tablaCategorias()
        {
            return daoProductos.tablaCategorias();
        }

        public DataTable tablaTipos()
        {
            return daoProductos.tablaTipos();
        }

        /*Producto a agregar al dao*/
        public int CargarProducto(ref Producto prod)
        {
            DaoProducto ds = new DaoProducto();
            return ds.AgregarProducto(prod);
        }

        /*desde la tabla negocio producto, se envia el objeto producto con los datos modificados al dao*/
        public int editarProductos(Producto productos)
        {
            return daoProductos.EditarProductos(productos);
        }
        /*se envia el producto a eliminar al dao*/
        public int eliminarProducto(Producto Produc)
        {
            return daoProductos.eliminarProducto(Produc);
        }
        public DataTable CargarListview()
        {
            DaoProducto dp = new DaoProducto();
            return dp.CargarListview();
        }

        public DataTable ResultadoBusqueda(string buscar)
        {
            DaoProducto dp = new DaoProducto();
            return dp.obtenerBusqueda(buscar);
        }

        public DataTable ResultadoTipo(int buscar)
        {
            DaoProducto dp = new DaoProducto();
            return dp.obtenerTipo(buscar);
        }

        public DataTable ObtenerProductoXcod(int codigo)
        {
            return daoProductos.ObtenerProdXcod(codigo);
        }

        /*Ordenar por:*/
        public DataTable PrecioMayor_Menor(string opc, int tipo)
        {
            DaoProducto dp = new DaoProducto();
            return dp.PrecioMayorMenor(opc, tipo);
        }
    }
}
