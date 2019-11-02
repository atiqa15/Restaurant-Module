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
namespace WebProject
{
    public partial class UserAccount : System.Web.UI.Page
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
            cmd.CommandText = "SELECT * from restaurantAdminAccount where restaurantAdminID=" + Session["restaurantAdminID"];
            cmd.CommandType = CommandType.Text;
            SqlDataReader sdr = null;
            con.Open();
            sdr = cmd.ExecuteReader();

            while (sdr.Read())
            {
                UsernameLabel.Text = (sdr["restaurantAdminUsername"].ToString());
                UserProfileName.Text = (sdr["restaurantAdminName"].ToString());
                ProfileImage.ImageUrl = (sdr["restaurantAdminDP"]).ToString();
                AdminProfileEmail.Text = (sdr["restaurantAdminEmail"].ToString());
            }
            con.Close();
        }
        protected void ButtonSave_Click(object sender, EventArgs e)
        {
            if (ImageUpdate.HasFile)
            {
                string imagePath = "~/images/" + ImageUpdate.FileName;
                ImageUpdate.SaveAs(Server.MapPath(imagePath).ToString());
                SqlCommand cmd = new SqlCommand("UPDATE restaurantAdminAccount  SET restaurantAdminName = '" + UserProfileName.Text + "', restaurantAdminDP ='" + imagePath + "', restaurantAdminEmail = '" + AdminProfileEmail.Text + "'  WHERE restaurantAdminID = " + Session["restaurantAdminID"], con);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
                BindData();
            }
            Response.Redirect("UserAccount.aspx");
        }

    }
}