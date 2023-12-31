using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using Entidades;

namespace Dao
{
    public class DaoVentas
    {
        AccesoDatos ds = new AccesoDatos();

        public DataTable getTablaPen()
        {
            DataTable tabla = ds.ObtenerTabla("Factura", "SELECT NrFactura_F AS [Numero factura],CodUsuario_U_F AS [Codigo de cliente],fecha_F AS [Fecha],Total_F AS [Total $], 'Estado del pedido'= CASE WHEN Estado_F = 1 THEN 'Pendiente' WHEN Estado_F = 0 THEN 'Entregado'END FROM Factura WHERE Estado_F ='1' ORDER BY NrFactura_F DESC");
            return tabla;
        }
        public DataTable getTablaVentas()
        {
            DataTable tabla = ds.ObtenerTabla("Factura", "SELECT NrFactura_F AS [Numero factura],CodUsuario_U_F AS [Codigo de cliente],fecha_F AS [Fecha],Total_F AS [Total $],'Estado del pedido'=CASE WHEN Estado_F = 1 THEN 'Pendiente'WHEN Estado_F = 0 THEN 'Entregado'END FROM Factura ORDER BY NrFactura_F DESC");
            return tabla;
        }

        public DataTable getTablaDetalleVenta(int num)
        {
            DataTable tabla = ds.ObtenerTabla("Detalle_Venta", "SELECT CodProducto_Pr_DV AS [Codigo Producto], NombreProducto_Pr AS [Nombre Producto],cantidad as [Cantidad],PrecioUnitario AS [Precio Unitario], 'Subtotal'=(cantidad*PrecioUnitario) FROM Detalle_Venta INNER JOIN Productos ON CodProducto_Pr_DV = CodProducto_Pr where NrFactura_F_DV =" + num);
            return tabla;
        }

        public int cambiarEstadoConfirmar(string numF)
        {
           int filas= ds.EjecutarConsulta1("Factura", "UPDATE Factura SET Estado_F=0 WHERE NrFactura_F =" + numF+ "AND Estado_F = 1");
            return filas;
        }

        public void ArmarParametrosDeAgregarVenta(ref SqlCommand comando, Venta ventas)
        {
            SqlParameter SqlParametro = new SqlParameter();
            SqlParametro = comando.Parameters.Add("@CodUsuario_U_F", SqlDbType.Int);
            SqlParametro.Value = ventas.CodUsuario1;
            SqlParametro = comando.Parameters.Add("@Total_F", SqlDbType.Int);
            SqlParametro.Value = ventas.Total1;

        }

        public int AgregarVenta(Venta vent)
        {
            SqlCommand comando = new SqlCommand();
            ArmarParametrosDeAgregarVenta(ref comando, vent);
            return ds.EjectuarProcedimientoAlmacenado(comando, "spAgregarFactura");
        }
    }
}
