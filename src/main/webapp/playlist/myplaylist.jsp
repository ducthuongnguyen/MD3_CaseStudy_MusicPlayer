<%--
  Created by IntelliJ IDEA.
  User: Duc Thuong Nguyen
  Date: 5/20/2022
  Time: 9:27 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<!-- ##### Header Area End ##### -->
<header class="header-area">
    <!-- Navbar Area -->
    <div class="oneMusic-main-menu">
        <div class="classy-nav-container breakpoint-off">
            <div class="container">
                <nav class="classy-navbar justify-content-between" id="oneMusicNav">
                    <a href="/songs?action=index" class="nav-brand"><img src="../img/core-img/logo.png" alt=""></a>
                    <div class="classy-navbar-toggler">
                        <span class="navbarToggler"><span></span><span></span><span></span></span>
                    </div>
                    <div class="classy-menu">
                        <div class="classycloseIcon">
                            <div class="cross-wrap"><span class="top"></span><span class="bottom"></span></div>
                        </div>
                        <div class="classynav">
                            <ul>
                                <li><a href="/songs?action=index">Home</a></li>
                                <c:if test="${sessionScope.acc !=null}">
                                    <li><a href="/PlaylistServlet?action=create">Create Playlist</a></li>
                                </c:if>
                            </ul>
                            <ul>
                                <c:if test="${sessionScope.acc == null}">
                                    <li><a href="users?action=register">Register</a></li>
                                    <li><a href="users?action=login" >Login</a></li>
                                </c:if>
                                <c:if test="${sessionScope.acc != null}">
                                    <li><a>Hello ${sessionScope.acc.username}</a></li>
                                    <li><a href="users?action=logout" >LogOut</a></li>
                                </c:if>
                            </ul>
                        </div>
                    </div>
                </nav>
            </div>
        </div>
    </div>
</header>
<section class="breadcumb-area bg-img bg-overlay" style="background-image: url(img/bg-img/breadcumb3.jpg);">
    <div class="bradcumbContent">
        <h2>Show Playlist</h2>
    </div>
    <div>
    </div>
</section>
<section class="album-catagory section-padding-100-0">
    <div class="container">
        <div class="row oneMusic-albums">
            <c:forEach items="${playlist}" var="play">
                <div class="col-12 col-sm-4 col-md-3 col-lg-2 single-album-item s e q">
                    <div class="single-album">
                        <a href="/PlaylistServlet?action=findSongPlaylist&id=${play.id}"><img src="img/bg-img/a2.jpg"
                                                                                              alt=""></a>
                        <div class="album-info">
                            <a href="#">
                                <h5><a href="#"><c:out value="${play.namePlaylist}"/></a></h5>
                            </a>
                            <p>
                                <c:if test="${sessionScope.acc != null}">
                                    <a href="/PlaylistServlet?action=edit&id=${play.id}" style="color: crimson" class="btn btn-outline-dark">Edit</a>
                                    <a href="/PlaylistServlet?action=delete&id=${play.id}" style="color: crimson" class="btn btn-outline-dark">Delete</a>
                                </c:if>
                            </p>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</section>
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
                </p>
            </div>
        </div>
    </div>
</footer>
<script src="js/jquery/jquery-2.2.4.min.js"></script>
<script src="js/bootstrap/popper.min.js"></script>
<script src="js/bootstrap/bootstrap.min.js"></script>
<script src="js/plugins/plugins.js"></script>
<script src="js/active.js"></script>
</body>

</html>