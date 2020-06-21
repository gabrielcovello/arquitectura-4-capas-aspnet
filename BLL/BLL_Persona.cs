using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public class BLL_Persona
    {
        DAL.MP_Persona mp = new DAL.MP_Persona();
        public int Grabar(BE.Persona persona)
        {
            int res = 0;
            if (persona.id == 0)
            {
                res=mp.Insertar(persona);
            }
            else
            {
                res = mp.Editar(persona);
            }
            return res;
        }

        public int Borrar(BE.Persona persona)
        {
            return mp.Borrar(persona);
        }

        public List<BE.Persona> Listar()
        {
            return mp.Listar(); 
        }

        public BE.Persona Listar(int id)
        {
            return mp.Listar(id);
        }   

    }
}
