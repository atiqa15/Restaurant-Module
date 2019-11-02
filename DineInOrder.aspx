<%@ Page Title="" Language="C#" MasterPageFile="~/Project.Master" AutoEventWireup="true" CodeBehind="DineInOrder.aspx.cs" Inherits="Project_Stuff.DineInOrder" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

     <!-- PAGE CONTAINER-->
        <div class="page-container">
            <!-- HEADER DESKTOP-->
              <!-- HEADER DESKTOP-->
             <!-- MAIN CONTENT-->
             <div class="main-content">
                    <div class="section__content section__content--p30">
                        <div class="container-fluid">
                            <div class="row">
                                 <div class="col-md-12">
                                        <div class="card">
                                                <div class="card-header">       
                                                     <h2 class="title-1">Table Reservations: <span style="float:right;">
                                                         <asp:Label ID="calenderLabel" runat="server" class="form-control" Text=""  Width="250px" Height="40px"></asp:Label>
                                                         <asp:ImageButton ID="calenderButton" runat="server" ImageUrl="~/images/icon/calender.png" Width="40px" Height="40px" OnClick="calenderButton_Click"/>
                                                         <asp:Calendar ID="ReservationCalender" runat="server" BackColor="White" BorderColor="Black" DayNameFormat="Shortest" Font-Names="Times New Roman" Font-Size="10pt" ForeColor="Black" Height="200px" NextPrevFormat="FullMonth" OnSelectionChanged="ReservationCalender_SelectionChanged" TitleFormat="Month" Width="300px">
                                                             <DayHeaderStyle BackColor="#CCCCCC" Font-Bold="True" Font-Size="7pt" ForeColor="#333333" Height="10pt" />
                                                             <DayStyle Width="14%" />
                                                             <NextPrevStyle Font-Size="8pt" ForeColor="White" />
                                                             <OtherMonthDayStyle ForeColor="#999999" />
                                                             <SelectedDayStyle BackColor="#CC3333" ForeColor="White" />
                                                             <SelectorStyle BackColor="#CCCCCC" Font-Bold="True" Font-Names="Verdana" Font-Size="8pt" ForeColor="#333333" Width="1%" />
                                                             <TitleStyle BackColor="Black" Font-Bold="True" Font-Size="13pt" ForeColor="White" Height="14pt" />
                                                             <TodayDayStyle BackColor="#CCCC99" />
                                                         </asp:Calendar></span>
                                                    </h2>
                                                     
                                                 </div>
                                            <div class="table-responsive table--no-card m-b-30">
                                                <asp:repeater id="rptCategory" runat="server">
                                               <HeaderTemplate>
                                                    <table class="table table-borderless table-striped table-earning">
                                                        <tr style="background-color:black; color:white;width:100px; font-size:13px;">
                                                        <th class="text-center">Customer Name</th>
                                                        <th class="text-center">Checkin Time</th>
                                                        <th class="text-center">Checkout Time</th>
                                                        <th class="text-center">Date</th>
                                                        <th class="text-center">No. of Persons</th>
                                                        <th class="text-center">Table No.</th>
                                                        <th class="text-center">Cancel</th>
                                                        </tr>
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <tr>
                                                        <td class="text-center" style="width:100px; font-size:13px;"><asp:Label ID="customerName" runat="server" Text='<%# Eval("customerName") %>'/></td>
                                                        <td class="text=center" style="width:100px; font-size:13px;"><asp:Label ID="arrivalTime" runat="server" Text='<%# Eval("arrivalTime") %>'/></td>
                                                        <td class="text-center" style="width:100px; font-size:13px;"><asp:Label ID="checkoutTime" runat="server" Text='<%#Eval("checkoutTime") %>'/></td>
                                                        <td class="text-center" style="width:100px; font-size:13px;"><asp:Label ID="Date" runat="server" Text='<%# Eval("date") %>'/></td>
                                                        <td class="text-center" style="width:100px; font-size:13px;"><asp:Label ID="NoOffPersons" runat="server" Text='<%#Eval("NoOFPersons") %>'/></td>
                                                        <td class="text-center" style="width:100px; font-size:13px;"><asp:Label ID="tableNo" runat="server" Text='<%#Eval("tableNo") %>'/></td>
                                                        <td class="text-center" style="width:100px; font-size:13px;"><asp:Button ID="DeleteButton" runat="server" class="btn btn-danger btn-sm" Text="Delete" OnClientClick="return confirm('Do you want to delete this Reservation?');" OnClick="DeleteButton_Click"/></td>
                                                    </tr>
                                                    
                                                </ItemTemplate>
                                                <FooterTemplate>
                                                    </table>
                                                </FooterTemplate>
                                            </asp:repeater>
                                        </div>                                      
                                       </div>
                                    </div>
                                 <div class="col-md-12">
                                        <div class="card">
                                                <div class="card-header">       
                                                     <h2 class="title-1">Dine-IN Orders: <span style="float:right;">
                                                          <asp:Label ID="CalLabel" runat="server" class="form-control" Text=""  Width="250px" Height="40px"></asp:Label>
                                                         <asp:ImageButton ID="CalImage" runat="server" ImageUrl="~/images/icon/calender.png" Width="40px" Height="40px" OnClick="CalImage_Click"/>
                                                         <asp:Calendar ID="CalDineIN" runat="server" BackColor="White" BorderColor="Black" DayNameFormat="Shortest" Font-Names="Times New Roman" Font-Size="10pt" ForeColor="Black" Height="200px" NextPrevFormat="FullMonth" OnSelectionChanged="DineINCalender_SelectionChanged" TitleFormat="Month" Width="300px">
                                                             <DayHeaderStyle BackColor="#CCCCCC" Font-Bold="True" Font-Size="7pt" ForeColor="#333333" Height="10pt" />
                                                             <DayStyle Width="14%" />
                                                             <NextPrevStyle Font-Size="8pt" ForeColor="White" />
                                                             <OtherMonthDayStyle ForeColor="#999999" />
                                                             <SelectedDayStyle BackColor="#CC3333" ForeColor="White" />
                                                             <SelectorStyle BackColor="#CCCCCC" Font-Bold="True" Font-Names="Verdana" Font-Size="8pt" ForeColor="#333333" Width="1%" />
                                                             <TitleStyle BackColor="Black" Font-Bold="True" Font-Size="13pt" ForeColor="White" Height="14pt" />
                                                             <TodayDayStyle BackColor="#CCCC99" />
                                                         </asp:Calendar></span>
                                                     </h2> 
                                                </div>
                                            <div class="table-responsive table--no-card m-b-30">
                                            <asp:Repeater ID="RepeaterDineIN" runat="server">
                                               <HeaderTemplate>
                                                    <table class="table table-borderless table-striped table-earning">
                                                        <tr style="background-color:black; color:white; width:100px; font-size:13px;">
                                                        <th class="text-center">Customer Name</th>
                                                        <th class="text-center">Checkin Time</th>
                                                        <th class="text-center">Date</th>
                                                        <th class="text-center">Food Order</th>
                                                        <th class="text-center">Price</th>
                                                        <th class="text-center">Sub Options</th>
                                                        <th class="text-center">Cancel</th>
                                                        </tr>
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <tr>
                                                        <td class="text-center" style="width:100px; font-size:11.5px;"><asp:Label ID="customerName" runat="server" Text='<%# Eval("customerName") %>'/></td>
                                                        <td class="text=center" style="width:100px; font-size:11.5px;"><asp:Label ID="arrivalTime" runat="server" Text='<%# Eval("arrivalTime") %>'/></td>
                                                        <td class="text-center" style="width:100px; font-size:11.5px;"><asp:Label ID="Date" runat="server" Text='<%# Convert.ToDateTime(Eval("date")).ToShortDateString() %>'/></td>
                                                        <td class="text-center" style="width:100px; font-size:11.5px;"><asp:Label ID="foodOrder" runat="server" Text='<%#Eval("itemName") %>'/></td>
                                                        <td class="text-center" style="width:100px; font-size:11.5px;"><asp:Label ID="Price" runat="server" Text='<%#Eval("totalPrice") %>'/></td>
                                                        <td class="text-center" style="width:100px; font-size:11.5px;"><asp:Label ID="subOptions" runat="server" Text='<%#Eval("subOptions") %>'/></td>
                                                        <td class="text-center" style="width:100px;" ><asp:Button ID="ButtonDelete" runat="server" class="btn btn-danger btn-sm" Text="Delete" OnClientClick="return confirm('Do you want to delete this order?');" OnClick="ButtonDelete_Click"/></td>
                                                    </tr>
                                                    
                                                </ItemTemplate>
                                                <FooterTemplate>
                                                    </table>
                                                </FooterTemplate>
                                            </asp:Repeater>
                                        </div> 
                                    </div>
                                 </div>
                            </div>
                        </div>
                   </div>
             </div>
         </div>  
              <!-- END MAIN CONTENT-->
            <!-- END PAGE CONTAINER-->
</asp:Content>
