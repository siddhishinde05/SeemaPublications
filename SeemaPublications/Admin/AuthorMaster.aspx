<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="AuthorMaster.aspx.cs" Inherits="SeemaPublications.Admin.WebForm2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <%--<Bootstrap css>--%>
    <link href="../Bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <%--Datatables Css--%>
    <link href="Bootstrap/DataTables/CSS/jquery.dataTables.min.css" rel="stylesheet" />
    <script src="../Bootstrap/js/bootstrap.min.js"></script>
    <%--Fontawesome css--%>
    <link href="../FontAwesome/css/all.css" rel="stylesheet" />
    <%--jquery--%>
    <script src="bootstrap/js/jquery-3.3.1.slim.min.js"></script>
    <%--popper js--%>
    <script src="bootstrap/js/popper.min.js"></script>
    <%--bootstrap js--%>
    <script src="bootstrap/js/bootstrap.min.js"></script>
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
            padding-left: 80px;
            position: relative;
        }

        .card {
            color: black;
            text-align: left;
            padding: 20px;
            margin-top: 80px;
            margin-bottom: 20px;
            border: 1px solid rgba(255,255,255,0.3);
            background: rgba(255,255,255,0.5);
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
    <div class="bg-image" style="background-image: url('../ProjectImages/library.jpg'); background-repeat: no-repeat; background-size: cover;">
        <div class="container" style="font-weight: 500; color: black">
            <div class="row">
                <div class="col">
                    <div class="card">
                        <div class="card-body">
                            <center>
                                <h1 style="font-weight: bolder; color: black">Admin - Author Inventory</h1>
                            </center>
                            <div class="row">
                                <hr width="300px;" color="Black" size="3" />
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <asp:Label ID="lblAuthorImg" runat="server" Text="Upload Author Image"></asp:Label>
                                        <asp:FileUpload ID="FileUpload2" runat="server" CssClass="form-control" />
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="FileUpload2"
                                            Display="Dynamic" ForeColor="Red" SetFocusOnError="true" Text="* Upload Author Image" ValidationGroup="es"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <asp:Label ID="lblAName" runat="server" Text="Author Name"></asp:Label>
                                        <asp:TextBox ID="txtAName" runat="server" CssClass="form-control"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtAName"
                                            Display="Dynamic" ForeColor="Red" SetFocusOnError="true" Text="* Enter Author Name" ValidationGroup="es"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-lg-12">
                                    <div class="form-group">
                                        <asp:Label ID="lblAuthorDescrip" runat="server" Text="Description"></asp:Label>
                                        <asp:TextBox ID="txtAuthorDescrip" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="2"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtAuthorDescrip"
                                            Display="Dynamic" ForeColor="Red" SetFocusOnError="true" Text="* Enter Author Description" ValidationGroup="es"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                            </div>
                            <br />
                            <center>
                                <asp:Button ID="btnAuthorInsert" runat="server" Class="btn btn-primary" Style="background-color: darkgreen; font-size: large; color: #FFFFFF; font-weight: bolder;" Text="Insert" OnClick="btnAuthorInsert_Click" ValidationGroup="es" CausesValidation="true" />&nbsp;&nbsp;
                                <asp:Button ID="btnAuthorUpdate" runat="server" Class="btn btn-primary" Style="background-color: darkorange; font-size: large; color: #FFFFFF; font-weight: bolder;" Text="Update" Visible="false" OnClick="btnAuthorUpdate_Click" />&nbsp;&nbsp;
                                <asp:Button ID="btnAuthorCancel" runat="server" Class="btn btn-primary" Style="background-color: darkred; font-size: large; color: #FFFFFF; font-weight: bolder;" Text="Cancel" OnClick="btnAuthorCancel_Click" />
                            </center>
                        </div>
                    </div>
                </div>
            </div>
        </div>

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
                                <hr width="500px;" color="white" size="3" />
                            </div>
                            <div class="row">
                                <div class="col-lg-12">
                                    <div class="container-fluid" style="font-weight: 500; color: black">
                                        <div class="table-responsive">
                                            <asp:GridView ID="AuthorDetails" runat="server" AutoGenerateColumns="false" DataKeyNames="AuthorId" HeaderStyle-ForeColor="black" class="table table-bordered table-hover" RowStyle-CssClass="rowHover">
                                                <Columns>
                                                    <asp:TemplateField HeaderText="Sr No.">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblRowNumber" Text='<%# Container.DataItemIndex + 1 %>' runat="server" />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:BoundField DataField="AuthorImg" HeaderText="Image" />
                                                    <asp:BoundField DataField="AuthorName" HeaderText="Name" />
                                                    <asp:BoundField DataField="AuthorDescrip" HeaderText="Description" />
                                                    <asp:TemplateField HeaderStyle-HorizontalAlign="Center" HeaderText="Delete" ItemStyle-HorizontalAlign="Center" meta:resourcekey="TemplateFieldResource7">
                                                        <ItemTemplate>
                                                            <asp:ImageButton ID="ibDelete" class="btn btn-primary" runat="server" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "AuthorId") %>'
                                                                ImageUrl="../ProjectImages/Bin.png" Style="background-color: darkred; font-size: large; color: #FFFFFF; font-weight: bolder;" ToolTip="Delete" OnClick="ibDelete_Click" Width="60px" Height="50px" />
                                                        </ItemTemplate>
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                        <ItemStyle HorizontalAlign="Center" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderStyle-HorizontalAlign="Center" HeaderText="Edit" ItemStyle-HorizontalAlign="Center" meta:resourcekey="TemplateFieldResource7">
                                                        <ItemTemplate>
                                                            <asp:ImageButton ID="ibEdit" class="btn btn-primary" runat="server" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "AuthorId") %>'
                                                                ImageUrl="../ProjectImages/Update.png" Style="background-color: darkgreen; font-size: large; color: #FFFFFF; font-weight: bolder;" ToolTip="Edit" OnClick="ibEdit_Click" Width="60px" Height="50px" />
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
