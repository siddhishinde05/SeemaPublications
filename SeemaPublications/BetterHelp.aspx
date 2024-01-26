<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BetterHelp.aspx.cs" Inherits="SeemaPublications.BetterHelp" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>BetterHelp</title>
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
        <div>
            <div class="banner">
                <div class="container-fluid">
                <div class="navbar">
                    
                    <%--<h1 class="logo">Seema Publication</h1>--%>
                    <img src="ProjectImages/RisingIndiaLogo.png" style="height: 90px; width: 180px" />
                    <ul>
                        <li><a href="Homepage.aspx">Business</a></li>
                        <li><a href="AuthorMaster.aspx">About</a></li>
                        <li><a href="UserhomePage.aspx">Advice</a></li>
                        <li><a href="UserhomePage.aspx">FAQ</a></li>
                        <li><a href="UserhomePage.aspx">Reviews</a></li>
                        <li><a href="UserhomePage.aspx">Therapist Jobs</a></li>
                        <li><a href="UserhomePage.aspx">Contact</a></li>
                        <li><a href="#">About Us</a></li>
                    </ul>
                    <asp:Button style="border-radius:20px" ID="btnLogin" CssClass="btn btn-lg btn-outline-info" runat="server" Text="Login" />
                    <asp:Button style="border-radius:20px" ID="btnRegister" CssClass="btn btn-lg btn-outline-info" runat="server" Text="Signup" />
                    <br />
                    <br />
                    <div class="content">
                        <h1>You deserve to be happy.</h1>
                        <p>
                            What type of therapy are you looking for?
                        </p>
                    </div>
                    <br />
                    <br />
                </div></div>
                <div>
                    <div class="row gy-3" style="padding: 30px">
                        <div class="col-md-2">
                            <div class="card" style="width: 14rem;">
                                <img src="ProjectImages/sincerely-media-_-hjiem5TqI-unsplash.jpg" class="card-img-top" alt="..." />
                                <div class="card-body">
                                    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                                </div>
                            </div>
                        </div>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <div class="col-md-2">
                            <div class="card" style="width: 14rem;">
                                <img src="ProjectImages/sincerely-media-_-hjiem5TqI-unsplash.jpg" class="card-img-top" alt="..." />
                                <div class="card-body">
                                    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                                </div>
                            </div>
                        </div>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <div class="col-md-2">
                            <div class="card" style="width: 14rem;">
                                <img src="ProjectImages/sincerely-media-_-hjiem5TqI-unsplash.jpg" class="card-img-top" alt="..." />
                                <div class="card-body">
                                    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
