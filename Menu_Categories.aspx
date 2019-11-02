<%@ Page Title="" Language="C#" MasterPageFile="~/Project.Master" AutoEventWireup="true" CodeBehind="Menu_Categories.aspx.cs" Inherits="Project_Stuff.Menu_Categories" EnableEventValidation = false %>
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
                                                <div class="card-header" style="background-color:black">       
                                                     <h2 class="title-1" style="color:white;">Configure Menu Categories:</h2> 
                                                </div>
                                                <div class="card-body card-block">
                                                    <h4>Add New Category:</h4>
                                                </div>
                                                <div class="card-body card-block">
                                                    <form action="" method="post" class="form-horizontal">
                                                        <div class="row form-group">
                                                            <div class="col-md-3">
                                                                <label for="file-input" class=" form-control-label">Category Name:</label>
                                                            </div>
                                                            <div class="col-md-6">
                                                                <asp:TextBox ID="TextBoxCategoryName" runat="server" class=" form-control" AutoComplete="Disabled"></asp:TextBox>
                                                                <asp:RequiredFieldValidator ID="CategoryName" runat="server" ErrorMessage="Alert! Category Name is required" ForeColor="Red" ControlToValidate="TextBoxCategoryName"></asp:RequiredFieldValidator>
                                                            </div>
                                                        </div>
                                                        <div class="row form-group">
                                                            <div class="col-md-3">
                                                                <label for="file-input" class=" form-control-label">Category Image:</label>
                                                            </div>
                                                            <div class="col-md-6">
                                                                <asp:FileUpload ID="UploadImage" runat="server" class=" form-control-file"/>
                                                                <asp:RequiredFieldValidator ID="Image" runat="server" ErrorMessage="Alert! Image is required" ForeColor="Red" ControlToValidate="UploadImage"></asp:RequiredFieldValidator>
                                                             </div>
                                                        </div>
                                                    </form>
                                                </div>
                                                <div class="card-footer">
                                                    <asp:Button ID="ButtonInsert" runat="server" Text="Add Category" class="btn btn-primary btn-md" OnClick="ButtonInsert_Click"/>
                                                </div>
                                        </div>
                                </div>
                            </div>
                            <div class="row">
                                    <div class="col-md-12">
                                            <div class="card">
                                                    <div class="card-header">       
                                                        <h2 class="title-1">Categories Added:</h2> 
                                                    </div> 
                                             
                                        <div class="table-responsive table--no-card m-b-30">
                                            <asp:Repeater ID="rptCategory" runat="server">
                                               <HeaderTemplate>
                                                    <table class="table table-borderless table-striped table-earning">
                                                        <tr style="background-color:black; color:white;width:100px; font-size:13px;">
                                                        <th class="text-center">Category Name</th>
                                                        <th class="text-center">Category Image</th>
                                                        <th class="text-center">Delete Category</th>
                                                        <th class="text-center">Update Category</th>
                                                    </tr>
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <tr>
                                                        <td class="text-center" style="width:100px; font-size:13px;"><asp:Label ID="CategoryName" runat="server" Text='<%# Eval("categoryName") %>'/></td>
                                                        <td class="text-center" style="width:100px; font-size:13px;"><asp:Image ID="Image" ImageUrl='<%#Eval("categoryImage") %>' runat="server"/></td>
                                                        <td class="text-center" style="width:100px; font-size:13px;"><asp:Button ID="ButtonDelete" runat="server" class="btn btn-danger btn-md" Text="Delete" OnClientClick="return confirm('Do you want to delete this Catgory?')" OnClick="ButtonDelete_Click"/></td>
                                                        <td class="text-center" style="width:100px; font-size:13px;"><a href='<%# "ModifyMenu.aspx?ID=" + Eval("menuCategoryID")%>' class="btn btn-primary btn-md">Update</a></td> 
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

      <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:PSConnectionStrings %>" SelectCommand="SELECT * FROM [menuCategories]"></asp:SqlDataSource>
</asp:Content>
