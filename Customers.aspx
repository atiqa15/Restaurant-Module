﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Project.Master" AutoEventWireup="true" CodeBehind="Customers.aspx.cs" Inherits="Project_Stuff.Customers" %>
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
                                                <div class="card-header" style="background-color:black">       
                                                     <h2 class="title-1" style="color:white">Customer Details:</h2> 
                                                </div>
                                            <div class="table-responsive table--no-card m-b-30">
                                            <asp:Repeater ID="rptCategory" runat="server">
                                               <HeaderTemplate>
                                                    <table class="table table-borderless table-striped table-earning">
                                                        <tr>
                                                        <th class="text-center">Customer Name</th>
                                                        <th class="text-center">Customer Address</th>
                                                        <th class="text-center">Customer Email</th>
                                                        <th class="text-center">Customer Contact</th>
                                                        <th class="text-center">Cancel</th>
                                                        </tr>
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <tr>
                                                        <td class="text-center" style="width:100px; font-size:13px"><asp:Label ID="customerName" runat="server" Text='<%# Eval("customerName") %>'/></td>
                                                        <td class="text-center" style="width:100px; font-size:13px"><asp:Label ID="customerAddress" runat="server" Text='<%#Eval("customerAddress") %>'/></td>
                                                        <td class="text-center" style="width:100px; font-size:13px"><asp:Label ID="customerEmail" runat="server" Text='<%# Eval("customerEmail") %>'/></td>
                                                        <td class="text-center" style="width:100px; font-size:13px"><asp:Label ID="customerContact" runat="server" Text='<%# Eval("customerContact") %>'/></td>
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
