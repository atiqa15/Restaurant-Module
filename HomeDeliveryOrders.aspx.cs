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
    public partial class HomeDeliveryOrders : System.Web.UI.Page
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
            SqlCommand objCmd = new SqlCommand();
            objCmd.Connection = con;
            objCmd.CommandText = "SELECT * FROM homeDelivery where restaurantID="+Session["restaurantID"];
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
        protected void ButtonDelete_Click(object sender, EventArgs e)
        {
            string customerName = (((sender as Button).NamingContainer.FindControl("customerName") as Label).Text);
            string constr = ConfigurationManager.ConnectionStrings["PSConnectionStrings"].ConnectionString;

            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("DELETE FROM homeDelivery WHERE customerName = @customerName", con))
                {
                    cmd.Parameters.AddWithValue("@customerName", customerName);
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }
            Response.Redirect("HomeDeliveryOrders.aspx");
        }
    }
}