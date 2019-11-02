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
    public partial class Profile : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["PSConnectionStrings"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                SqlCommand Objcmd = new SqlCommand();
                Objcmd.Connection = con;
                Objcmd.CommandText = "SELECT * from restaurantProfile where restaurantAdminAccountID=" + Session["restaurantAdminID"];
                Objcmd.CommandType = CommandType.Text;
                con.Open();
                Objcmd.ExecuteNonQuery();
                DataTable objDT = new DataTable();
                SqlDataAdapter objDA = new SqlDataAdapter(Objcmd);
                objDA.Fill(objDT);
                foreach (DataRow objDr in objDT.Rows)
                {
                    Session["restaurantID"] = objDr["restaurantID"].ToString();
                }
                con.Close();
                BindData();
            }
        }
        private void BindData()
        {
            SqlCommand objCmd = new SqlCommand();
            objCmd.Connection = con;
            objCmd.CommandText = "SELECT * FROM restaurantProfile where restaurantAdminAccountID=" + Session["restaurantAdminID"];
            objCmd.CommandType = CommandType.Text;
            SqlDataReader sdr = null;
            con.Open();
            sdr = objCmd.ExecuteReader();

            while (sdr.Read())
            {
                TextBoxName.Text = (sdr["restaurantName"].ToString());
                TextBoxContact.Text = (sdr["restaurantContactNo"].ToString());
                TextBoxEmail.Text = (sdr["restaurantEmail"]).ToString();
                TextBoxAddress.Text = (sdr["restaurantAddress"].ToString());
                TextBoxOpeningTime.Text = (sdr["restaurantOpeningTime"].ToString());
                TextBoxClosingTime.Text = (sdr["restaurantClosingTime"].ToString());
                TextBoxCapacity.Text = (sdr["restaurantCapacity"].ToString());
                TextBoxBio.Text = (sdr["restaurantDescription"].ToString());
                Image.ImageUrl = (sdr["restaurantDP"]).ToString();
            }
            con.Close();
        }
        protected void ButtonSubmit_Click(object sender, EventArgs e)
        {
            string imagePath = "~/images/" + UploadImage.FileName;
            UploadImage.SaveAs(Server.MapPath(imagePath).ToString());
            SqlCommand cmd = new SqlCommand("insert into restaurantProfile(restaurantName,restaurantContactNo,restaurantEmail,restaurantAddress,restaurantOpeningTime,restaurantClosingTime,restaurantCapacity,restaurantDescription,restaurantAdminAccountID,restaurantDP)values('" + TextBoxName.Text + "','" + TextBoxContact.Text + "','" + TextBoxEmail.Text + "','" + TextBoxAddress.Text + "','" + TextBoxOpeningTime.Text + "','" + TextBoxClosingTime.Text + "','" + TextBoxCapacity.Text + "','" + TextBoxBio.Text + "','" + Session["restaurantAdminID"] + "','" + imagePath + "')", con);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
        }

        protected void ButtonReset_Click(object sender, EventArgs e)
        {
            TextBoxName.Text = "";
            TextBoxContact.Text = "";
            TextBoxEmail.Text = "";
            TextBoxAddress.Text = "";
            TextBoxOpeningTime.Text = "";
            TextBoxClosingTime.Text = "";
            TextBoxCapacity.Text = "";
            TextBoxBio.Text = "";
            Response.Redirect("~/Profile.aspx");
        }

        protected void ButtonUpdate_Click(object sender, EventArgs e)
        {
            if (UploadImage.HasFile)
            {
                string imagePath = "~/images/" + UploadImage.FileName;
                UploadImage.SaveAs(Server.MapPath(imagePath).ToString());
                SqlCommand cmd = new SqlCommand("UPDATE restaurantProfile SET restaurantName = '" + TextBoxName.Text + "',restaurantContactNo = '" + TextBoxContact.Text + "', restaurantEmail = '" + TextBoxEmail.Text + "' ,restaurantAddress = '" + TextBoxAddress.Text + "',restaurantOpeningTime = '" + TextBoxOpeningTime.Text + "',restaurantClosingTime = '" + TextBoxClosingTime.Text + "',restaurantCapacity = '" + TextBoxCapacity.Text + "',restaurantDescription = '" + TextBoxBio.Text + "',restaurantDP = '" + imagePath + "' WHERE restaurantAdminAccountID = " + Session["restaurantAdminID"], con);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
                BindData();
            }
        }
    }
}