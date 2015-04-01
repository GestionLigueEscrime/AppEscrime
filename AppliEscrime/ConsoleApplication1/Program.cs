using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Btssio.Escrime;

namespace Test.Escrime
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Hello world");
            BaseEscrimeEntities db = GestionDB.getContext();
            CLUB unClub = new CLUB("le club de test", "MermozLand");
            Console.WriteLine(unClub);
            Console.ReadKey();
        }
    }
}
