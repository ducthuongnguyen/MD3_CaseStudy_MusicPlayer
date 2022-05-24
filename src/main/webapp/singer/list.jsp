<%--
  Created by IntelliJ IDEA.
  User: MY PC
  Date: 5/21/2022
  Time: 12:04 PM
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
<style>
    .detail {
        color: #6c757d;
    }
</style>
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
                    <div>
                        <form action="/songs?action=search" method="post">
                            <input  type="text" name="key" placeholder="what you want???" style="background-color:white ;color: black;
        border-radius: 5px;

        box-shadow: white;
        height: 2em;
        width: 15rem;
        margin-left: 5rem;
        overflow: visible;">
                            <input type="submit" value="search" style="border-radius:2px ;background-color:#660033 ;color: white;">
                        </form>
                    </div>
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
                                    <li><a href="singers?action=create">Add New Singer</a></li>
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
                        <!-- Nav End -->

                    </div>
                </nav>
            </div>
        </div>
    </div>
</header>
<!-- ##### Header Area End ##### -->

<!-- ##### Breadcumb Area Start ##### -->
<section class="breadcumb-area bg-img bg-overlay" style="background-image: url(img/bg-img/breadcumb3.jpg);">
    <div class="bradcumbContent">
        <h2>SINGER LIST</h2>
    </div>
</section>
<!-- ##### Breadcumb Area End ##### -->

<!-- ##### Album Catagory Area Start ##### -->
<section class="album-catagory section-padding-100-0">
    <div class="container">
        <div class="row oneMusic-albums">

            <!-- Single Album -->
            <c:forEach items="${singers}" var="singer">
                <div class="col-12 col-sm-4 col-md-3 col-lg-2 single-album-item t c p">
                    <div class="single-album">
                        <img src="${singer.avatar}" alt="">
                        <div class="album-info">
                            <a href="#">
                                <h5>${singer.singerName}</h5>
                            </a>
                            <p class="detail">Sex: ${singer.sex}</p>
                            <p class="detail">Date of birth: ${singer.dateOfBirth}</p>
                            <p class="detail">Story :${singer.story}</p>
                        </div>
                    </div>
                </div>
            </c:forEach>

        </div>
    </div>
</section>
<!-- ##### Album Catagory Area End ##### -->

<!-- ##### Buy Now Area Start ##### -->
<div class="oneMusic-buy-now-area mb-100">
    <div class="container">
        <div class="row">

            <!-- Single Album Area -->
            <div class="col-12 col-sm-6 col-md-3">
                <div class="single-album-area">
                    <div class="album-thumb">
                        <img src="img/bg-img/b1.jpg" alt="">
                        <!-- Album Price -->
                        <div class="album-price">
                            <p>$0.90</p>
                        </div>
                        <!-- Play Icon -->
                        <div class="play-icon">
                            <a href="#" class="video--play--btn"><span class="icon-play-button"></span></a>
                        </div>
                    </div>
                    <div class="album-info">
                        <a href="#">
                            <h5>Garage Band</h5>
                        </a>
                        <p>Radio Station</p>
                    </div>
                </div>
            </div>

            <!-- Single Album Area -->
            <div class="col-12 col-sm-6 col-md-3">
                <div class="single-album-area">
                    <div class="album-thumb">
                        <img src="img/bg-img/b2.jpg" alt="">
                    </div>
                    <div class="album-info">
                        <a href="#">
                            <h5>Noises</h5>
                        </a>
                        <p>Buble Gum</p>
                    </div>
                </div>
            </div>

            <!-- Single Album Area -->
            <div class="col-12 col-sm-6 col-md-3">
                <div class="single-album-area">
                    <div class="album-thumb">
                        <img src="img/bg-img/b3.jpg" alt="">
                    </div>
                    <div class="album-info">
                        <a href="#">
                            <h5>Jess Parker</h5>
                        </a>
                        <p>The Album</p>
                    </div>
                </div>
            </div>

            <!-- Single Album Area -->
            <div class="col-12 col-sm-6 col-md-3">
                <div class="single-album-area">
                    <div class="album-thumb">
                        <img src="img/bg-img/b4.jpg" alt="">
                    </div>
                    <div class="album-info">
                        <a href="#">
                            <h5>Noises</h5>
                        </a>
                        <p>Buble Gum</p>
                    </div>
                </div>
            </div>

        </div>

        <div class="row">
            <div class="col-12">
                <div class="load-more-btn text-center">
                    <a href="#" class="btn oneMusic-btn">Load More <i class="fa fa-angle-double-right"></i></a>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- ##### Buy Now Area End ##### -->

<!-- ##### Add Area Start ##### -->
<div class="add-area mb-100">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <div class="adds">
                    <a href="#"><img src="img/bg-img/add3.gif" alt=""></a>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- ##### Add Area End ##### -->

<!-- ##### Song Area Start ##### -->
<div class="one-music-songs-area mb-70">
    <div class="container">
        <div class="row">

            <!-- Single Song Area -->
            <div class="col-12">
                <div class="single-song-area mb-30 d-flex flex-wrap align-items-end">
                    <div class="song-thumbnail">
                        <img src="img/bg-img/s1.jpg" alt="">
                    </div>
                    <div class="song-play-area">
                        <div class="song-name">
                            <p>01. Main Hit Song</p>
                        </div>
                        <audio preload="auto" controls>
                            <source src="audio/dummy-audio.mp3">
                        </audio>
                    </div>
                </div>
            </div>

            <!-- Single Song Area -->
            <div class="col-12">
                <div class="single-song-area mb-30 d-flex flex-wrap align-items-end">
                    <div class="song-thumbnail">
                        <img src="img/bg-img/s2.jpg" alt="">
                    </div>
                    <div class="song-play-area">
                        <div class="song-name">
                            <p>01. Main Hit Song</p>
                        </div>
                        <audio preload="auto" controls>
                            <source src="audio/dummy-audio.mp3">
                        </audio>
                    </div>
                </div>
            </div>

            <!-- Single Song Area -->
            <div class="col-12">
                <div class="single-song-area mb-30 d-flex flex-wrap align-items-end">
                    <div class="song-thumbnail">
                        <img src="img/bg-img/s3.jpg" alt="">
                    </div>
                    <div class="song-play-area">
                        <div class="song-name">
                            <p>01. Main Hit Song</p>
                        </div>
                        <audio preload="auto" controls>
                            <source src="audio/dummy-audio.mp3">
                        </audio>
                    </div>
                </div>
            </div>

            <!-- Single Song Area -->
            <div class="col-12">
                <div class="single-song-area mb-30 d-flex flex-wrap align-items-end">
                    <div class="song-thumbnail">
                        <img src="img/bg-img/s4.jpg" alt="">
                    </div>
                    <div class="song-play-area">
                        <div class="song-name">
                            <p>01. Main Hit Song</p>
                        </div>
                        <audio preload="auto" controls>
                            <source src="audio/dummy-audio.mp3">
                        </audio>
                    </div>
                </div>
            </div>

        </div>
    </div>
</div>


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
