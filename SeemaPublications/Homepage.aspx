<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Homepage.aspx.cs" Inherits="SeemaPublications.Homepage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Homepage</title>
    <link href="http://maxcdn.bootstrapcdn.com/font-awesome/4.6.0/css/font-awesome.min.css" rel="stylesheet" />
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
    <link href="Bootstrap/css/Homepage.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="banner">
            <div class="navbar">
                <h1 class="logo">Seema Publication  </h1>
                <ul>
                    <li><a href="Homepage.aspx">Home</a></li>
                    <li><a href="AuthorMaster.aspx">Authors</a></li>
                    <li><a href="UserhomePage.aspx">Books</a></li>
                    <li><a href="#">About Us</a></li>
                </ul>
                <br />
                <br />
                <div class="content">
                    <h1>Purchase Our Books</h1>
                    <p>
                        Subscribe to our channel and like, share and subscribe<br />
                        we sell bestsellers also.
                    </p>
                    <asp:Button ID="btnLogin" CssClass="btn btn-lg btn-outline-info" runat="server" Text="Login" OnClick="Login_Click" />&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="btnRegister" CssClass="btn btn-lg btn-outline-info" runat="server" Text="Signup" OnClick="Register_Click" />
                </div>
                <div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
