<%@ Page Title="" Language="C#" MasterPageFile="~/Project.Master" AutoEventWireup="true" CodeBehind="Deals.aspx.cs" Inherits="Project_Stuff.Deals" %>
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
                                        <div class="card">
                                                <div class="card-header" style="background-color:black;">       
                                                     <h2 class="title-1" style="color:white">Configure Promotional Deals:</h2> 
                                                </div>
                                                 <div class="card-body card-block">
                                                    <form action="" method="post" class="form-horizontal">
                                                        <div class="row form-group">
                                                            <div class="col-md-3">
                                                                <label for="file-input" class=" form-control-label">Deal Name:</label>
                                                            </div>
                                                            <div class="col-md-6">
                                                                <asp:TextBox ID="TextBoxDealName" runat="server" class=" form-control" AutoComplete="Disabled"></asp:TextBox>
                                                                <asp:RequiredFieldValidator ID="dealname" runat="server" ErrorMessage="Alert! Product Name is required" ForeColor="Red" ControlToValidate="TextBoxDealName"></asp:RequiredFieldValidator>
                                                            </div>
                                                        </div>
                                                        <div class="row form-group">
                                                            <div class="col-md-3">
                                                                <label for="file-input" class=" form-control-label">Deal Image:</label>
                                                            </div>
                                                            <div class="col-md-6">
                                                                <asp:FileUpload ID="DealImage" runat="server" class=" form-control-file"/>
                                                                <asp:RequiredFieldValidator ID="uploaddealImage" runat="server" ErrorMessage="Alert! Deal Image is required" ForeColor="Red" ControlToValidate="DealImage"></asp:RequiredFieldValidator>
                                                             </div>
                                                        </div>
                                                         <div class="row form-group">
                                                            <div class="col-md-3">
                                                                <label for="file-input" class=" form-control-label">Deal Description:</label>
                                                            </div>
                                                            <div class="col-md-6">
                                                                <asp:TextBox ID="TextBoxDealDescription" runat="server" class=" form-control" AutoComplete="Disabled"></asp:TextBox>
                                                                <asp:RequiredFieldValidator ID="Bio" runat="server" ErrorMessage="Alert! Deal Description is required" ForeColor="Red" ControlToValidate="TextBoxDealDescription"></asp:RequiredFieldValidator>
                                                            </div>
                                                        </div>
                                                    </form>
                                                </div>
                                                <div class="card-footer">
                                                    <asp:Button ID="ButtonSaveDeals" runat="server" Text="Save Deal" class="btn btn-primary btn-md" OnClick="ButtonSaveDeals_Click"/>
                                                </div>
                                        </div>
                                </div>
                            </div>
                            <div class="row">
                                    <div class="col-md-12">
                                            <div class="card">
                                                    <div class="card-header">       
                                                        <h2 class="title-1">Existing Deals:</h2> 
                                                    </div>    
                                        <div class="table-responsive table--no-card m-b-30">
                                            <asp:Repeater ID="rptCategory" runat="server">
                                               <HeaderTemplate>
                                                    <table class="table table-borderless table-striped table-earning">
                                                        <tr style="background-color:black; color:white;width:100px; font-size:13px;">
                                                        <th class="text-center">Deal Name.</th>
                                                        <th class="text-center">Deal Image</th>
                                                        <th class="text-center">Deal Description</th>
                                                        <th class="text-center">Delete</th>
                                                        <th class="text-center">Update</th>
                                                    </tr>
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <tr>
                                                        <td class="text-center" style="width:100px; font-size:13px;"><asp:Label ID="dealName" runat="server" Text='<%# Eval("dealName") %>'/></td>
                                                        <td class="text-center" style="width:100px; font-size:13px;"><asp:Image ID="Image" ImageUrl='<%#Eval("dealImage") %>' runat="server"/></td>
                                                        <td class="text-center" style="width:100px; font-size:13px;"><asp:Label ID="dealDescription" runat="server" Text='<%# Eval("dealDescription") %>'/></td>
                                                        <td class="text-center" style="width:100px; font-size:13px;"><asp:Button ID="ButtonDelete" runat="server" class="btn btn-danger btn-md" Text="Delete" OnClientClick="return confirm('Deal has been removed Successfully!');" OnClick="ButtonDelete_Click"/></td>
                                                        <td class="text-center" style="width:100px; font-size:13px;"><a href='<%# "modifyDeals.aspx?ID=" + Eval("dealID")%>' class="btn btn-primary btn-md">Update</a></td> 
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
              <!-- END MAIN CONTENT-->
            <!-- END PAGE CONTAINER-->
            </div>
</asp:Content>
