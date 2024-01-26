<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ImageHoverTask.aspx.cs" Inherits="SeemaPublications.WebForm1" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Bootstrap demo</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous" />
    <!--RobotoLinks-->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" />
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500&display=swap" rel="stylesheet" />
    <link href="ImageHover.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <%--<div class="wrapper">
                <div class="card">
                    <img src="ProjectImages/BookA4.jpg" class="card-img" />
                </div>
                <div class="card-body">
                    <h1 class="card-title">Image Hover</h1>
                    <p class="card-subtitle">hbabj yug76wq </p>
                    <p class="card-info">lorem hbwb hwdhj hbjwqwxqqwxqwd h qdqj hqwkdnjkwn qdjnjqndkjn jnknkj wbjhwb</p>
                <button class="card-btn">Image Tour</button>
                </div>              
            </div>--%>
            <div class="container">
                <div class="wrapper">
                    <div class="image">
                        <img src="ProjectImages/BookA4.jpg" />
                        <div class="content">
                            <h1>Image Hover Effect</h1>
                            <p>lorem nbjn jhkn jnkn jnknqwd qjdiwd qiw qwdqwqw qwdhjqw</p>
                        </div>
                    </div>
                    <div class="image">
                        <img src="ProjectImages/BookA4.jpg" />
                        <div class="content">
                            <h1>Image Hover Effect</h1>
                            <p>lorem nbjn jhkn jnkn jnknqwd qjdiwd qiw qwdqwqw qwdhjqw</p>
                        </div>
                    </div>
                    <div class="image">
                        <img src="ProjectImages/BookA4.jpg" />
                        <div class="content">
                            <h1>Image Hover Effect</h1>
                            <p>lorem nbjn jhkn jnkn jnknqwd qjdiwd qiw qwdqwqw qwdhjqw</p>
                        </div>
                    </div>
                    <div class="image">
                        <img src="ProjectImages/BookA4.jpg" />
                        <div class="content">
                            <h1>Image Hover Effect</h1>
                            <p>lorem nbjn jhkn jnkn jnknqwd qjdiwd qiw qwdqwqw qwdhjqw</p>
                        </div>
                    </div>
                </div>
            </div>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
        </div>
    </form>
</body>
</html>
