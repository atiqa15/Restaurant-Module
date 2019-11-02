<%@ Page Title="" Language="C#" MasterPageFile="~/Project.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="Project_Stuff.Home" %>
<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <!-- PAGE CONTAINER-->
        <div class="page-container">
            <!-- HEADER DESKTOP-->
          <div class="main-content">
                <div class="section__content section__content--p30">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="overview-wrap">
                                    <h2 class="title-1">overview</h2>
                                </div>
                            </div>
                        </div>
                        <div class="row m-t-25">
                            <div class="col-sm-6 col-lg-3">
                                <div class="overview-item overview-item--c1" style="height:273px">
                                    <div class="overview__inner">
                                        <div class="overview-box clearfix">
                                            <a href="Customers.aspx">
                                             <div class="icon">
                                                <i class="zmdi zmdi-account-o"></i>
                                            </div>
                                            <br />
                                            <div class="text">
                                                <h2><asp:Label ID="customers" runat="server" Text=""></asp:Label></h2>
                                                <span>Customers</span>
                                            </div>
                                            </a>
                                        </div>
                                        <div class="overview-chart">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-6 col-lg-3">
                                <div class="overview-item overview-item--c2">
                                    <div class="overview__inner">
                                        <div class="overview-box clearfix">
                                            <a href="DineInOrder.aspx">
                                            <div class="icon">
                                                <i class="zmdi zmdi-shopping-cart"></i>
                                            </div>
                                            <div class="text">
                                                <h2> <asp:Label ID="tablereservation" runat="server" Text=""></asp:Label></h2>
                                                <span> Table Reservations</span>
                                            </div>
                                            </a>
                                        </div>
                                        <div class="overview-chart">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-6 col-lg-3">
                                <div class="overview-item overview-item--c3">
                                    <div class="overview__inner">
                                        <div class="overview-box clearfix">
                                            <a href="HomeDeliveryOrders.aspx">
                                            <div class="icon">
                                                <i class="zmdi zmdi-calendar-note"></i>
                                            </div>
                                            <div class="text">
                                                <h2>
                                                    <asp:Label ID="homedelivery" runat="server" Text=""></asp:Label></h2>
                                                <span>Home Delivery</span>
                                            </div>
                                            </a>
                                        </div>
                                        <div class="overview-chart">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-6 col-lg-3">
                                <div class="overview-item overview-item--c4">
                                    <div class="overview__inner">
                                        <div class="overview-box clearfix">
                                            <a href="DineInOrder.aspx">
                                            <div class="icon">
                                                <i class="zmdi zmdi-calendar-note"></i>
                                            </div>
                                            <div class="text">
                                                <h2>
                                                    <asp:Label ID="dineinorder" runat="server" Text=""></asp:Label></h2>
                                                <span>Dine-IN Orders</span>
                                            </div>
                                            </a>
                                        </div>
                                        <div class="overview-chart">
                                          </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-6">
                                <div class="au-card recent-report">
                                    <div class="au-card-inner">
                                        <h3 class="title-2">recent reports</h3>
                                        <div class="chart-info">
                                            <div class="chart-info__left">
                                                <div class="chart-note">
                                                    <span class="dot dot--blue"></span>
                                                    <span>Table Reservations</span>
                                                </div>
                                             </div>
                                          </div>
                                        <div class="recent-report__chart">
                                            <asp:Chart ID="Chart1" runat="server" DataSourceID="SqlDataSource1">
                                                <Series>
                                                    <asp:Series ChartType="SplineArea" Name="Series1" XValueMember="customerName" YValueMembers="NoOfPersons">
                                                    </asp:Series>
                                                </Series>
                                                <ChartAreas>
                                                    <asp:ChartArea Name="ChartArea1">
                                                    </asp:ChartArea>
                                                </ChartAreas>
                                            </asp:Chart>
                                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:PSConnectionStrings %>" SelectCommand="SELECT bookingID, customerName, arrivalTime, checkoutTime, date, NoOfPersons, tableNo, discountID, customerID, restaurantID FROM tableReservation WHERE (restaurantID = @restaurantID)">
                                                <SelectParameters>
                                                    <asp:SessionParameter Name="restaurantID" SessionField="restaurantID" />
                                                </SelectParameters>
                                            </asp:SqlDataSource>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="au-card chart-percent-card">
                                    <div class="au-card-inner">
                                        <h3 class="title-2 tm-b-5">char by %</h3>
                                        <div class="row no-gutters">
                                            <div class="col-xl-6">
                                                <div class="chart-note-wrap">
                                                    <div class="chart-note mr-0 d-block">
                                                        <span class="dot dot--blue"></span>
                                                        <span>Menu Items</span>
                                                    </div>
                                                 </div>
                                            </div>
                                            <div class="col-xl-6">
                                                <div class="percent-chart">
                                                    <asp:Chart ID="Chart2" runat="server" DataSourceID="SqlDataSource2">
                                                        <Series>
                                                            <asp:Series ChartType="Pie" Name="Series1" XValueMember="itemName" YValueMembers="itemPrice">
                                                            </asp:Series>
                                                        </Series>
                                                        <ChartAreas>
                                                            <asp:ChartArea Name="ChartArea1">
                                                            </asp:ChartArea>
                                                        </ChartAreas>
                                                    </asp:Chart>
                                                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:PSConnectionStrings %>" SelectCommand="SELECT itemID, itemName, itemCategory, itemPrice, itemImage, itemDescription, restaurantID FROM menuItems WHERE (restaurantID = @restaurantID)">
                                                        <SelectParameters>
                                                            <asp:SessionParameter Name="restaurantID" SessionField="restaurantID" />
                                                        </SelectParameters>
                                                    </asp:SqlDataSource>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-12">
                                <h2 class="title-1 m-b-25">Recent Reservations:</h2>
                                <div class="table-responsive table--no-card m-b-40">
                                     <asp:Repeater ID="ItemsSold" runat="server">
                                            <HeaderTemplate>
                                                    <table class="table table-borderless table-striped table-earning">
                                                        <tr style="background-color:black; color:white;width:100px; font-size:13px;">
                                                        <th class="text-center">Customer Name</th>
                                                        <th class="text-center">Checkin Time</th>
                                                        <th class="text-center">Date</th>
                                                        <th class="text-center">Food Order</th>
                                                        <th class="text-center">Quantity</th>
                                                        <th class="text-center">Price</th>
                                                        </tr>
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <tr>
                                                        <td class="text-center" style="width:100px; font-size:13px;"><asp:Label ID="customerName" runat="server" Text='<%# Eval("customerName") %>'/></td>
                                                        <td class="text=center" style="width:100px; font-size:13px;"><asp:Label ID="arrivalTime" runat="server" Text='<%# Eval("arrivalTime") %>'/></td>
                                                        <td class="text-center" style="width:100px; font-size:13px;"><asp:Label ID="Date" runat="server" Text='<%#Convert.ToDateTime(Eval("date")).ToShortDateString() %>'/></td>
                                                        <td class="text-center" style="width:100px; font-size:13px;"><asp:Label ID="foodOrder" runat="server" Text='<%#Eval("itemName") %>'/></td>
                                                        <td class="text-center" style="width:100px; font-size:13px;"><asp:Label ID="quantity" runat="server" Text='<%#Eval("quantity") %>'/></td>
                                                        <td class="text-center" style="width:100px; font-size:13px;"><asp:Label ID="Price" runat="server" Text='<%#Eval("totalPrice") %>'/></td>
                                                     </tr>
                                                </ItemTemplate>
                                                <FooterTemplate>
                                                    </table>
                                                </FooterTemplate>
                                        </asp:Repeater>
                                  </div>
                            </div>
                          </div>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="copyright">
                                    <p>Copyright © 2019 Hisham Hashmi. All rights reserved.</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- END MAIN CONTENT-->
            <!-- END PAGE CONTAINER-->
        </div>
</asp:Content>
