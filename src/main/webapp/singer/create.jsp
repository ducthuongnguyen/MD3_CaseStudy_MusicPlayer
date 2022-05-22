<%--
  Created by IntelliJ IDEA.
  User: MY PC
  Date: 5/21/2022
  Time: 10:17 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <!-- Title -->
    <title>One Music - Modern Music HTML5 Template</title>

    <!-- Favicon -->
    <link rel="icon" href="img/core-img/favicon.ico">

    <!-- Stylesheet -->
    <link rel="stylesheet" href="style.css">

</head>
<body>
<!-- Preloader -->

<section class="contact-area section-padding-100 bg-img bg-overlay bg-fixed has-bg-img"
         style="background-image: url(img/bg-img/bg-2.jpg);">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <div class="section-heading white">

                    <h2>Create new singer</h2>
                    <h3>"${ms}"</h3>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-12">
                <!-- Contact Form Area -->
                <div class="contact-form-area">
                    <form method="post">
                        <div class="row">
                            <div class="col-md-6 col-lg-4">
                                <div class="form-group">
                                    <input type="text" class="form-control" name="nameSinger" placeholder="Name">
                                </div>
                            </div>
                            <div class="col-md-6 col-lg-4">
                                <div class="form-group">
                                    <input type="text" class="form-control" name="sex" placeholder="Sex">
                                </div>
                            </div>
                            <div class="col-lg-4">
                                <div class="form-group">
                                    <input type="text" class="form-control" name="dateOfBirth"
                                           placeholder="Date of Birth">
                                </div>
                                <div class="form-group">
                                    <input type="number" class="form-control" name="typeId" placeholder="Music style">
                                </div>
                            </div>
                            <div class="col-12">
                                <div class="form-group">
                                        <textarea class="form-control" name="avatar" cols="30" rows="10"
                                                  placeholder="URL image"></textarea>
                                </div>
                            </div>
                            <div class="col-12 text-center">
                                    <textarea class="form-control" name="story" cols="30" rows="10"
                                              placeholder="Story"></textarea>
                            </div>
                            <div class="col-12 text-center">
                                <button class="btn oneMusic-btn mt-30" type="submit">Send <i
                                        class="fa fa-angle-double-right"></i></button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- ##### Contact Area End ##### -->

<!-- ##### Footer Area Start ##### -->
<footer class="footer-area">
    <div class="container">
        <div class="row d-flex flex-wrap align-items-center">
            <%--            <div class="col-12 col-md-6">--%>
            <%--                <a href="#"><img src="img/core-img/logo.png" alt=""></a>--%>
            <%--                <p class="copywrite-text"><a href="#"></a>--%>
            <%--                    <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->--%>
            <%--                    Copyright &copy;<script>document.write(new Date().getFullYear());</script>--%>
            <%--                    All rights reserved | This template is made with <i class="fa fa-heart-o" aria-hidden="true"></i> by--%>
            <%--                    <a href="https://colorlib.com" target="_blank">Colorlib</a>--%>
            <%--                    <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p>--%>
            <%--            </div>--%>

            <div class="col-12 col-md-6">
                <div class="footer-nav">
                    <ul>
                        <li><a href="#">Home</a></li>
                        <li><a href="#">Albums</a></li>
                        <li><a href="#">Events</a></li>
                        <li><a href="#">News</a></li>
                        <li><a href="#">Contact</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</footer>
<!-- ##### Footer Area Start ##### -->

<!-- ##### All Javascript Script ##### -->
<!-- jQuery-2.2.4 js -->
<%--<script src="js/jquery/jquery-2.2.4.min.js"></script>--%>
<%--<!-- Popper js -->--%>
<%--<script src="js/bootstrap/popper.min.js"></script>--%>
<%--<!-- Bootstrap js -->--%>
<%--<script src="js/bootstrap/bootstrap.min.js"></script>--%>
<%--<!-- All Plugins js -->--%>
<%--<script src="js/plugins/plugins.js"></script>--%>
<%--<!-- Active js -->--%>
<%--<script src="js/active.js"></script>--%>
</body>
</html>
