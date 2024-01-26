<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="AdminHomePage.aspx.cs" Inherits="SeemaPublications.Admin.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-sweetalert/1.0.1/sweetalert.min.js" rel="stylesheet" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-sweetalert/1.0.1/sweetalert.css" type="text/javascript"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-sweetalert/1.0.1/sweetalert.css" rel="stylesheet" />
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <%--<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>--%>
    <style>
        .container {
            display: flex;
            justify-content: center;
            text-align: left;
            padding-left: 50px;
            position: relative;
        }

        .card {
            color: black;
            text-align: left;
            padding: 20px;
            margin-top: 80px;
            margin-bottom: 20px;
            border: 1px solid rgba(255,255,255,0.3);
            background: rgba(255,255,255,0.2);
            border-radius: 16px;
            box-shadow: 12px 12px 40px black;
        }

        #BookDetails tr.rowHover:hover {
            background-color: #576cd0;
        }
    </style>

    <script>
        var object =
        {
            status: false, ele: null
        };
        function confirmDelete(ev) {
            if (object.status) {
                return true;
            };
            swal({
                title: "Are you sure?",
                text: "Your will not be able to recover this Book!",
                type: "warning",
                showCancelButton: true,
                confirmButtonClass: "btn-danger",
                confirmButtonText: "Yes, delete it!",
                closeOnConfirm: true
            },
                function () {
                    object.status = true;
                    object.ele = ev;
                    object.ele.click();
                });
            return false;
        };
        //var Obj =
        //{
        //    status: false, elem: null
        //};
        //function updated(event) {
        //    if (Obj.status) {
        //        return true;
        //    };

        //    Swal.fire({
        //        icon: 'success',
        //        title: 'Book Inserted Successfully!!',
        //        showConfirmButton: false,
        //    },
        //        function () {
        //            object.status = true;
        //            object.ele = ev;
        //            object.ele.click();
        //        });
        //    return false;
        //};
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div class="bg-image" style="background-image: url('../ProjectImages/sincerely-media-_-hjiem5TqI-unsplash.jpg'); background-repeat: no-repeat; background-size: cover;">
        <div class="container" style="font-weight: 500; color: #000000">
            <div class="row">
                <div class="col">
                    <div class="card">
                        <div class="card-body">
                            <center>
                                <h1 style="font-weight: bolder; color: black">Admin - Book Inventory</h1>
                            </center>
                            <div class="row">
                                <hr width="300px;" color="Black" size="3" />
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <asp:Label ID="lblBookImg" runat="server" Text="Upload Book Image"></asp:Label>
                                        <asp:FileUpload ID="FileUpload1" runat="server" class="form-control" />
                                        <asp:Button ID="btnUpload" runat="server" Text="Upload" OnClick="btnUpload_Click" Visible="false" />
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="FileUpload1"
                                            Display="Dynamic" ForeColor="Red" SetFocusOnError="true" Text="* Upload Book Image" ValidationGroup="es"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <asp:Label ID="lblTitle" runat="server" Text="Book Title"></asp:Label>
                                        <asp:TextBox ID="txtTitle" runat="server" class="form-control"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtTitle"
                                            Display="Dynamic" ForeColor="Red" SetFocusOnError="true" Text="* Enter Book Title" ValidationGroup="es"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <asp:Label ID="lblAuthorName" runat="server" Text="Author Name"></asp:Label>
                                        <asp:TextBox ID="txtAuthorName" runat="server" class="form-control"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtAuthorName"
                                            Display="Dynamic" ForeColor="Red" SetFocusOnError="true" Text="* Enter Author Name" ValidationGroup="es"></asp:RequiredFieldValidator>
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="form-group">
                                        <asp:Label ID="lblISBN" runat="server" Text="ISBN"></asp:Label>
                                        <asp:TextBox ID="txtISBN" runat="server" class="form-control"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtISBN"
                                            Display="Dynamic" ForeColor="Red" SetFocusOnError="true" Text="* Enter ISBN" ValidationGroup="es"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <asp:Label ID="lblYear" runat="server" Text="Publishing Year"></asp:Label>
                                        <asp:TextBox ID="txtPblYear" runat="server" class="form-control"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtPblYear"
                                            Display="Dynamic" ForeColor="Red" SetFocusOnError="true" Text="* Enter Publishing year" ValidationGroup="es"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <asp:Label ID="lblGenre" runat="server" Text="Genre"></asp:Label>
                                        <asp:TextBox ID="txtGenre" runat="server" class="form-control"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtGenre"
                                            Display="Dynamic" ForeColor="Red" SetFocusOnError="true" Text="* Enter Genre" ValidationGroup="es"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <asp:Label ID="lblStock" runat="server" Text="Amount in Stock"></asp:Label>
                                        <asp:TextBox ID="txtStock" runat="server" class="form-control"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidato7" runat="server" ControlToValidate="txtStock"
                                            Display="Dynamic" ForeColor="Red" SetFocusOnError="true" Text="* Enter Available Stock" ValidationGroup="es"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <asp:Label ID="lblPrice" runat="server" Text="Price"></asp:Label>
                                        <asp:TextBox ID="txtPrice" runat="server" class="form-control"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtPrice"
                                            Display="Dynamic" ForeColor="Red" SetFocusOnError="true" Text="* Enter Price" ValidationGroup="es"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                            </div>
                            <br />
                            <center>
                                <asp:Button ID="btnInsert" runat="server" Class="btn btn-primary" Style="background-color: darkorange; font-size: large; color: #FFFFFF; font-weight: bolder;" Text="Insert" OnClick="btnInsert_Click" ValidationGroup="es" CausesValidation="true" />&nbsp;
                                <asp:Button ID="btnUpdate" runat="server" Text="Update" Class="btn btn-primary" Style="background-color: darkgreen; font-size: large; color: #FFFFFF; font-weight: bolder;" OnClick="btnUpdate_Click" Visible="false" ValidationGroup="es" CausesValidation="true" />
                                <asp:Button ID="btnCancel" runat="server" Class="btn btn-primary" Style="background-color: darkorange; font-size: large; color: #FFFFFF; font-weight: bolder;" Text="Cancel" OnClick="btnCancel_Click" />
                            </center>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <br />
        <div class="container-fluid" style="font-weight: 500; color: black">
            <div class="col">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <center>
                                <h1 style="padding: 25px; font-weight: bolder; color: black">Seema Publication </h1>
                                <p>All Book Entries</p>
                            </center>
                            <div class="row">
                                <hr width="300px;" color="white" size="3" />
                            </div>

                            <div class="row">
                                <div class="col-lg-12">
                                    <div class="container-fluid" style="font-weight: 500; color: black">
                                        <div class="table-responsive">
                                            <asp:GridView ID="BookDetails" runat="server" AutoGenerateColumns="false" DataKeyNames="BookId" class="table table-bordered table-hover" RowStyle-CssClass="rowHover">
                                                <Columns>
                                                    <asp:TemplateField HeaderText="Sr No.">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblRowNumber" Text='<%# Container.DataItemIndex + 1 %>' runat="server" />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:BoundField DataField="BookTitle" HeaderText="Book" />
                                                    <asp:BoundField DataField="AuthorName" HeaderText="Author Name" />
                                                    <asp:BoundField DataField="ISBN" HeaderText="ISBN" />
                                                    <asp:BoundField DataField="PublishingYear" HeaderText="Year" />
                                                    <asp:BoundField DataField="Genre" HeaderText="Genre" />
                                                    <asp:BoundField DataField="Stock" HeaderText="Stock" />
                                                    <asp:BoundField DataField="Price" HeaderText="Price" />
                                                    <asp:BoundField DataField="BookImg" HeaderText="Image" />
                                                    <asp:TemplateField HeaderStyle-HorizontalAlign="Center" HeaderText="Delete" ItemStyle-HorizontalAlign="Center" meta:resourcekey="TemplateFieldResource7">
                                                        <ItemTemplate>
                                                            <asp:ImageButton ID="ibDelete" runat="server" Style="background-color: darkgreen; font-size: large; color: #FFFFFF; font-weight: bolder;" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "BookId") %>'
                                                                ImageUrl="../ProjectImages/Bin.png" class="btn btn-primary" ToolTip="Delete" OnClick="ibDelete_Click" OnClientClick="return confirmDelete(this);" Width="50px" Height="50px" />
                                                        </ItemTemplate>
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                        <ItemStyle HorizontalAlign="Center" />
                                                    </asp:TemplateField>

                                                    <asp:TemplateField HeaderStyle-HorizontalAlign="Center" HeaderText="Edit" ItemStyle-HorizontalAlign="Center" meta:resourcekey="TemplateFieldResource7">
                                                        <ItemTemplate>
                                                            <asp:ImageButton ID="ibEdit" runat="server" Style="background-color: darkred; font-size: large; color: #FFFFFF; font-weight: bolder;" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "BookId") %>'
                                                                ImageUrl="../ProjectImages/Update.png" class="btn btn-primary" ToolTip="Edit" OnClick="ibEdit_Click" Width="50px" Height="50px" />
                                                        </ItemTemplate>
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                        <ItemStyle HorizontalAlign="Center" />
                                                    </asp:TemplateField>
                                                </Columns>
                                            </asp:GridView>
                                            <br />                                            
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
