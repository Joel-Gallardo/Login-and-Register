using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;


namespace AppLoginAndRegister
{
    public partial class frmRegistro : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lblError.Text = "";
            lblErrorContrasenia.Text = "";
            LeerDatos();
        }
        SqlConnection conexion = new SqlConnection(ConfigurationManager.ConnectionStrings["conexionDB"].ConnectionString);

        void Limpiar()
        {
            tbNombres.Text = "";
            tbApellidos.Text = "";
            tbFechaNacimiento.Text = "";
            tbUsuario.Text = "";
            tbContrasenia.Text = "";
            tbConfirmarContrasenia.Text = "";
            lblError.Text = "";
            lblErrorContrasenia.Text = "";
        }
        protected void BtnRegistrar_Click(object sender, EventArgs e)
        {
            if (tbNombres.Text == "" || tbApellidos.Text == "" || tbFechaNacimiento.Text == "" || tbUsuario.Text == "" || tbContrasenia.Text == "" || tbConfirmarContrasenia.Text == "")
            {
                lblError.Text = "Todos los campos son obligatorios";
            }
            else
            {
                if (tbContrasenia.Text != tbConfirmarContrasenia.Text)
                {
                    lblErrorContrasenia.Text = "Las contraseñas no coinciden";

                }
                else
                {
                    conexion.Open();
                    SqlCommand cmd = new SqlCommand("select count(*) from usuarios where usuario = '" + tbUsuario.Text + "'", conexion)
                    {
                        CommandType = System.Data.CommandType.Text
                    };
                    cmd.Parameters.AddWithValue("Usuario", tbUsuario.Text);
                    int usuario = Convert.ToInt32(cmd.ExecuteScalar());
                    String patron = "InfoToolsSV";
                    if (usuario < 1)
                    {
                        SqlCommand cmm = new SqlCommand("insert into Usuarios values ('" + tbNombres.Text + "','" + tbApellidos.Text + "','" + tbFechaNacimiento.Text + "','" + tbUsuario.Text + "',(EncryptByPassPhrase('" + patron + "','" + tbContrasenia.Text + "')))", conexion);
                        cmm.ExecuteNonQuery();
                        conexion.Close();
                        Limpiar();
                        LeerDatos();
                        Response.Redirect("frmLogin.aspx");
                    }
                    else
                    {
                        lblError.Text = "El nombre de usuario " + tbUsuario.Text + " ya existe";
                        tbUsuario.Text = "";
                    }
                }
            }
        }
        void LeerDatos()
        {
            SqlCommand leerdatos = new SqlCommand("Select * from Usuarios", conexion);
            SqlDataAdapter da = new SqlDataAdapter(leerdatos);
            DataTable dt = new DataTable();
            da.Fill(dt);
            gvUsuarios.DataSource = dt;
            gvUsuarios.DataBind();
        }

        protected void BtnRegresar_Click(object sender, EventArgs e)
        {
            Response.Redirect("frmLogin.aspx");
        }
    }

}