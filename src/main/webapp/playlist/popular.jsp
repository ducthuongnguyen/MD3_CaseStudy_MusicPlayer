<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 5/21/2022
  Time: 10:14 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
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
                                <li><a href="#">Show My Playlist</a></li>
                                <li><a href="/PlaylistServlet?action=create">Create Playlist</a></li>
                            </ul>
                            <!-- Login/Register & Cart Button -->
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
                        <!-- Nav End -->
                    </div>
                </nav>
            </div>
        </div>
    </div>
</header>
<!-- ##### Header Area End ##### -->

<!-- ##### Breadcumb Area Start ##### -->
<section class="breadcumb-area bg-img bg-overlay">
    <div class="bradcumbContent">
        <%--        <p>See what’s new</p>--%>
        <h2>Most Popular</h2>
    </div>
</section>
<!-- ##### Breadcumb Area End ##### -->
<!-- ##### Album Catagory Area Start ##### -->
<section class="album-catagory section-padding-100-0">
    <div class="container">
        <div class="row oneMusic-albums">
            <c:forEach items="${playlist}" var="play">
                <div class="col-12 col-sm-4 col-md-3 col-lg-2 single-album-item s e q">
                    <div class="single-album">
                        <img src="img/bg-img/a2.jpg" alt="">
                        <div>
                            <a href="#"><c:out value="View ${play.namePlaylist}"/></a>
                        </div>
                        <div>
                            <a href="#"><c:out value="View ${play.view}"/></a>

                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</section>
<!-- ##### Footer Area Start ##### -->
<footer class="footer-area">
    <div class="container">
        <div class="row d-flex flex-wrap align-items-center">
            <div class="col-12 col-md-6">
                <a href="#"><img src="img/core-img/logo.png" alt=""></a>
                <!--                    <p class="copywrite-text"><a href="#">&lt;!&ndash; Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. &ndash;&gt;-->
                <!--Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart-o" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>-->
                <!--&lt;!&ndash; Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. &ndash;&gt;</p>-->
            </div>

            <div class="col-12 col-md-6">
                <div class="footer-nav">
                </div>
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
