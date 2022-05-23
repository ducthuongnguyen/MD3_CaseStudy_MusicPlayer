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
    <title>One Music - Modern Music HTML5 Template</title>
    <link rel="icon" href="img/core-img/favicon.ico">
    <link rel="stylesheet" href="style.css">
</head>
<body>
<section class="contact-area section-padding-100 bg-img bg-overlay bg-fixed has-bg-img"
         style="background-image: url(img/bg-img/bg-2.jpg);">
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
                                    <!-- Login/Register -->
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
    <div class="container">
        <div class="row">
            <div class="col-12">
                <div class="section-heading white">
                    <h2>Edit Playlist</h2>
                </div>
                <div class="contact-form-area">
                    <form action="#" method="post">
                        <div class="row">
                            <div class="col-md-6 col-lg-4">
                                <div class="form-group">
                                    <input type="text" class="form-control" value="${playlist.namePlaylist}"
                                           name="namePlaylist" id="namePlaylist" placeholder="namePlaylist">
                                </div>
                                <br>
                            </div>
                            <div class="col-md-6 col-lg-4">
                                <div class="form-group">
                                    <input type="number" class="form-control" value="${playlist.typeId}" name="typeId"
                                           id="typeId" placeholder="typeId">
                                </div>
                            </div>
                            <br>
                            <div class="col-md-6 col-lg-4">
                                <div class="form-group">
                                    <input type="text" class="form-control" value="${playlist.description}"
                                           name="description" id="description" placeholder="description">
                                </div>
                            </div>
                            <br>
                            <div class="col-md-6 col-lg-4">
                                <div class="form-group">
                                    <input type="number" class="form-control" value="${playlist.songQuantity}"
                                           name="songQuantity" id="songQuantity" placeholder="songQuantity">
                                </div>
                            </div>
                            <br>
                            <div class="col-md-6 col-lg-4">
                                <div class="form-group">
                                    <input type="number" class="form-control" value="${playlist.view}" name="view"
                                           id="view" placeholder="view">
                                </div>
                            </div>
                            <br>
                            <div class="col-md-6 col-lg-4">
                                <div class="form-group">
                                    <input type="number" class="form-control" value="${playlist.userId}" name="userId"
                                           id="userId" placeholder="userId">
                                </div>
                            </div>
                            <br></div>
                        <div class="col-md-6 col-lg-4">
                            <div class="form-group">
                                <input type="number" class="form-control" value="${playlist.songId}" name="songId"
                                       id="songId" placeholder="songId">
                            </div>
                        </div>
                        <div class="col-12 text-center">
                            <button class="btn oneMusic-btn mt-30" type="submit">Edit <i
                                    class="fa fa-angle-double-right"></i></button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</section>
<footer class="footer-area">
    <div class="container">
        <div class="row d-flex flex-wrap align-items-center">
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
