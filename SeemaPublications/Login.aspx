<%@ Page Title="" Language="C#" MasterPageFile="~/Publication.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="SeemaPublications.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
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
            box-shadow: 12px 12px 40px black;
        }

        img {
            border-top-left-radius: 30px;
            border-bottom-left-radius: 30px;
            border-top-right-radius: 30px;
            border-bottom-right-radius: 30px;
            margin-top: 15px;
            margin-bottom: 15px;
        }

        .container {
            display: flex;
            text-align: left;
            padding-left: 70px;
            padding-right: 70px;
            position: relative;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="form my-5 mx-4">
        <div class="container" style="font-weight: 500;">
            <div class="row no-gutters">
                <div class="col-lg-5">
                    <img src="ProjectImages/BookA4.jpg" class="img-fluid" />
                </div>
                <div class="col-md-7 px-5 pt-5">
                    <asp:ScriptManager ID="ScriptManager2" runat="server"></asp:ScriptManager>
                    <div class="form-row">
                        <h1 class="font-weight-bold py-3">Login</h1>
                        <hr width="300px;" color="Black" size="3" />
                        <h4>Login into your account</h4>
                        <div class="col-md-7">
                            <asp:Label ID="lblUsername" runat="server" Text="Username"></asp:Label>
                            <asp:TextBox ID="TxtUsername" runat="server" class="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TxtUsername"
                                Display="Dynamic" ForeColor="Red" SetFocusOnError="true" Text="* Enter Username" ValidationGroup="es"></asp:RequiredFieldValidator>
                        </div>

                        <div class="col-md-7">
                            <asp:Label ID="lblPassword" runat="server" Text="Password"></asp:Label>
                            <asp:TextBox ID="TxtPassword" runat="server" TextMode="Password" class="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TxtPassword"
                                Display="Dynamic" ForeColor="Red" SetFocusOnError="true" Text="* Enter Password" ValidationGroup="es"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <br />
                    <asp:Button ID="BtnSubmit" runat="server" Text="Login" OnClick="BtnSubmit_Click" Class="btn btn-primary" Style="background-color: darkorange; font-size: large; color: black; font-weight: bolder;" ValidationGroup="es" CausesValidation="true" />
                    &nbsp;<asp:Button ID="btnCancel" Class="btn btn-primary" runat="server" Text="Cancel" Style="background-color: darkorange; font-size: large; color: black; font-weight: bolder;" OnClick="btnCancel_Click" />
                    <br />
                    <br />
                    <a href="#">Forgot Password?</a>
                    <p>Don't have an Account?<a href="Registration.aspx"> Register Here!</a></p>
                </div>
            </div>
        </div>
    </section>
</asp:Content>
