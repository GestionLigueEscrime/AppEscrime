using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Btssio.Escrime
{
    public class GestionDB
    {
        private static BaseEscrimeEntities db = new BaseEscrimeEntities();

        public static BaseEscrimeEntities getContext()
        {
            return db;
        }
    }
}
