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
    public partial class Add_Product : System.Web.UI.Page
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
                objCmd.CommandText = "SELECT * FROM menuItems where restaurantID='"+Session["restaurantID"]+ "'ORDER BY itemCategory ";
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
                string imagePath = "~/images/" + newImage.FileName;
                newImage.SaveAs(Server.MapPath(imagePath).ToString());
                SqlCommand cmd = new SqlCommand("Insert into menuItems(itemName,itemCategory,itemPrice,itemImage,itemDescription,restaurantID) values ('" + TextBoxName.Text + "','" + CategoryList.Text + "','" + TextBoxPrice.Text + "','" + imagePath + "','" + TextBoxBio.Text + "','"+Session["restaurantID"]+"')", con);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
                Response.Redirect("Add_Product.aspx");
            }
            protected void ButtonDelete_Click(object sender, EventArgs e)
            {
                string itemName = (((sender as Button).NamingContainer.FindControl("itemName") as Label).Text);
                string constr = ConfigurationManager.ConnectionStrings["PSConnectionStrings"].ConnectionString;

                using (SqlConnection con = new SqlConnection(constr))
                {
                    using (SqlCommand cmd = new SqlCommand("DELETE FROM menuItems WHERE itemName = @itemName AND restaurantID="+Session["restaurantID"], con))
                    {
                        cmd.Parameters.AddWithValue("@itemName", itemName);
                        con.Open();
                        cmd.ExecuteNonQuery();
                        con.Close();
                    }
                }
                Response.Redirect("Add_Product.aspx");
            }
        }
    }