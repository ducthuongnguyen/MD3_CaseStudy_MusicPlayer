<%--
  Created by IntelliJ IDEA.
  User: MY PC
  Date: 5/21/2022
  Time: 10:17 AM
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
    <title>One Music</title>
    <link rel="icon" href="img/core-img/favicon.ico">
    <link rel="stylesheet" href="style.css">
</head>
<body>
<section class="contact-area section-padding-100 bg-img bg-overlay bg-fixed has-bg-img"
         style="background-image: url(img/bg-img/bg-2.jpg);">
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
                                    <li><a href="/PlaylistServlet">Show My Playlist</a></li>
                                    </li>
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
    <div class="container">
        <div class="row">
            <div class="col-12">
                <div class="section-heading white">
                    <h2>Create new Playlist</h2>
                </div>
                <div class="contact-form-area">
                    <form method="post">
                        <div class="row">
                            <div class="col-md-6 col-lg-6">
                                <div>
                                    <input type="text" class="form-control" name="namePlaylist"
                                           placeholder="namePlaylist">
                                </div>
                            </div>
                            <div class="col-md-6 col-lg-6">
                                <div>
                                    <select name="typeId" class="form-control" style="padding: 0px">
                                        <option value="">Select music type</option>
                                        <c:forEach items="${typeList}" var="type">
                                            <option value="${type.id}" class="form-control"
                                                    style="color: black">${type.name}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>
                            <div class="col-md-6 col-lg-6">
                                <div>
                                    <input type="text" class="form-control" name="description"
                                           placeholder="description">
                                </div>
                            </div>
<%--                        <div class="col-md-6 col-lg-6">--%>
<%--                            <div>--%>
<%--                                <select name="songId" class="form-control" style="padding: 0px">--%>
<%--                                    <option value="">Select song</option>--%>
<%--                                    <c:forEach items="${playlists}" var="p">--%>
<%--                                        <option value="${p.id}" class="form-control"--%>
<%--                                                style="color: black">${p.nameSong}</option>--%>
<%--                                    </c:forEach>--%>
<%--                                </select>--%>
<%--                            </div>--%>
<%--                        </div>--%>
                        <div class="col-12 text-center">
                            <button class="btn oneMusic-btn mt-30" type="submit">Create <i
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
