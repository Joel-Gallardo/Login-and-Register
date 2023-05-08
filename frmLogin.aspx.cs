using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AppLoginAndRegister
{
    public partial class frmLogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        String patron = "InfoToolsSV";
        protected void btnLogin_Click(object sender, EventArgs e)
        {           
            SqlConnection sqlConectar = new SqlConnection(ConfigurationManager.ConnectionStrings["conexionDB"].ConnectionString);
            SqlCommand cmd = new SqlCommand("SP_ValidarUsuario", sqlConectar)
            {
                CommandType = CommandType.StoredProcedure
            };
            cmd.Connection.Open();
            cmd.Parameters.Add("@Usuario", SqlDbType.VarChar, 50).Value = tbUser.Text;
            cmd.Parameters.Add("@Contrasenia", SqlDbType.VarChar, 50).Value = tbPassword.Text;
            cmd.Parameters.Add("@Patron", SqlDbType.VarChar, 50).Value = patron;
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                //Agregamos una sesion de usuario
                Session["usuariologueado"] = tbUser.Text;
                Response.Redirect("frmIndex.aspx");
            }
            else
            {
                lblError.Text = "La Contraseña ingresada es incorrecta";
            }

            cmd.Connection.Close();
        }

        protected void btnRegistro_Click(object sender, EventArgs e)
        {
            Response.Redirect("frmRegistro.aspx");
        }
    }
}