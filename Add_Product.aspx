<%@ Page Title="" Language="C#" MasterPageFile="~/Project.Master" AutoEventWireup="true" CodeBehind="Add_Product.aspx.cs" Inherits="WebProject.Add_Product" %>
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
                                                <div class="card-header" style="background-color:black;">       
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
                                                                <asp:TextBox ID="TextBoxName" runat="server" class=" form-control" AutoComplete="Disabled"></asp:TextBox>
                                                                <asp:RequiredFieldValidator ID="Name" runat="server" ErrorMessage="Alert! Product Name is required" ForeColor="Red" ControlToValidate="TextBoxName"></asp:RequiredFieldValidator>
                                                            </div>
                                                        </div>
                                                        <div class="row form-group">
                                                                <div class="col-md-3">
                                                                    <label for="select" class=" form-control-label">Choose Category</label>
                                                                </div>
                                                                <div class="col-md-6">
                                                                    <asp:DropDownList ID="CategoryList"  runat="server" DataSourceID="SqlDataSource1"  DataTextField="categoryName" DataValueField="categoryName"  class=" form-control"></asp:DropDownList>
                                                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:PSConnectionStrings %>" SelectCommand="SELECT categoryName FROM menuCategories WHERE (restaurantID = @restaurantID)">
                                                                        <SelectParameters>
                                                                            <asp:SessionParameter Name="restaurantID" SessionField="restaurantID" />
                                                                        </SelectParameters>
                                                                    </asp:SqlDataSource>
                                                                     <asp:RequiredFieldValidator ID="dropdowncategorylist" runat="server" ErrorMessage="Alert! Category is required" ForeColor="Red" ControlToValidate="CategoryList"></asp:RequiredFieldValidator>
                                                               </div>
                                                        </div>
                                                        <div class="row form-group">
                                                                <div class="col-md-3">
                                                                    <label for="file-input" class=" form-control-label">Price:</label>
                                                                </div>
                                                                <div class="col-md-6">
                                                                    <asp:TextBox ID="TextBoxPrice" runat="server" class=" form-control" AutoComplete="Disabled"></asp:TextBox>
                                                                    <asp:RequiredFieldValidator ID="Price" runat="server" ErrorMessage="Alert! Price is required" ForeColor="Red" ControlToValidate="TextBoxPrice"></asp:RequiredFieldValidator>
                                                                </div>
                                                        </div>                     
                                                        <div class="row form-group">
                                                            <div class="col-md-3">
                                                                <label for="file-input" class=" form-control-label">Product Image:</label>
                                                            </div>
                                                            <div class="col-md-6">
                                                                <asp:FileUpload ID="newImage" runat="server" class=" form-control" />
                                                                   <asp:RequiredFieldValidator ID="Uploadimage" runat="server" ErrorMessage="Alert! Image is required" ForeColor="Red" ControlToValidate="newImage"></asp:RequiredFieldValidator>
                                                             </div>
                                                        </div> 
                                                        <div class="row form-group">
                                                            <div class="col-md-3">
                                                                <label for="hf-description" class=" form-control-label">Description:</label>
                                                            </div>
                                                            <div class="col-md-6">
                                                                <asp:TextBox ID="TextBoxBio" runat="server" class=" form-control" TextMode="MultiLine" Height="100px" AutoComplete="Disabled"></asp:TextBox>
                                                                <asp:RequiredFieldValidator ID="Bio" runat="server" ErrorMessage="Alert! Product Description is required" ForeColor="Red" ControlToValidate="TextBoxBio"></asp:RequiredFieldValidator>
                                                           </div>
                                                         </div>                                          
                                                    </form>
                                                </div>
                                                <div class="card-footer">
                                                    <asp:Button ID="ButtonInsert" runat="server" Text="Add Item" class="btn btn-primary btn-md" OnClick="ButtonInsert_Click"/>
                                                </div>
                                        </div>
                                </div>
                            </div>
                              <div class="row">
                                    <div class="col-md-12">
                                            <div class="card">
                                                    <div class="card-header">       
                                                        <h2 class="title-1">Products Added:</h2> 
                                                    </div> 
                                                
                                        <div class="table-responsive table--no-card m-b-30">
                                            <asp:Repeater ID="rptCategory" runat="server">
                                               <HeaderTemplate>
                                                    <table class="table table-borderless table-striped table-earning">
                                                        <tr style="background-color:black; color:white;width:100px; font-size:13px;">
                                                        <th class="text-center">Item Name</th>
                                                        <th class="text-center">Item Image</th>
                                                        <th class="text-center">Item Category</th>
                                                        <th class="text-center">Delete Item</th>
                                                        <th class="text-center">Update Item</th>
                                                    </tr>
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <tr>
                                                        <td class="text-center" style="width:100px; font-size:13px;"><asp:Label ID="itemName" runat="server" Text='<%# Eval("itemName") %>'/></td>
                                                        <td class="text-center" style="width:100px; font-size:13px;"><asp:Image ID="Image" ImageUrl='<%#Eval("itemImage") %>' runat="server"/></td>
                                                        <td class="text-center" style="width:100px; font-size:13px;"><asp:Label ID="Category" runat="server" Text='<%# Eval("itemCategory") %>'/></td>
                                                        <td class="text-center" style="width:100px; font-size:13px;"><asp:Button ID="ButtonDelete" runat="server" class="btn btn-danger btn-md" Text="Delete" OnClientClick="return confirm('Product item has been deleted successfully!!');" OnClick="ButtonDelete_Click"/></td>
                                                        <td class="text-center" style="width:100px; font-size:13px;"><a href='<%# "UpdateProducts.aspx?ID=" + Eval("itemID")%>' class="btn btn-primary btn-md">Update</a></td> 
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
              <!-- END MAIN CONTENT-->
            <!-- END PAGE CONTAINER-->
            </div>
</asp:Content>
