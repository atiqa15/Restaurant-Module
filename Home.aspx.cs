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
    public partial class Home : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["PSConnectionStrings"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {

          
            if (!IsPostBack)
            {
            
                BindDataTable();
                BindData();
                BindData1();
                BindData2();
                BindData3();
            }
        }
        private void BindDataTable()
        {
            SqlCommand objCmd = new SqlCommand();
            objCmd.Connection = con;
            objCmd.CommandText = "select * from DineINOrder INNER JOIN orderDetails ON DineINOrder.orderID = orderDetails.orderID WHERE DineINOrder.restaurantID='"+Session["restaurantID"]+"' ORDER BY DineINOrder.orderID";
            objCmd.CommandType = CommandType.Text;
            DataSet objDS = new DataSet();
            SqlDataAdapter objDA = new SqlDataAdapter();
            objDA.SelectCommand = objCmd;
            con.Open();
            objDA.Fill(objDS);
            con.Close();
            ItemsSold.DataSource = objDS;
            ItemsSold.DataBind();
        }
        private void BindData()
        {
            SqlCommand objCmd = new SqlCommand();
            objCmd.Connection = con;
            objCmd.CommandText = "SELECT * FROM customer";
            objCmd.CommandType = CommandType.Text;
            DataSet objDS = new DataSet();
            SqlDataAdapter sda = new SqlDataAdapter();
            sda.SelectCommand = objCmd;
            con.Open();
            sda.Fill(objDS);
            customers.Text = objDS.Tables[0].Rows.Count.ToString();
            con.Close();
        }
        private void BindData1()
        {
            SqlCommand objCmd = new SqlCommand();
            objCmd.Connection = con;
            objCmd.CommandText = "SELECT * FROM tableReservation where restaurantID=" + Session["restaurantID"];
            objCmd.CommandType = CommandType.Text;
            DataSet objDS = new DataSet();
            SqlDataAdapter sda = new SqlDataAdapter();
            sda.SelectCommand = objCmd;
            con.Open();
            sda.Fill(objDS);
            tablereservation.Text = objDS.Tables[0].Rows.Count.ToString();
            con.Close();
        }
        private void BindData2()
        {
            SqlCommand objCmd = new SqlCommand();
            objCmd.Connection = con;
            objCmd.CommandText = "SELECT * FROM homeDelivery WHERE restaurantID=" + Session["restaurantID"];
            objCmd.CommandType = CommandType.Text;
            DataSet objDS = new DataSet();
            SqlDataAdapter sda = new SqlDataAdapter();
            sda.SelectCommand = objCmd;
            con.Open();
            sda.Fill(objDS);
            homedelivery.Text = objDS.Tables[0].Rows.Count.ToString();
            con.Close();
        }
        private void BindData3()
        {
            SqlCommand objCmd = new SqlCommand();
            objCmd.Connection = con;
            objCmd.CommandText = "SELECT * FROM DineINOrder WHERE restaurantID=" +Session["restaurantID"];
            objCmd.CommandType = CommandType.Text;
            DataSet objDS = new DataSet();
            SqlDataAdapter sda = new SqlDataAdapter();
            sda.SelectCommand = objCmd;
            con.Open();
            sda.Fill(objDS);
            dineinorder.Text = objDS.Tables[0].Rows.Count.ToString();
            con.Close();
        }
    }

}