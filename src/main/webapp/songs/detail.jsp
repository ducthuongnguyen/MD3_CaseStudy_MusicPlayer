<%--
  Created by IntelliJ IDEA.
  User: Duc Thuong Nguyen
  Date: 5/21/2022
  Time: 2:11 PM
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
    <title>One Music - Modern Music HTML5 Template</title>

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
                    <a href="index.html" class="nav-brand"><img src="img/core-img/logo.png" alt=""></a>

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
                                <li><a href="index.jsp">Home</a></li>
                                <li><a href="albums-store.html">Albums</a></li>
                                <li><a href="#">Songs</a>
                                    <ul class="dropdown">
                                        <li><a href="/songs">Show list songs</a></li>
                                        <li><a href="/songs?action=create">Add new song</a></li>
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
                                <li><a href="event.html">Events</a></li>
                                <li><a href="blog.html">News</a></li>
                                <li><a href="contact.html">Contact</a></li>
                            </ul>

                            <!-- Login/Register & Cart Button -->
                            <div class="login-register-cart-button d-flex align-items-center">
                                <!-- Login/Register -->
                                <div class="login-register-btn mr-50">
                                    <a href="login.html" id="loginBtn">Login / Register</a>
                                </div>

                                <!-- Cart Button -->
                                <div class="cart-btn">
                                    <p><span class="icon-shopping-cart"></span> <span class="quantity">1</span></p>
                                </div>
                            </div>
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
        <p>See what’s new</p>
        <h2>Latest Songs</h2>
    </div>
</section>
<!-- ##### Breadcumb Area End ##### -->

<!-- ##### Album Catagory Area Start ##### -->
<section class="album-catagory section-padding-100-0">
    <div class="container">
        <%--        <div class="row">--%>
        <%--            <div class="col-12">--%>
        <%--                <div class="browse-by-catagories catagory-menu d-flex flex-wrap align-items-center mb-70">--%>
        <%--                    <a href="#" data-filter="*">Browse All</a>--%>
        <%--                    <a href="#" data-filter=".a" class="active">A</a>--%>
        <%--                    <a href="#" data-filter=".b">B</a>--%>
        <%--                    <a href="#" data-filter=".c">C</a>--%>
        <%--                    <a href="#" data-filter=".d">D</a>--%>
        <%--                    <a href="#" data-filter=".e">E</a>--%>
        <%--                    <a href="#" data-filter=".f">F</a>--%>
        <%--                    <a href="#" data-filter=".g">G</a>--%>
        <%--                    <a href="#" data-filter=".h">H</a>--%>
        <%--                    <a href="#" data-filter=".i">I</a>--%>
        <%--                    <a href="#" data-filter=".j">J</a>--%>
        <%--                    <a href="#" data-filter=".k">K</a>--%>
        <%--                    <a href="#" data-filter=".l">L</a>--%>
        <%--                    <a href="#" data-filter=".m">M</a>--%>
        <%--                    <a href="#" data-filter=".n">N</a>--%>
        <%--                    <a href="#" data-filter=".o">O</a>--%>
        <%--                    <a href="#" data-filter=".p">P</a>--%>
        <%--                    <a href="#" data-filter=".q">Q</a>--%>
        <%--                    <a href="#" data-filter=".r">R</a>--%>
        <%--                    <a href="#" data-filter=".s">S</a>--%>
        <%--                    <a href="#" data-filter=".t">T</a>--%>
        <%--                    <a href="#" data-filter=".u">U</a>--%>
        <%--                    <a href="#" data-filter=".v">V</a>--%>
        <%--                    <a href="#" data-filter=".w">W</a>--%>
        <%--                    <a href="#" data-filter=".x">X</a>--%>
        <%--                    <a href="#" data-filter=".y">Y</a>--%>
        <%--                    <a href="#" data-filter=".z">Z</a>--%>
        <%--                    <a href="#" data-filter=".number">0-9</a>--%>
        <%--                </div>--%>
        <%--            </div>--%>
        <%--        </div>--%>
        <div class="row">
            <div class="col-lg-12">
                <div class="single-song-area mb-30 d-flex flex-wrap align-items-end">
                    <div class="song-thumbnail">
                        <img src="${song.avatar}" alt="">
                    </div>
                    <div class="song-play-area">
                        <div class="song-name">
                            <p>${song.nameSong}</p>
                        </div>
                        <audio preload="auto" controls>
                            <source src="${song.mp3File}">
                        </audio>
                    </div>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-md-3">
                <div class="load-more-btn text-center">
                    <a href="#" class="btn oneMusic-btn">Load More <i class="fa fa-angle-double-right"></i></a>
                </div>
            </div>
            <div class="col-md-3">
                <div class="load-more-btn text-right">
                    <a href="#" class="btn oneMusic-btn">Load More <i class="fa fa-angle-double-right"></i></a>
                </div>
            </div>
            <div class="col-md-3">
                <div class="load-more-btn text-right">
                    <button type="button" class="btn btn-outline-dark">Edit</button>
                </div>
            </div>
            <div class="col-md-3">
                <div class="load-more-btn text-center">
                    <a href="/songs?action=delete&id=${song.id}" class="btn btn-outline-dark">Delete</a>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="blog-content col-lg-12">
                <!-- Post Title -->
                <a class="post-title">Description</a>
                <!-- Post Excerpt -->
                <p>${song.description}</p>
            </div>
        </div>
</section>
<!-- ##### Album Catagory Area End ##### -->


<!-- ##### Contact Area Start ##### -->
<section class="contact-area section-padding-100 bg-img bg-overlay bg-fixed has-bg-img"
         style="background-image: url(img/bg-img/bg-2.jpg);">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <div class="section-heading white">
                    <p>See what’s new</p>
                    <h2>Get In Touch</h2>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-12">
                <!-- Contact Form Area -->
                <div class="contact-form-area">
                    <form action="#" method="post">
                        <div class="row">
                            <div class="col-md-6 col-lg-4">
                                <div class="form-group">
                                    <input type="text" class="form-control" id="name" placeholder="Name">
                                </div>
                            </div>
                            <div class="col-md-6 col-lg-4">
                                <div class="form-group">
                                    <input type="email" class="form-control" id="email" placeholder="E-mail">
                                </div>
                            </div>
                            <div class="col-lg-4">
                                <div class="form-group">
                                    <input type="text" class="form-control" id="subject" placeholder="Subject">
                                </div>
                            </div>
                            <div class="col-12">
                                <div class="form-group">
                                    <textarea name="message" class="form-control" id="message" cols="30" rows="10"
                                              placeholder="Message"></textarea>
                                </div>
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