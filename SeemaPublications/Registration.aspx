<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="SeemaPublications.Registration" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Registration</title>
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
    <%--Customcss--%>
    <link href="Bootstrap/css/CustomStylesheet.css" rel="stylesheet" />
    <%--SweetAlert--%>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-sweetalert/1.0.1/sweetalert.min.js" rel="stylesheet"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-sweetalert/1.0.1/sweetalert.css" rel="stylesheet" />
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-sweetalert/1.0.1/sweetalert.min.js" rel="stylesheet" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-sweetalert/1.0.1/sweetalert.css" type="text/javascript"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-sweetalert/1.0.1/sweetalert.css" rel="stylesheet" />
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <style>
        * {
            padding: 0;
            margin: 0;
            box-sizing: border-box;
        }

        body {
            background: #d1d3e9;
        }

        .row {
            background-color: white;
            border-radius: 40px;
        }

        img {
            border-top-left-radius: 30px;
            border-bottom-left-radius: 30px;
            border-top-right-radius: 30px;
            border-bottom-right-radius: 30px;
            margin-top: 15px;
            margin-bottom: 15px;
            box-shadow: 12px 6px 10px black;
        }

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
</head>
<body>
    <form id="form1" runat="server">
        <section class="form my-5 mx-4">
            <div class="container" style="font-weight: 500;">
                <div class="row no-gutters">
                    <div class="col-lg-5">
                        <img src="ProjectImages/BookShelf.jpg" class="img-fluid" />
                    </div>
                    <div class="col-md-6 px-5 pt-5">
                        <asp:ScriptManager ID="ScriptManager2" runat="server"></asp:ScriptManager>
                        <div class="form-row">
                            <h1 class="font-weight-bold">Register</h1>
                            <hr width="500px;" color="Black" size="3" />
                            <div class="row">
                                <div class="col-md-5">
                                    <asp:Label ID="lblFirstname" runat="server" Text="First Name"></asp:Label>
                                    <asp:TextBox ID="TxtFirstName" runat="server" class="form-control" Placeholder="First Name"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TxtFirstName"
                                        Display="Dynamic" ForeColor="Red" SetFocusOnError="true" Text="* Enter First Name" ValidationGroup="es"></asp:RequiredFieldValidator>
                                </div>
                                <div class="col-md-5">
                                    <asp:Label ID="lblLastname" runat="server" Text="Last Name"></asp:Label>
                                    <asp:TextBox ID="TxtLastname" runat="server" class="form-control" Placeholder="Last Name"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TxtLastname"
                                        Display="Dynamic" ForeColor="Red" SetFocusOnError="true" Text="* Enter Last Name" ValidationGroup="es"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-5">
                                    <asp:Label ID="lblContact" runat="server" Text="Contact"></asp:Label>
                                    <asp:TextBox ID="TxtContact" runat="server" class="form-control" Placeholder="Contact No."></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TxtContact"
                                        Display="Dynamic" ForeColor="Red" SetFocusOnError="true" Text="* Enter Contact No." ValidationGroup="es"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="TxtContact"
                                        ForeColor="Red" ValidationExpression="^(\+\d{1,2}\s)?\(?\d{3}\)?[\s.-]?\d{3}[\s.-]?\d{4}$"
                                        Display="Dynamic" ErrorMessage="Invalid Contact No." ValidationGroup="es" />
                                </div>
                                <div class="col-md-5">
                                    <asp:Label ID="lblEmail" runat="server" Text="Email"></asp:Label>
                                    <asp:TextBox ID="TxtEmail" runat="server" class="form-control" TextMode="Email" Placeholder="Email"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TxtEmail"
                                        Display="Dynamic" ForeColor="Red" SetFocusOnError="true" Text="* Enter Email" ValidationGroup="es"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtEmail"
                                        ForeColor="Red" ValidationExpression="^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$"
                                        Display="Dynamic" ErrorMessage="Invalid email address" ValidationGroup="es" />
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-5">
                                    <asp:Label ID="lblAddress" runat="server" Text="Address"></asp:Label>
                                    <asp:TextBox ID="TxtAddress" runat="server" class="form-control" Placeholder="Address"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="TxtAddress"
                                        Display="Dynamic" ForeColor="Red" SetFocusOnError="true" Text="* Enter Address" ValidationGroup="es"></asp:RequiredFieldValidator>
                                </div>
                                <div class="col-md-5">
                                    <asp:Label ID="lblState" runat="server" Text="State"></asp:Label>
                                    <asp:DropDownList ID="ddlState" runat="server" CssClass="form-control">
                                        <asp:ListItem Value="-Select-">-Select-</asp:ListItem>
                                        <asp:ListItem Value="Maharashtra">Maharashtra</asp:ListItem>
                                        <asp:ListItem Value="Madhya Pradesh">Madhya Pradesh</asp:ListItem>
                                        <asp:ListItem Value="Karnataka">Karnataka</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="ddlState"
                                        Display="Dynamic" ForeColor="Red" SetFocusOnError="true" Text="* Select State" InitialValue="-Select-" ValidationGroup="es"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-5">
                                    <asp:Label ID="lblDistrict" runat="server" Text="District"></asp:Label>
                                    <asp:DropDownList ID="ddlDistrict" runat="server" class="form-control">
                                        <asp:ListItem Value="-Select-">-Select-</asp:ListItem>
                                        <asp:ListItem Value="Pune">Pune</asp:ListItem>
                                        <asp:ListItem Value="Indore">Indore</asp:ListItem>
                                        <asp:ListItem Value="Banglore">Banglore</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="ddlDistrict"
                                        Display="Dynamic" ForeColor="Red" SetFocusOnError="true" InitialValue="-Select-" Text="* Select District" ValidationGroup="es"></asp:RequiredFieldValidator>
                                </div>
                                <div class="col-md-5">
                                    <asp:Label ID="lblPincode" runat="server" Text="Pincode"></asp:Label>
                                    <asp:TextBox ID="TxtPincode" runat="server" class="form-control" Placeholder="Pincode"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="TxtPincode"
                                        Display="Dynamic" ForeColor="Red" SetFocusOnError="true" Text="* Enter Pincode" ValidationGroup="es"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="TxtPincode"
                                        ForeColor="Red" ValidationExpression="\d{6}(-\d{6})?"
                                        Display="Dynamic" ErrorMessage="* Invalid Pincode" ValidationGroup="es" />
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-5">
                                    <asp:Label ID="lblUsername" runat="server" Text="Username"></asp:Label>
                                    <asp:TextBox ID="TxtUsername" runat="server" class="form-control" Placeholder="Username"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="TxtUsername"
                                        Display="Dynamic" ForeColor="Red" SetFocusOnError="true" Text="* Enter Username" ValidationGroup="es"></asp:RequiredFieldValidator>
                                </div>
                                <div class="col-md-5">
                                    <asp:Label ID="lblPassword" runat="server" Text="Password"></asp:Label>
                                    <asp:TextBox ID="TxtPassword" runat="server" TextMode="Password" Placeholder="Password" class="form-control"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="TxtPassword"
                                        Display="Dynamic" ForeColor="Red" SetFocusOnError="true" Text="* Enter Password" ValidationGroup="es"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                        </div>
                        <br />
                        <asp:Button ID="BtnSubmit" runat="server" Text="Register" OnClick="btnSubmit_Click" Class="btn btn-primary" Style="background-color: darkorange; font-size: large; color: black; font-weight: bolder;" ValidationGroup="es" CausesValidation="true" />
                        &nbsp;
                        <asp:Button ID="btnCancel" Class="btn btn-primary" runat="server" Text="Cancel" Style="background-color: darkorange; font-size: large; color: black; font-weight: bolder;" OnClick="btnCancel_Click" />
                        <br />
                        <br />
                        <p>Already have an Account?<a href="Login.aspx"> Login Here!</a></p>
                    </div>
                </div>
            </div>
        </section>
    </form>
</body>
</html>
