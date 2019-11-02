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
    public partial class DineInOrder : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["PSConnectionStrings"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ReservationCalender.Visible = false;
                CalDineIN.Visible = false;
                BindData();
                BindDineINData();
            }
        }
        private void BindData()
        {
            SqlCommand objCmd = new SqlCommand();
            objCmd.Connection = con;
            objCmd.CommandText = "select * from tableReservation where restaurantID="+Session["restaurantID"];
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
        private void BindDineINData()
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
            RepeaterDineIN.DataSource = objDS;
            RepeaterDineIN.DataBind();
        }
        protected void DeleteButton_Click(object sender, EventArgs e)
        {
            string customerName = (((sender as Button).NamingContainer.FindControl("customerName") as Label).Text);
            string constr = ConfigurationManager.ConnectionStrings["PSConnectionStrings"].ConnectionString;

            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("DELETE FROM tableReservation WHERE customerName = @customerName", con))
                {
                    cmd.Parameters.AddWithValue("@customerName", customerName);
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
                Response.Redirect("DineInOrder.aspx");
            }
        }
        protected void ButtonDelete_Click(object sender, EventArgs e)
        {
            string customerName = (((sender as Button).NamingContainer.FindControl("customerName") as Label).Text);
            string quantity = (((sender as Button).NamingContainer.FindControl("quantity") as Label).Text);
            string constr = ConfigurationManager.ConnectionStrings["PSConnectionStrings"].ConnectionString;
     
            using (SqlConnection con = new SqlConnection(constr))
            {
                con.Open();
                SqlTransaction sqlTran;
                sqlTran = con.BeginTransaction();
                SqlCommand cmd = con.CreateCommand();
                cmd.Transaction = sqlTran;
               
                    cmd.CommandText = "DELETE FROM orderDetails WHERE quantity = @quantity";
                    cmd.Parameters.AddWithValue("@quantity", quantity);
                    cmd.ExecuteNonQuery();
                    cmd.CommandText = "DELETE FROM DineINOrder WHERE customerName = @customerName";
                    cmd.Parameters.AddWithValue("@customerName", customerName);
                    cmd.ExecuteNonQuery();
                    sqlTran.Commit();
                con.Close();
                Response.Redirect("DineInOrder.aspx");
            }
        }

        protected void ReservationCalender_DayRender(object sender, DayRenderEventArgs e)
        {
            SqlCommand objCmd = new SqlCommand();
            objCmd.Connection = con;
            objCmd.CommandText = "select * from tableReservation";
            objCmd.CommandType = CommandType.Text;
            DataSet objDS = new DataSet();
            SqlDataAdapter objDA = new SqlDataAdapter();
            objDA.SelectCommand = objCmd;
            objDA.Fill(objDS);
            DataTable dt = objDS.Tables["tableReservation"];
            DataRowCollection drc = dt.Rows;
            if (drc.Count > 0)
            {
                Literal literal1 = new Literal();
                literal1.Text = "<br/>";
                e.Cell.Controls.Add(literal1);
                foreach (DataRow dr in drc)
                {
                    DateTime dtDob = Convert.ToDateTime(dr["Date"]);
                    if (e.Day.Date.Day == dtDob.Day && e.Day.Date.Month == dtDob.Month)
                    {
                        e.Cell.BackColor = System.Drawing.Color.Yellow;
                        e.Cell.ForeColor = System.Drawing.Color.Red;
                        e.Cell.ToolTip = "Reservation";
                        Image img1 = new Image();
                        img1.ImageUrl = "~/images/icon/tick.png";
                        img1.ToolTip = dr["customerName"].ToString();
                        e.Cell.Controls.Add(img1);
                    }
                }
            }
        }


        protected void calenderButton_Click(object sender, ImageClickEventArgs e)
        {
            ReservationCalender.Visible = true;
        }

        protected void ReservationCalender_SelectionChanged(object sender, EventArgs e)
        {
            DateTime dtSeleted = ReservationCalender.SelectedDate;
            calenderLabel.Text = dtSeleted.ToShortDateString();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandText = "Select * from tableReservation Where [Date] = '" + dtSeleted.ToShortDateString() + "'";
            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = cmd;
            da.SelectCommand.CommandType = CommandType.Text;
            DataSet ds = new DataSet();
            con.Open();
            da.Fill(ds);
            con.Close();
            rptCategory.DataSource = ds;
            rptCategory.DataBind();
            ReservationCalender.Visible = false;
        }

        protected void DineINCalender_DayRender(object sender, DayRenderEventArgs e)
        {
            SqlCommand objCmd = new SqlCommand();
            objCmd.Connection = con;
            objCmd.CommandText = "select * from DineINOrder INNER JOIN orderDetails ON DineINOrder.orderID = orderDetails.orderID  ORDER BY DineINOrder.orderID";
            objCmd.CommandType = CommandType.Text;
            DataSet objDS = new DataSet();
            SqlDataAdapter objDA = new SqlDataAdapter();
            objDA.SelectCommand = objCmd;
            objDA.Fill(objDS);
            DataTable dt = objDS.Tables["DineINOrder"];
            DataRowCollection drc = dt.Rows;
            if (drc.Count > 0)
            {
                Literal literal1 = new Literal();
                literal1.Text = "<br/>";
                e.Cell.Controls.Add(literal1);
                foreach (DataRow dr in drc)
                {
                    DateTime dtDob = Convert.ToDateTime(dr["Date"]);
                    if (e.Day.Date.Day == dtDob.Day && e.Day.Date.Month == dtDob.Month)
                    {
                        e.Cell.BackColor = System.Drawing.Color.Yellow;
                        e.Cell.ForeColor = System.Drawing.Color.Red;
                        e.Cell.ToolTip = "Dine-IN Order";
                        Image img1 = new Image();
                        img1.ImageUrl = "~/images/icon/tick.png";
                        img1.ToolTip = dr["customerName"].ToString();
                        e.Cell.Controls.Add(img1);
                    }
                }
            }
        }

        protected void CalImage_Click(object sender, ImageClickEventArgs e)
        {
            CalDineIN.Visible = true;
        }

        protected void DineINCalender_SelectionChanged(object sender, EventArgs e)
        {
            DateTime dtSeleted = CalDineIN.SelectedDate;
            CalLabel.Text = dtSeleted.ToShortDateString();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandText = "Select * from DineINOrder Where [Date] = '" + dtSeleted.ToShortDateString() + "'";
            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = cmd;
            da.SelectCommand.CommandType = CommandType.Text;
            DataSet ds = new DataSet();
            con.Open();
            da.Fill(ds);
            con.Close();
            RepeaterDineIN.DataSource = ds;
            RepeaterDineIN.DataBind();
            CalDineIN.Visible = false;
        }
    }
}