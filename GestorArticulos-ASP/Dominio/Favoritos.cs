using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class Favoritos
    {
        public int Id { get; set; }
        public Users IdUser { get; set; }
        public Articulo IdArticulo { get; set; }
    }
}
