using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
namespace Project_Stuff
{
    public partial class modifyDeals : System.Web.UI.Page
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
            objCmd.CommandText = "SELECT * FROM promotionalDeals WHERE dealID = " + Request.QueryString["ID"];

            objCmd.CommandType = CommandType.Text;
            SqlDataReader sdr = null;
            con.Open();
            sdr = objCmd.ExecuteReader();

            while (sdr.Read())
            {
                NewDealName.Text = (sdr["dealName"].ToString());
                Image.ImageUrl = (sdr["dealImage"]).ToString();
                DealDescription.Text = (sdr["dealDescription"].ToString());
            }
            con.Close();
        }
        protected void ButtonUpdate_Click(object sender, EventArgs e)
        {
            if (UploadNewImage.HasFile)
            {
                string imagePath = "~/images/" + UploadNewImage.FileName;
                UploadNewImage.SaveAs(Server.MapPath(imagePath).ToString());
                SqlCommand cmd = new SqlCommand("UPDATE promotionalDeals  SET dealName = '" + NewDealName.Text + "', dealImage = '" + imagePath + "', dealDescription = '" + DealDescription.Text + "' WHERE dealID = " + Request.QueryString["ID"], con);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
            }
            else { }
        }
        protected void ButtonReturn_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Deals.aspx");
        }
    }
}