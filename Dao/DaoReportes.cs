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
    public class DaoReportes
    {
        AccesoDatos ds = new AccesoDatos();

        public string getReporte(string fecha1, string fecha2)
        {
            string reporte = ds.obtenerResultado("SELECT 'TOTAL' = SUM(Total_F) FROM Factura where  fecha_F >='" + fecha1 + "' AND fecha_F <='" + fecha2 + "'");
            return reporte;
        }

    }
}
