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
    public partial class Add_Table : System.Web.UI.Page
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
            objCmd.CommandText = "SELECT * FROM Add_Table";
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
        protected void Button1_Click(object sender, EventArgs e)
        {
            int first = int.Parse(TableNo.Text);
            int second = int.Parse(Seats.Text);

            SqlCommand cmd = new SqlCommand("insert into Add_Table(TableNO,NoOfSeats) values('" + first + "','" + second + "')", con);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
        }
    }
}