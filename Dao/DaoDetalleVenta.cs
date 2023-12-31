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
    public class DaoDetalleVenta
    {
        AccesoDatos ds = new AccesoDatos();
        public void ArmarParametrosDeAgregarDetalleVenta(ref SqlCommand comando, DetalleVenta Dventas)
        {
            SqlParameter SqlParametro = new SqlParameter();
            SqlParametro = comando.Parameters.Add("@CodProducto_Pr_DV", SqlDbType.Int);
            SqlParametro.Value = Dventas.CodigoProducto1;
            SqlParametro = comando.Parameters.Add("@cantidad", SqlDbType.Int);
            SqlParametro.Value = Dventas.Cantidad1;
            SqlParametro = comando.Parameters.Add("@PrecioUnitario", SqlDbType.Decimal);
            SqlParametro.Value = Dventas.PrecioUnitario1;

        }

        public int AgregarDetalleVenta(DetalleVenta dv)
        {
            SqlCommand comando = new SqlCommand();
            ArmarParametrosDeAgregarDetalleVenta(ref comando, dv);
            return ds.EjectuarProcedimientoAlmacenado(comando, "spAgregarDetalleVentas");
        }
    }
}
