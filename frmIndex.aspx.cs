using System;

namespace AppLoginAndRegister
{
    public partial class frmIndex : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["usuariologueado"] != null)
            {
                String usuariologueado = Session["usuariologueado"].ToString();
                lblBienvenida.Text = "Welcome " + usuariologueado;
            }
            else
            {
                Response.Redirect("frmLogin.aspx");
            }
        }
        protected void BtnCerrar_click(object sender, EventArgs e)
        {
            Session.Remove("usuariologuedo");
            Response.Redirect("frmLogin.aspx");

        }
    }
}