<%@ Page Title="" Language="C#" MasterPageFile="~/User/UserMaster.Master" AutoEventWireup="true" CodeBehind="UserhomePage.aspx.cs" Inherits="SeemaPublications.User.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 141px;
            height: 140px;
        }

        .auto-style2 {
            width: 195px;
            height: 332px;
        }

        /*.box img {
            height: 90px;
            width: 90px;
        }*/

        body {
            padding: 10px;
            font-family: Arial;
        }

        .top {
            font-size: 3em;
            font-weight: bold;
            text-align: center;
        }

        .wrap {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            grid-gap: 30px;
            max-width: 1000px;
            margin: auto;
            margin-top: 50px;
        }

        .box {
            background: gray;
            border-radius: 10px;
        }

        img {
            width: 300px;
            height: 300px;
        }

        .social {
            margin-top: -270px;
            background: #2b3da6;
            border-radius: 0 20px 20px 0;
            position: absolute;
        }

        a {
            display: flex;
            margin: 5px;
            position: relative;
            text-decoration: none;
            font-size: 15px;
            color: #fff;
            padding: 5px;
        }

        .fa {
            line-height: 30px;
            width: 30px;
            height: 30px;
            position: relative;
            text-align: center;
        }

        .text {
            text-align: center;
            color: #fff;
        }

        p {
            font-size: 20px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="top"><span>Our Books</span></div>
    <div class="wrap">
        <div class="box">
            <img src="/ProjectImages/BookShelf.jpg">
            <div class="social">
                <a href="#"><i class="fa fa-facebook"></i></a>
                <a href="#"><i class="fa fa-twitter"></i></a>
                <a href="#"><i class="fa fa-youtube"></i></a>
                <a href="#"><i class="fa fa-linkedin"></i></a>
                <a href="#"><i class="fa fa-instagram"></i></a>
            </div>
            <div class="text">
                <h1>Krishtina Kunal</h1>
                <p>App Developer</p>
            </div>
        </div>
        <div class="box">
            <img src="/ProjectImages/BookShelf.jpg">
            <div class="social">
                <a href="#"><i class="fa fa-facebook"></i></a>
                <a href="#"><i class="fa fa-twitter"></i></a>
                <a href="#"><i class="fa fa-youtube"></i></a>
                <a href="#"><i class="fa fa-linkedin"></i></a>
                <a href="#"><i class="fa fa-instagram"></i></a>
            </div>
            <div class="text">
                <h1>John Doe</h1>
                <p>UI Designer</p>
            </div>
        </div>
        <div class="box">
            <img src="/ProjectImages/BookShelf.jpg">
            <div class="social">
                <a href="#"><i class="fa fa-facebook"></i></a>
                <a href="#"><i class="fa fa-twitter"></i></a>
                <a href="#"><i class="fa fa-youtube"></i></a>
                <a href="#"><i class="fa fa-linkedin"></i></a>
                <a href="#"><i class="fa fa-instagram"></i></a>
            </div>
            <div class="text">
                <h1>Deepk Adhikari</h1>
                <p>Project Manager</p>
            </div>
        </div>
        <div class="box">
            <img src="/ProjectImages/BookShelf.jpg">
            <div class="social">
                <a href="#"><i class="fa fa-facebook"></i></a>
                <a href="#"><i class="fa fa-twitter"></i></a>
                <a href="#"><i class="fa fa-youtube"></i></a>
                <a href="#"><i class="fa fa-linkedin"></i></a>
                <a href="#"><i class="fa fa-instagram"></i></a>
            </div>
            <div class="text">
                <h1>Deepk Adhikari</h1>
                <p>Project Manager</p>
            </div>
        </div>
        <div class="box">
            <img src="/ProjectImages/BookShelf.jpg">
            <div class="social">
                <a href="#"><i class="fa fa-facebook"></i></a>
                <a href="#"><i class="fa fa-twitter"></i></a>
                <a href="#"><i class="fa fa-youtube"></i></a>
                <a href="#"><i class="fa fa-linkedin"></i></a>
                <a href="#"><i class="fa fa-instagram"></i></a>
            </div>
            <div class="text">
                <h1>Deepk Adhikari</h1>
                <p>Project Manager</p>
            </div>
        </div>
        <asp:ScriptManager ID="src" runat="server"></asp:ScriptManager>
        <asp:Button ID="btnAuthors" runat="server" Text="All Authors" OnClick="btnAuthors_Click" />
    </div>

    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Always">
        <ContentTemplate>
            <asp:DataList ID="Repeater1" runat="server" RepeatColumns="5" RepeatDirection="Horizontal">
                <ItemTemplate>
                    <div class="wrap">
                        <div class="box">
                            <img src='<%# Eval("BookImg") %>' runat="server" class="auto-style1" alt="No Found" />
                            <div class="social">


                            </div>
                            <div class="text">
                                <h1>
                                 <asp:Label ID="lblBookName" runat="server" Text='<%# Eval("BookTitle") %>'></asp:Label></h1>
                                <asp:Label ID="LblPrice" runat="server" Text='<%# Eval("Price") %>'></asp:Label>
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:DataList>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

