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
    public partial class Deals : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["PSConnectionStrings"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                SqlCommand objCmd = new SqlCommand();
                objCmd.Connection = con;
                objCmd.CommandText = "SELECT * FROM promotionalDeals where restaurantID="+Session["restaurantID"];
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

        protected void ButtonSaveDeals_Click(object sender, EventArgs e)
        {
                string imagePath = "~/images/" + DealImage.FileName;
                DealImage.SaveAs(Server.MapPath(imagePath).ToString());
                SqlCommand cmd = new SqlCommand("Insert into promotionalDeals(dealName,dealImage,dealDescription,restaurantID) values('" + TextBoxDealName.Text + "','" + imagePath + "','"+TextBoxDealDescription.Text+"','"+Session["restaurantID"]+"')", con);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
                Response.Redirect("Deals.aspx");
        }
        protected void ButtonDelete_Click(object sender, EventArgs e)
        {
            string dealName = ((sender as Button).NamingContainer.FindControl("dealName") as Label).Text;
            string constr = ConfigurationManager.ConnectionStrings["PSConnectionStrings"].ConnectionString;

            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("DELETE FROM promotionalDeals WHERE dealName = @dealName AND restaurantID="+Session["restaurantID"], con))
                {
                    cmd.Parameters.AddWithValue("@dealName", dealName);
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }
            Response.Redirect("Deals.aspx");
        }

    }
}