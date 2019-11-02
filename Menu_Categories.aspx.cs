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
    public partial class Menu_Categories : System.Web.UI.Page
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
            objCmd.CommandText = "SELECT * FROM menuCategories WHERE restaurantID =" +Session["restaurantID"];
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
        protected void ButtonInsert_Click(object sender, EventArgs e)
        {
            if (UploadImage.HasFile)
            {
                string imagePath = "~/images/" + UploadImage.FileName;
                UploadImage.SaveAs(Server.MapPath(imagePath).ToString());
                SqlCommand cmd = new SqlCommand("insert into menuCategories(categoryName,categoryImage,restaurantID) values('" + TextBoxCategoryName.Text + "','" + imagePath +"', '"+Session["restaurantID"]+"') ",con);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
                TextBoxCategoryName.Text = "";
                imagePath = "";
            }
            else{ }
            Response.Redirect("Menu_Categories.aspx");
        }
        protected void ButtonDelete_Click(object sender, EventArgs e)
        {
            string categoryName = ((sender as Button).NamingContainer.FindControl("CategoryName") as Label).Text;
            string constr = ConfigurationManager.ConnectionStrings["PSConnectionStrings"].ConnectionString;

            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("DELETE FROM menuCategories WHERE categoryName = @categoryName", con))
                {
                    cmd.Parameters.AddWithValue("@categoryName", categoryName);
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }
            Response.Redirect("Menu_Categories.aspx");
        }
    }
}