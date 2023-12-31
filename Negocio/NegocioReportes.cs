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
    public class NegocioReportes
    {
        public string getReporteIngreso(string fecha1, string fecha2)
        {
            DaoReportes dao = new DaoReportes();
            return dao.getReporte(fecha1, fecha2);
        }
    }
}
