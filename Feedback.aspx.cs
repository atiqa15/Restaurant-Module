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
    public partial class Feedback : System.Web.UI.Page
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
            objCmd.CommandText = "SELECT restCustomerFName,restCustomerLName, restCustomerEmail,restsubject,restFeedback FROM restaurantFeedback";
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
            string customerEmail = (((sender as Button).NamingContainer.FindControl("customerEmail") as Label).Text);
            string constr = ConfigurationManager.ConnectionStrings["PSConnectionStrings"].ConnectionString;

            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("DELETE FROM restaurantFeedback WHERE restCustomerEmail = @customerEmail", con))
                {
                    cmd.Parameters.AddWithValue("@customerEmail", customerEmail);
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }
            Response.Redirect("Feedback.aspx");
        }
    }
}