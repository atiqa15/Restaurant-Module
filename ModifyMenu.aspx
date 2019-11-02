<%@ Page Title="" Language="C#" MasterPageFile="~/Project.Master" AutoEventWireup="true" CodeBehind="ModifyMenu.aspx.cs" Inherits="Project_Stuff.ModifyMenu" %>
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
                                                <div class="card-header"style="background-color:black">       
                                                     <h2 class="title-1" style="color:white">Modify Menu Categories:</h2> 
                                                </div>
                                                <div class="card-body card-block">
                                                    <h4>Categories Information:</h4>
                                                </div>
                                                <div class="card-body card-block">
                                                    <form action="" method="post" class="form-horizontal">
                                                        <div class="row form-group">
                                                            <div class="col-md-3">
                                                                <label for="file-input" class=" form-control-label">Category Name:</label>
                                                            </div>
                                                            <div class="col-md-6">
                                                                <asp:TextBox ID="TextBoxName" runat="server" class=" form-control"></asp:TextBox>
                                                                <asp:RequiredFieldValidator ID="Name" runat="server" ErrorMessage="Alert! Category Name is required" ForeColor="Red" ControlToValidate="TextBoxName"></asp:RequiredFieldValidator>
                                                            </div>
                                                        </div>
                                                        <div class="row form-group">
                                                            <div class="col-md-3">
                                                                <label for="file-input" class=" form-control-label">Category Image:</label>
                                                            </div>
                                                            <div class="col-md-6">
                                                                <asp:Image ID="Image" ImageUrl='<%# Eval("categoryImage") %>' Width ="250px" runat="server"/>
                                                            </div>
                                                        </div>
                                                         <div class="row form-group">
                                                              <div class="col-md-3">
                                                                <label for="file-input" class=" form-control-label">Upload New Image:</label>
                                                            </div>
                                                             <div class="col-md-6">
                                                            <asp:FileUpload ID="UploadImage" runat="server" class=" form-control"/>
                                                            <asp:RequiredFieldValidator ID="newImage" runat="server" ErrorMessage="Alert! Image is required" ForeColor="Red" ControlToValidate="UploadImage"></asp:RequiredFieldValidator>
                                                            </div>
                                                         </div>
                                                    </form>
                                                </div>
                                                <div class="card-footer">
                                                    <asp:Button ID="ButtonUpdate" runat="server" Text="Update Category" class="btn btn-primary btn-md" OnClick="ButtonUpdate_Click" />
                                                   <a href="Menu_Categories.aspx" class="btn btn-danger btn-md">Return</a>
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
