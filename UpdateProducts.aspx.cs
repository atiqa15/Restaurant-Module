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
    public partial class UpdateProducts : System.Web.UI.Page
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
            objCmd.CommandText = "SELECT * FROM menuItems WHERE itemID =" + Request.QueryString["ID"];
            objCmd.CommandType = CommandType.Text;
            SqlDataReader sdr = null;
            con.Open();
            sdr = objCmd.ExecuteReader();

            while (sdr.Read())
            {
                TextBoxName.Text = (sdr["itemName"].ToString());
                TextBoxPrice.Text = (sdr["itemPrice"].ToString());
                Image.ImageUrl = (sdr["itemImage"]).ToString();
                TextBoxBio.Text = (sdr["itemDescription"].ToString());
            }
            con.Close();
        }
        protected void ButtonUpdate_Click(object sender, EventArgs e)
        {
            if (UploadProductImage.HasFile)
            {
                string imagePath = "~/images/" + UploadProductImage.FileName;
                UploadProductImage.SaveAs(Server.MapPath(imagePath).ToString());
                SqlCommand cmd = new SqlCommand("UPDATE menuItems  SET itemName = '" + TextBoxName.Text + "', itemPrice ='" + TextBoxPrice.Text + "', itemImage = '" + imagePath + "', itemDescription = '" + TextBoxBio.Text + "' WHERE itemID = " + Request.QueryString["ID"], con);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
                BindData();
            }
            
        }
    }
}