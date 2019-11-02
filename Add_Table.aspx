<%@ Page Title="" Language="C#" MasterPageFile="~/Project.Master" AutoEventWireup="true" CodeBehind="Add_Table.aspx.cs" Inherits="Project_Stuff.Add_Table" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="page-container">
        <div class="main-content">
              <div class="section__content section__content--p30">
                    <div class="container-fluid">
                        <div class="row">
                             <div class="col-md-12">
                                    <div class="card">
                                            <div class="card-header" style="background-color:black">       
                                                 <h2 class="title-1" style="color:white">Add Table:</h2> 
                                           </div>
                                            <div class="card-body card-block">
                                                <form action="" method="post" class="form-horizontal">
                                                    <div class="row form-group">
                                                        <div class="col-md-3">
                                                            <label for="hf-table" class=" form-control-label">Table Number:</label>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <asp:TextBox ID="TableNo" runat="server" class=" form-control"></asp:TextBox>
                                                            <asp:RequiredFieldValidator ID="NoOfTables" runat="server" ErrorMessage="Alert! Table Number is required" ControlToValidate="TableNo" ForeColor="red"></asp:RequiredFieldValidator>
                                                        </div>
                                                    </div>
                                                     <div class="row form-group">
                                                        <div class="col-md-3">
                                                            <label for="hf-seat" class=" form-control-label">No. of Seats:</label>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <asp:TextBox ID="Seats" runat="server" class=" form-control"></asp:TextBox>
                                                           <asp:RequiredFieldValidator ID="NoOfSeats" runat="server" ErrorMessage="Alert! No. of Seats is required" ControlToValidate="seats" ForeColor="red"></asp:RequiredFieldValidator>
                                                        </div>
                                                    </div>
                                                    </form>
                                                </div>
                                         <div class="card-footer">
                                             <asp:button id="Button1" runat="server" text="Submit" class="btn btn-primary btn-md" onclick="Button1_Click" />
                                         </div>
                                    </div>
                                 </div>
                            </div>
                              <div class="row">
                                    <div class="col-md-12">
                                            <div class="card">
                                                    <div class="card-header">       
                                                        <h2 class="title-1">Existing Tables:</h2> 
                                                    </div>    
                                        <div class="table-responsive table--no-card m-b-30">
                                            <asp:Repeater ID="rptCategory" runat="server">
                                               <HeaderTemplate>
                                                    <table class="table table-borderless table-striped table-earning">
                                                        <tr style="background-color:black; color:white;width:100px; font-size:13px;">
                                                        <th class="text-center">Table No</th>
                                                        <th class="text-center">Number of Seats:</th>
                                                        </tr>
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <tr>
                                                        <td class="text-center" style="width:100px; font-size:13px;"><asp:Label ID="TableNO" runat="server" Text='<%# Eval("tableNO") %>'/></td>
                                                        <td class="text-center" style="width:100px; font-size:13px;"><asp:Label ID="NoOfSeats" runat="server" Text='<%#Eval("NoOfSeats") %>' runat="server"/></td>
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
