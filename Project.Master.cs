using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
namespace WebProject
{
    public partial class Project : System.Web.UI.MasterPage
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["PSConnectionStrings"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindData();
            }
        }
        private void BindData()
        {
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandText = "SELECT * from restaurantAdminAccount where restaurantAdminID="+Session["restaurantAdminID"];
            cmd.CommandType = CommandType.Text;
            SqlDataReader sdr = null;
            con.Open();
            sdr = cmd.ExecuteReader();

            while (sdr.Read())
            {
                AdminProfilename.Text = sdr["restaurantAdminName"].ToString();
                AdminPname.Text = sdr["restaurantAdminName"].ToString();
                AdminDP.ImageUrl = sdr["restaurantAdminDP"].ToString();
                AdminImage.ImageUrl = sdr["restaurantAdminDP"].ToString();
                AdminPEmail.Text = sdr["restaurantAdminEmail"].ToString();
            }
            con.Close();
        }

    }
}