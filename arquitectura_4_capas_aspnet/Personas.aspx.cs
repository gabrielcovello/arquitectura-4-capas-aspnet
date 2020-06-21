using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace arquitectura_4_capas_aspnet
{
    public partial class Personas : System.Web.UI.Page
    {
        BLL.BLL_Persona gestor = new BLL.BLL_Persona();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                Enlazar();
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            hid.Value = "0";
            txtNombre.Text = "";
            txtApellido.Text = "";
            
        }

        public void Enlazar()
        {
            GridView1.DataSource = gestor.Listar();
            GridView1.DataBind();
        }
        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int id = int.Parse(GridView1.Rows[int.Parse(e.CommandArgument.ToString())].Cells[2].Text);
            BE.Persona per = gestor.Listar(id);

            switch (e.CommandName)
            {
                case "Borrar":
                    {
                        gestor.Borrar(per);
                        Enlazar();
                        break;
                    }
                case "Seleccionar":
                    {
                        hid.Value = per.id.ToString();
                        txtNombre.Text = per.nombre;
                        txtApellido.Text = per.apellido;
                        break;
                    }
            }
        }

        protected void Guardar_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(hid.Value))
            {
                hid.Value = "0";
            }

            BE.Persona per = new BE.Persona();

            per.id = int.Parse(hid.Value);
            per.nombre = txtNombre.Text;
            per.apellido = txtApellido.Text;

            gestor.Grabar(per);
            Enlazar();
        }
    }
}