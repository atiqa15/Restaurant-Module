using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;
namespace Project_Stuff
{
    public partial class ViewMenu : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["PSConnectionStrings"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                SqlCommand objCmd = new SqlCommand();
                objCmd.Connection = con;
                objCmd.CommandText = "SELECT * from menuItems where restaurantID='"+Session["restaurantID"]+"' ORDER BY itemCategory ";
                objCmd.CommandType = CommandType.Text;

                DataSet objDS = new DataSet();
                SqlDataAdapter objDA = new SqlDataAdapter();
                objDA.SelectCommand = objCmd;
                con.Open();
                objDA.Fill(objDS);
                con.Close();
                rptCategory.DataSource = objDS;
                rptCategory.DataBind();
            }

        }

       
    }
}