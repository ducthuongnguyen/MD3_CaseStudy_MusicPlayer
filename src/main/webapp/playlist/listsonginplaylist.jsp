<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>One Music - Modern Music HTML5 Template</title>
    <link rel="icon" href="img/core-img/favicon.ico">
    <link rel="stylesheet" href="style.css">
</head>
<body>
<div class="preloader d-flex align-items-center justify-content-center">
    <div class="lds-ellipsis">
        <div></div>
        <div></div>
        <div></div>
        <div></div>
    </div>
</div>
<header class="header-area">
    <div class="oneMusic-main-menu">
        <div class="classy-nav-container breakpoint-off">
            <div class="container">
                <nav class="classy-navbar justify-content-between" id="oneMusicNav">
                    <a href="index.html" class="nav-brand"><img src="../img/core-img/logo.png" alt=""></a>
                    <div class="classy-navbar-toggler">
                        <span class="navbarToggler"><span></span><span></span><span></span></span>
                    </div>
                    <div class="classy-menu">
                        <div class="classycloseIcon">
                            <div class="cross-wrap"><span class="top"></span><span class="bottom"></span></div>
                        </div>
                        <div class="classynav">
                            <ul>
                                <li><a href="index.jsp">Home</a></li>
                                <li><a href="albums-store.html">Albums</a></li>
                                <li><a href="#">Pages</a>
                                    <ul class="dropdown">
                                        <li><a href="index.html">Home</a></li>
                                        <li><a href="albums-store.html">Albums</a></li>
                                        <li><a href="event.html">Events</a></li>
                                        <li><a href="blog.html">News</a></li>
                                        <li><a href="contact.html">Contact</a></li>
                                        <li><a href="elements.html">Elements</a></li>
                                        <li><a href="login.html">Login</a></li>
                                        <li><a href="#">Dropdown</a>
                                            <ul class="dropdown">
                                                <li><a href="#">Even Dropdown</a></li>
                                                <li><a href="#">Even Dropdown</a></li>
                                                <li><a href="#">Even Dropdown</a></li>
                                                <li><a href="#">Even Dropdown</a>
                                                    <ul class="dropdown">
                                                        <li><a href="#">Deeply Dropdown</a></li>
                                                        <li><a href="#">Deeply Dropdown</a></li>
                                                        <li><a href="#">Deeply Dropdown</a></li>
                                                        <li><a href="#">Deeply Dropdown</a></li>
                                                        <li><a href="#">Deeply Dropdown</a></li>
                                                    </ul>
                                                </li>
                                                <li><a href="#">Even Dropdown</a></li>
                                            </ul>
                                        </li>
                                    </ul>
                                </li>
                                <li><a href="event.html">My Playlist</a>
                                    <ul class="dropdown">
                                        <li><a href="/PlaylistServlet">Show My Playlist</a></li>
                                        <li><a href="/PlaylistServlet?action=create">Create Playlist</a></li>

                                    </ul>
                                </li>
                                <li><a href="blog.html">News</a></li>
                                <li><a href="contact.html">Contact</a></li>
                            </ul>
                            <div class="login-register-cart-button d-flex align-items-center">
                                <div class="login-register-btn mr-50">
                                    <a href="login.html" id="loginBtn">Login / Register</a>
                                </div>
                                <div class="cart-btn">
                                    <p><span class="icon-shopping-cart"></span> <span class="quantity">1</span></p>
                                </div>
                            </div>
                        </div>
                    </div>
                </nav>
            </div>
        </div>
    </div>
</header>
<section class="breadcumb-area bg-img bg-overlay" style="background-image: url(img/bg-img/breadcumb3.jpg);">
    <div class="bradcumbContent">
        <h2>Song In Playlist</h2>
    </div>
</section>
<section class="album-catagory section-padding-100-0">
    <div class="container">
        <div class="row oneMusic-albums">
            <c:forEach var="songList" items="${songList}">
                <div class="col-12 col-sm-4 col-md-3 col-lg-2 single-album-item s e q">
                    <div class="single-album">
                        <a href="/PlaylistServlet?action=findSongPlaylist&id=${play.id}"><img src="img/bg-img/a2.jpg"
                                                                                              alt=""></a>
                        <div class="album-info">
                            <a href="#">
                                <h5>${songList.nameSong}</h5>
                            </a>
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
                    <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p>
            </div>
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
<script src="js/jquery/jquery-2.2.4.min.js"></script>
<script src="js/bootstrap/popper.min.js"></script>
<script src="js/bootstrap/bootstrap.min.js"></script>
<script src="js/plugins/plugins.js"></script>
<script src="js/active.js"></script>
</body>

</html>
