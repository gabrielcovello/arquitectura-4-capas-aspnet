using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using BE;

namespace DAL
{
    public class MP_Persona
    {

        private Acceso acceso = new Acceso();
        public List<BE.Persona> Listar()
        {
            DataTable tabla = acceso.Leer("ListarPersona", null);
            List<BE.Persona> personas = new List<BE.Persona>();

            foreach (DataRow registro in tabla.Rows)
            {
                BE.Persona persona = new BE.Persona();

                persona.id=int.Parse(registro["Id"].ToString());
                persona.nombre = (registro["Nombre"].ToString());
                persona.apellido = (registro["Apellido"].ToString());

                personas.Add(persona);
            }

            return personas;
        }

        public int Insertar(BE.Persona persona)
        {
            List<SqlParameter> parameters = new List<SqlParameter>();
            parameters.Add(acceso.CrearParametro("@nombre", persona.nombre));
            parameters.Add(acceso.CrearParametro("@apellido", persona.apellido));

            return acceso.Escribir("InsertarPersona", parameters);


        }

        public int Editar(BE.Persona persona)
        {
            List<SqlParameter> parameters = new List<SqlParameter>();
            parameters.Add(acceso.CrearParametro("@nombre", persona.nombre));
            parameters.Add(acceso.CrearParametro("@apellido", persona.apellido));
            parameters.Add(acceso.CrearParametro("@id", persona.id));

            return acceso.Escribir("ModificarPersona", parameters);
        }

        public int Borrar(BE.Persona persona)
        {
            List<SqlParameter> parameters = new List<SqlParameter>();
            parameters.Add(acceso.CrearParametro("@id", persona.id));

            return acceso.Escribir("BorrarPersona", parameters);
        }

        public BE.Persona Listar(int id)
        {
            DataTable tabla = acceso.Leer("ListarPersona", null);
            BE.Persona persona = new BE.Persona();
            DataRow registro = tabla.Rows[0];

            persona.id = int.Parse(registro["Id"].ToString());
            persona.nombre = (registro["Nombre"].ToString());
            persona.apellido = (registro["Apellido"].ToString());

            return persona;
        }

    }
}
