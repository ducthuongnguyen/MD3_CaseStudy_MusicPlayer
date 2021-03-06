<%--
  Created by IntelliJ IDEA.
  User: Duc Thuong Nguyen
  Date: 5/22/2022
  Time: 8:28 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <!-- Title -->
    <title>One Music</title>

    <!-- Favicon -->
    <link rel="icon" href="img/core-img/favicon.ico">

    <!-- Stylesheet -->
    <link rel="stylesheet" href="style.css">

</head>

<body>
<!-- Preloader -->
<div class="preloader d-flex align-items-center justify-content-center">
    <div class="lds-ellipsis">
        <div></div>
        <div></div>
        <div></div>
        <div></div>
    </div>
</div>

<!-- ##### Header Area Start ##### -->
<header class="header-area">
    <!-- Navbar Area -->
    <div class="oneMusic-main-menu">
        <div class="classy-nav-container breakpoint-off">
            <div class="container">
                <!-- Menu -->
                <nav class="classy-navbar justify-content-between" id="oneMusicNav">

                    <!-- Nav brand -->
                    <a href="/songs?action=index" class="nav-brand"><img src="img/core-img/logo.png" alt=""></a>

                    <!-- Navbar Toggler -->
                    <div class="classy-navbar-toggler">
                        <span class="navbarToggler"><span></span><span></span><span></span></span>
                    </div>

                    <!-- Menu -->
                    <div class="classy-menu">

                        <!-- Close Button -->
                        <div class="classycloseIcon">
                            <div class="cross-wrap"><span class="top"></span><span class="bottom"></span></div>
                        </div>

                        <!-- Nav Start -->
                        <div class="classynav">
                            <ul>
                                <li><a href="/songs?action=index">Home</a></li>
                                <c:if test="${sessionScope.acc !=null}">
                                    <li><a href="#">Songs</a>
                                        <ul class="dropdown">
                                            <li><a href="/songs">Show list songs</a></li>
                                            <li><a href="/songs?action=create">Add new song</a></li>
                                        </ul>
                                    </li>
                                </c:if>
                            </ul>

                            <!-- Login/Register -->
                            <ul>
                                <c:if test="${sessionScope.acc == null}">
                                    <li><a href="users?action=register">Register</a></li>
                                    <li><a href="users?action=login">Login</a></li>
                                </c:if>
                                <c:if test="${sessionScope.acc != null}">
                                    <li><a>Hello ${sessionScope.acc.username}</a></li>
                                    <li><a href="users?action=logout">LogOut</a></li>
                                </c:if>
                            </ul>
                        </div>
                        <!-- Nav End -->

                    </div>
                </nav>
            </div>
        </div>
    </div>
</header>
<!-- ##### Header Area End ##### -->

<!-- ##### Contact Area Start ##### -->
<section class="contact-area section-padding-100 bg-img bg-overlay bg-fixed has-bg-img"
         style="background-image: url(img/bg-img/bg-2.jpg);">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <div class="section-heading white">
                    <p>See what???s new</p>
                    <h2>Edit a song</h2>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-12">
                <!-- Create Form Area -->
                <div class="contact-form-area">
                    <form method="post">
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group wow fadeInUp">
                                    <input type="text" class="form-control" placeholder="Song's name" name="nameSong"
                                           value="${editSong.nameSong}">
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group wow fadeInUp">
                                    <input type="text" class="form-control" placeholder="Author's name" name="author"
                                           value="${editSong.author}">
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group wow fadeInUp">
                                    <select name="typeId" id="categories" class="form-control" style="padding: 0px">
                                        <option value="">Select music type</option>
                                        <c:forEach items="${types}" var="type">
                                            <option value="${type.id}" class="form-control"
                                                    style="color: black">${type.name}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group wow fadeInUp">
                                    <input type="text" class="form-control" placeholder="Album"
                                           name="album" value="${editSong.album}">
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group wow fadeInUp">
                                    <input type="text" class="form-control" placeholder="Description"
                                           name="description" value="${editSong.description}">
                                </div>
                            </div>
                            <div class="col-12 text-center">
                                <button class="btn oneMusic-btn mt-30" type="submit">Edit <i
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
            <div class="col-12 col-md-6">
                <a href="#"><img src="img/core-img/logo.png" alt=""></a>
                <p class="copywrite-text"><a href="#"></a>
                    <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                    Copyright &copy;<script>document.write(new Date().getFullYear());</script>
                    All rights reserved | This template is made with <i class="fa fa-heart-o" aria-hidden="true"></i> by
                    <a href="https://colorlib.com" target="_blank">Colorlib</a>
                    <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p>
            </div>
        </div>
    </div>
</footer>
<!-- ##### Footer Area Start ##### -->

<!-- ##### All Javascript Script ##### -->
<!-- jQuery-2.2.4 js -->
<script src="js/jquery/jquery-2.2.4.min.js"></script>
<!-- Popper js -->
<script src="js/bootstrap/popper.min.js"></script>
<!-- Bootstrap js -->
<script src="js/bootstrap/bootstrap.min.js"></script>
<!-- All Plugins js -->
<script src="js/plugins/plugins.js"></script>
<!-- Active js -->
<script src="js/active.js"></script>
</body>

</html>
