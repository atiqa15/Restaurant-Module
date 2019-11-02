<%@ Page Title="" Language="C#" MasterPageFile="~/Project.Master" AutoEventWireup="true" CodeBehind="Feedback.aspx.cs" Inherits="WebProject.Feedback" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
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
                                                <div class="card-header" ">       
                                                     <h2 class="title-1">Restaurant Feedback:</h2> 
                                                </div>
                                            <div class="table-responsive table--no-card m-b-30">
                                            <asp:Repeater ID="rptCategory" runat="server">
                                               <HeaderTemplate>
                                                    <table class="table table-borderless table-striped table-earning">
                                                        <tr style="background-color:black; color:white;width:100px; font-size:13px;">
                                                        <th class="text-center">First Name</th>
                                                        <th class="text-center">Last Name</th>
                                                        <th class="text-center">Email</th>
                                                        <th class="text-center">Subject</th>
                                                        <th class="text-center">Feedback</th>
                                                        <th class="text-center">Cancel</th>
                                                        </tr>
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <tr>
                                                        <td class="text-center" style="width:100px; font-size:13px;"><asp:Label ID="customerFName" runat="server" Text='<%# Eval("restCustomerFName") %>'/></td>
                                                        <td class="text-center" style="width:100px; font-size:13px;"><asp:Label ID="customerLName" runat="server" Text='<%# Eval("restCustomerLName") %>'/></td>
                                                        <td class="text-center" style="width:100px; font-size:13px;"><asp:Label ID="customerAdd" runat="server" Text='<%#Eval("restCustomerEmail") %>'/></td>
                                                        <td class="text-center" style="width:100px; font-size:13px;"><asp:Label ID="customerSub" runat="server" Text='<%#Eval("restSubject") %>'/></td>
                                                        <td class="text-center" style="width:100px; font-size:13px;"><asp:Label ID="customerFB" runat="server" Text='<%#Eval("restFeedback") %>'/></td>
                                                        <td class="text-center" style="width:100px"><asp:Button ID="ButtonDelete" runat="server" class="btn btn-danger btn-md" Text="Delete" OnClientClick="return confirm('Do you want to delete this order?');" OnClick="ButtonDelete_Click"/></td>
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
</asp:Content>
