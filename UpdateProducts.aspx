<%@ Page Title="" Language="C#" MasterPageFile="~/Project.Master" AutoEventWireup="true" CodeBehind="UpdateProducts.aspx.cs" Inherits="Project_Stuff.UpdateProducts" %>
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
                                                <div class="card-header" style="background-color:black">       
                                                     <h2 class="title-1" style="color:white">Add New Item:</h2> 
                                                </div>
                                                <div class="card-body card-block">
                                                    <h4>Item Details:</h4>
                                                </div>
                                                <div class="card-body card-block">
                                                    <form action="" method="post" class="form-horizontal">
                                                        <div class="row form-group">
                                                            <div class="col-md-3">
                                                                <label for="file-input" class=" form-control-label">Product Name:</label>
                                                            </div>
                                                            <div class="col-md-6">
                                                                <asp:TextBox ID="TextBoxName" runat="server" class=" form-control"></asp:TextBox>
                                                                <asp:RequiredFieldValidator ID="Name" runat="server" ErrorMessage="Alert! Product Name is required" ForeColor="Red" ControlToValidate="TextBoxName"></asp:RequiredFieldValidator>
                                                            </div>
                                                        </div>
                                                        <div class="row form-group">
                                                                <div class="col-md-3">
                                                                    <label for="select" class=" form-control-label">Choose Category</label>
                                                                </div>
                                                                <div class="col-md-6">
                                                                    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="categoryName" DataValueField="categoryName" class=" form-control"></asp:DropDownList>
                                                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:PSConnectionStrings %>" SelectCommand="SELECT [categoryName] FROM [menuCategories]"></asp:SqlDataSource>
                                                                </div>
                                                        </div>
                                                        <div class="row form-group">
                                                                <div class="col-md-3">
                                                                    <label for="file-input" class=" form-control-label">Price:</label>
                                                                </div>
                                                                <div class="col-md-6">
                                                                    <asp:TextBox ID="TextBoxPrice" runat="server" class=" form-control"></asp:TextBox>
                                                                    <asp:RequiredFieldValidator ID="Price" runat="server" ErrorMessage="Alert! Product Price is required" ForeColor="Red" ControlToValidate="TextBoxPrice"></asp:RequiredFieldValidator>
                                                                </div>
                                                        </div>  
                                                         <div class="row form-group">
                                                            <div class="col-md-3">
                                                                <label for="file-input" class=" form-control-label">Product Image:</label>
                                                            </div>
                                                            <div class="col-md-6">
                                                                <asp:Image ID="Image" ImageUrl='<%# Eval("itemImage") %>' Width ="250px" runat="server"/>
                                                            </div>
                                                        </div>
                                                        <div class="row form-group">
                                                            <div class="col-md-3">
                                                                <label for="file-input" class=" form-control-label">Upload Product Image:</label>
                                                            </div>
                                                            <div class="col-md-6">
                                                                <asp:FileUpload ID="UploadProductImage" runat="server" class=" form-control" />
                                                                <asp:RequiredFieldValidator ID="ProductImage" runat="server" ErrorMessage="Alert! Product Image is required" ForeColor="Red" ControlToValidate="UploadProductImage"></asp:RequiredFieldValidator>
                                                             </div>
                                                        </div> 
                                                        <div class="row form-group">
                                                            <div class="col-md-3">
                                                                <label for="hf-description" class=" form-control-label">Description:</label>
                                                            </div>
                                                            <div class="col-md-6">
                                                                <asp:TextBox ID="TextBoxBio" runat="server" class=" form-control" TextMode="MultiLine" Height="100px"></asp:TextBox>
                                                                <asp:RequiredFieldValidator ID="Bio" runat="server" ErrorMessage="Alert! Product Description is required" ForeColor="Red" ControlToValidate="TextBoxBio"></asp:RequiredFieldValidator>
                                                             </div>
                                                         </div>                                          
                                                    </form>
                                                </div>
                                                <div class="card-footer">
                                                    <asp:Button ID="ButtonUpdate" runat="server" Text="Update Item" class="btn btn-primary btn-md" OnClick="ButtonUpdate_Click" />
                                                    <a href="Add_Product.aspx" class="btn btn-danger btn-md">Return</a>
                                                </div>
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

