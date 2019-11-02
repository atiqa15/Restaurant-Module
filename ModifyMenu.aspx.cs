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
    public partial class ModifyMenu : System.Web.UI.Page
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
            objCmd.CommandText = "SELECT * FROM menuCategories WHERE menuCategoryID = " + Request.QueryString["ID"];

            objCmd.CommandType = CommandType.Text;
            SqlDataReader sdr = null;
            con.Open();
            sdr = objCmd.ExecuteReader();

            while (sdr.Read())
            {
                TextBoxName.Text = (sdr["categoryName"].ToString());
                Image.ImageUrl = (sdr["categoryImage"]).ToString();
            }
            con.Close();
        }
        protected void ButtonUpdate_Click(object sender, EventArgs e)
        {
            if (UploadImage.HasFile)
            {
                string imagePath = "~/images/" + UploadImage.FileName;
                UploadImage.SaveAs(Server.MapPath(imagePath).ToString());
                SqlCommand cmd = new SqlCommand("UPDATE menuCategories  SET categoryName = '" + TextBoxName.Text + "', categoryImage = '" + imagePath + "' WHERE menuCategoryID = " + Request.QueryString["ID"], con);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
                TextBoxName.Text = "";
                imagePath = "";
            }
            else { }
        }
    }
}
