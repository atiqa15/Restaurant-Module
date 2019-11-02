<%@ Page Title="" Language="C#" MasterPageFile="~/Project.Master" AutoEventWireup="true" CodeBehind="modifyDeals.aspx.cs" Inherits="Project_Stuff.modifyDeals" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<!-- PAGE CONTAINER-->
        <div class="page-container">  
     <!-- MAIN CONTENT-->
             <div class="main-content">
                    <div class="section__content section__content--p30">
                        <div class="container-fluid">
                            <div class="row">
                                 <div class="col-md-12">
                                        <div class="card">
                                                <div class="card-header" style="background-color:black;">       
                                                     <h2 class="title-1" style="color:white">Modify Menu Categories:</h2> 
                                                </div>
                                                <div class="card-body card-block">
                                                    <h4>Categories Information:</h4>
                                                </div>
                                                <div class="card-body card-block">
                                                    <form action="" method="post" class="form-horizontal">
                                                        <div class="row form-group">
                                                            <div class="col-md-3">
                                                                <label for="file-input" class=" form-control-label">Deal Name:</label>
                                                            </div>
                                                            <div class="col-md-6">
                                                                <asp:TextBox ID="NewDealName" runat="server" class=" form-control"></asp:TextBox>
                                                                <asp:RequiredFieldValidator ID="DealNames" runat="server" ErrorMessage="Deal Name is required!" ControlToValidate="NewDealName" ForeColor="Red"></asp:RequiredFieldValidator>
                                                            </div>
                                                        </div>
                                                        <div class="row form-group">
                                                            <div class="col-md-3">
                                                                <label for="file-input" class=" form-control-label">Deal Image:</label>
                                                            </div>
                                                            <div class="col-md-6">
                                                                <asp:Image ID="Image" ImageUrl='<%# Eval("dealImage") %>' Width ="250px" runat="server"/>
                                                            </div>
                                                        </div>
                                                         <div class="row form-group">
                                                              <div class="col-md-3">
                                                                <label for="file-input" class=" form-control-label">Upload New Image:</label>
                                                            </div>
                                                             <div class="col-md-6">
                                                            <asp:FileUpload ID="UploadNewImage" runat="server" class=" form-control"/>
                                                            <asp:RequiredFieldValidator ID="NewImage" runat="server" ErrorMessage="Image Name is required!" ControlToValidate="NewDealName" ForeColor="Red"></asp:RequiredFieldValidator>
                                                            </div>
                                                         </div>
                                                         <div class="row form-group">
                                                              <div class="col-md-3">
                                                                <label for="file-input" class=" form-control-label">Deal Description:</label>
                                                            </div>
                                                             <div class="col-md-6">
                                                            <asp:TextBox ID="DealDescription" runat="server" class=" form-control" TextMode="MultiLine" Height="100px" ></asp:TextBox>
                                                            <asp:RequiredFieldValidator ID="dealdescriptions" runat="server" ErrorMessage="Deal Description is required!" ControlToValidate="NewDealName" ForeColor="Red"></asp:RequiredFieldValidator>
                                                             </div>
                                                         </div>
                                                    </form>
                                                </div>
                                                <div class="card-footer">
                                                    <asp:Button ID="ButtonUpdate" runat="server" Text="Update Deal" class="btn btn-primary btn-md" OnClick="ButtonUpdate_Click" />
                                                    <a href="deals.aspx" class="btn btn-danger btn-md">Return</a>
                                                    
                                                </div>
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

