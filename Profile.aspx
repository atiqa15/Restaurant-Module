<%@ Page Title="" Language="C#" MasterPageFile="~/Project.Master" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="Project_Stuff.Profile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
       <!-- PAGE CONTAINER-->
        <div class="page-container">
            <!-- HEADER DESKTOP-->
          <!-- MAIN CONTENT-->
            <div class="main-content">
                <div class="section__content section__content--p30">
                    <div class="container-fluid">
                        <div class="row">
                             <div class="col-md-12">
                                    <div class="card">
                                            <div class="card-header" style="background-color:black; color:white;">       
                                                 <h2 class="title-1" style="color:white;">Configure Restaurant Profile:</h2> 
                                           </div>
                                            <div class="card-body card-block">
                                                <form action="" method="post" class="form-horizontal">
                                                    <div class="row form-group">
                                                        <div class="col-md-3">
                                                            <label for="hf-name" class=" form-control-label">Restaurant Name:</label>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <asp:TextBox ID="TextBoxName" runat="server" class=" form-control" AutoComplete="Disabled"></asp:TextBox>
                                                            <asp:RequiredFieldValidator ID="Name" runat="server" ErrorMessage="Alert! Name is required" ForeColor="Red" ControlToValidate="TextBoxName"></asp:RequiredFieldValidator>
                                                        </div>
                                                    </div>
                                                    <div class="row form-group">
                                                        <div class="col-md-3">
                                                            <label for="hf-contact" class=" form-control-label">Contact No.:</label>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <asp:TextBox ID="TextBoxContact" runat="server" class=" form-control" AutoComplete="Disabled"></asp:TextBox>
                                                            <asp:RequiredFieldValidator ID="Contact" runat="server" ErrorMessage="Alert! Contact No. is required" ForeColor="Red" ControlToValidate="TextBoxContact"></asp:RequiredFieldValidator>
                                                         </div>
                                                    </div>
                                                    <div class="row form-group">
                                                            <div class="col-md-3">
                                                                <label for="hf-capacity" class=" form-control-label">Email:</label>
                                                            </div>
                                                            <div class="col-md-6">
                                                                <asp:TextBox ID="TextBoxEmail" runat="server" class=" form-control" AutoComplete="Disabled"></asp:TextBox>
                                                                  <asp:RequiredFieldValidator ID="Email" runat="server" ErrorMessage="Alert! Email is required" ForeColor="Red" ControlToValidate="TextBoxEmail"></asp:RequiredFieldValidator>
                                                            </div>
                                                    </div>
                                                    <div class="row form-group">
                                                            <div class="col-md-3">
                                                                <label for="hf-address" class=" form-control-label">Address:</label>
                                                            </div>
                                                            <div class="col-md-6">
                                                                <asp:TextBox ID="TextBoxAddress" runat="server" class=" form-control" Height="100px" TextMode="MultiLine" AutoComplete="Disabled"></asp:TextBox>
                                                                  <asp:RequiredFieldValidator ID="Address" runat="server" ErrorMessage="Alert! Address is required" ForeColor="Red" ControlToValidate="TextBoxAddress"></asp:RequiredFieldValidator>
                                                             </div>
                                                    </div>
                                                     <div class="row form-group">
                                                            <div class="col-md-3">
                                                                <label for="file-input" class=" form-control-label">Restaurant Profile Image:</label>
                                                            </div>
                                                            <div class="col-md-6">
                                                                <asp:Image ID="Image" ImageUrl='<%# Eval("restaurantDP") %>' Width ="250px" runat="server"/>
                                                            </div>
                                                        </div>
                                                     <div class="row form-group">
                                                              <div class="col-md-3">
                                                                <label for="file-input" class=" form-control-label">Upload New Image:</label>
                                                            </div>
                                                             <div class="col-md-6">
                                                            <asp:FileUpload ID="UploadImage" runat="server" class=" form-control"/>
                                                            </div>
                                                         </div>
                                                     <div class="row form-group">
                                                            <div class="col-md-3">
                                                                <label for="hf-openingtime" class=" form-control-label">Opening Time:</label>
                                                            </div>
                                                            <div class="col-md-6">
                                                                <asp:TextBox ID="TextBoxOpeningTime" runat="server" class=" form-control" AutoComplete="Disabled"></asp:TextBox>
                                                                  <asp:RequiredFieldValidator ID="OpeningTime" runat="server" ErrorMessage="Alert! Opening Time is required" ForeColor="Red" ControlToValidate="TextBoxOpeningTime"></asp:RequiredFieldValidator>
                                                            </div>
                                                    </div>
                                                     <div class="row form-group">
                                                            <div class="col-md-3">
                                                                <label for="hf-closingtime" class=" form-control-label">Closing TIme:</label>
                                                            </div>
                                                            <div class="col-md-6">
                                                                <asp:TextBox ID="TextBoxClosingTime" runat="server" class=" form-control" AutoComplete="Disabled"></asp:TextBox>
                                                                  <asp:RequiredFieldValidator ID="ClosingTime" runat="server" ErrorMessage="Alert! Closing Time is required" ForeColor="Red" ControlToValidate="TextBoxClosingTime"></asp:RequiredFieldValidator>
                                                            </div>
                                                    </div>
                                                    <div class="row form-group">
                                                            <div class="col-md-3">
                                                                <label for="hf-capacity" class=" form-control-label">Restaurant Capacity:</label>
                                                            </div>
                                                            <div class="col-md-6">
                                                                <asp:TextBox ID="TextBoxCapacity" runat="server" class=" form-control" AutoComplete="Disabled"></asp:TextBox>
                                                                  <asp:RequiredFieldValidator ID="Capacity" runat="server" ErrorMessage="Alert! Restaurant Capacity is required" ForeColor="Red" ControlToValidate="TextBoxCapacity"></asp:RequiredFieldValidator>
                                                            </div>
                                                    </div>
                                                    <div class="row form-group">
                                                            <div class="col-md-3">
                                                                <label for="hf-bio" class=" form-control-label">Bio:</label>
                                                            </div>
                                                            <div class="col-md-6">
                                                                <asp:TextBox ID="TextBoxBio" runat="server" class=" form-control" Height="100px" TextMode="MultiLine" AutoComplete="Disabled"></asp:TextBox>
                                                                <asp:RequiredFieldValidator ID="Bio" runat="server" ErrorMessage="Alert! Restaurant Bio is required" ForeColor="Red" ControlToValidate="TextBoxBio"></asp:RequiredFieldValidator>
                                                             </div>
                                                    </div>
                                                </form>
                                            </div>
                                            <div class="card-footer">
                                                <asp:Button ID="Submit" runat="server" Text="Submit" class="btn btn-primary btn-md" OnClick="ButtonSubmit_Click"/>
                                                <asp:Button ID="Reset" runat="server" Text="Reset" class="btn btn-danger btn-md" OnClick="ButtonReset_Click"/>
                                                <asp:Button ID="Update" runat="server" Text="Update" class="btn btn-success btn-md" OnClick="ButtonUpdate_Click"/>
                                            </div>
                                  <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:PSConnectionStrings %>" SelectCommand="SELECT * FROM [restaurantProfile]"></asp:SqlDataSource>
                             </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- END MAIN CONTENT-->
            <!-- END PAGE CONTAINER-->
        </div>
    </div>
</asp:Content>
