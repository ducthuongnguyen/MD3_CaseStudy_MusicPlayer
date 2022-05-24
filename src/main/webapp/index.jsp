<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                    <a href="#" class="nav-brand"><img src="img/core-img/logo.png" alt=""></a>

                    <!-- Navbar Toggler -->
                    <div class="classy-navbar-toggler">
                        <span class="navbarToggler"><span></span><span></span><span></span></span>
                    </div>
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
                    <!-- Menu -->

                    <div class="classy-menu">
                        <!-- Close Button -->
                        <div class="classycloseIcon">
                            <div class="cross-wrap"><span class="top"></span><span class="bottom"></span></div>
                        </div>

                        <!-- Nav Start -->
                        <div class="classynav">
                            <ul>
                                <li><a href="#">Home</a></li>
                                <li><a href="/singers">Singers</a>
                                    <ul class="dropdown">
                                        <li><a href="/singers">Show list singers</a></li>
                                        <c:if test="${sessionScope.acc !=null}">
                                            <li><a href="/singers?action=create">Add new singer</a></li>
                                        </c:if>
                                    </ul>
                                </li>
                                <li><a href="/songs">Songs</a>
                                    <ul class="dropdown">
                                        <li><a href="/songs">Show list songs</a></li>
                                        <c:if test="${sessionScope.acc !=null}">
                                            <li><a href="songs?action=create">Add new song</a></li>
                                        </c:if>
                                    </ul>
                                </li>
                                <li><a href="/PlaylistServlet">Playlist</a>
                                    <ul class="dropdown">
                                        <li><a href="/PlaylistServlet">Show list playlists</a></li>
                                        <c:if test="${sessionScope.acc !=null}">
                                            <li><a href="/PlaylistServlet?action=create">Add new playlist</a></li>
                                        </c:if>
                                    </ul>
                                </li>
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

<!-- ##### Hero Area Start ##### -->
<section class="hero-area">
    <div class="hero-slides owl-carousel">
        <!-- Single Hero Slide -->
        <div class="single-hero-slide d-flex align-items-center justify-content-center">
            <!-- Slide Img -->
            <div class="slide-img bg-img" style="background-image: url(img/bg-img/bg-1.jpg);"></div>
            <!-- Slide Content -->
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <div class="hero-slides-content text-center">
                            <h6 data-animation="fadeInUp" data-delay="100ms">Latest song</h6>
                            <h2 data-animation="fadeInUp" data-delay="300ms">${latestSong.nameSong}
                                <span>${latestSong.nameSong} </span></h2>
<%--                            <a data-animation="fadeInUp" data-delay="500ms" href="#" class="btn oneMusic-btn mt-50">Discover--%>
                                <i class="fa fa-angle-double-right"></i></a>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Single Hero Slide -->
        <div class="single-hero-slide d-flex align-items-center justify-content-center">
            <!-- Slide Img -->
            <div class="slide-img bg-img" style="background-image: url(img/bg-img/bg-2.jpg);"></div>
            <!-- Slide Content -->
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <div class="hero-slides-content text-center">
                            <h6 data-animation="fadeInUp" data-delay="100ms">Latest playlist</h6>
                            <h2 data-animation="fadeInUp"
                                data-delay="300ms">${latestPlaylist.namePlaylist}<span>${latestPlaylist.namePlaylist}</span>
                            </h2>
                            <%--                            <a data-animation="fadeInUp" data-delay="500ms" href="/PlaylistServlet?action=findSongPlaylist&id=${play.id}" class="btn oneMusic-btn mt-50">Discover--%>
                            <i class="fa fa-angle-double-right"></i></a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- ##### Hero Area End ##### -->

<!-- ##### Latest Albums Area Start ##### -->
<section class="latest-albums-area section-padding-100">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <div class="section-heading style-2">
                    <p>See what’s new</p>
                    <h2>Latest Albums</h2>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-12">
                <div class="albums-slideshow owl-carousel">
                    <!-- Single Album -->
                    <div class="single-album">
                        <img src="img/bg-img/a1.jpg" alt="">
                        <div class="album-info">
                            <a href="#">
                                <h5>The Cure</h5>
                            </a>
                            <p>Second Song</p>
                        </div>
                    </div>

                    <!-- Single Album -->
                    <div class="single-album">
                        <img src="img/bg-img/a2.jpg" alt="">
                        <div class="album-info">
                            <a href="#">
                                <h5>Sam Smith</h5>
                            </a>
                            <p>Underground</p>
                        </div>
                    </div>

                    <!-- Single Album -->
                    <div class="single-album">
                        <img src="img/bg-img/a3.jpg" alt="">
                        <div class="album-info">
                            <a href="#">
                                <h5>Will I am</h5>
                            </a>
                            <p>First</p>
                        </div>
                    </div>

                    <!-- Single Album -->
                    <div class="single-album">
                        <img src="img/bg-img/a4.jpg" alt="">
                        <div class="album-info">
                            <a href="#">
                                <h5>The Cure</h5>
                            </a>
                            <p>Second Song</p>
                        </div>
                    </div>

                    <!-- Single Album -->
                    <div class="single-album">
                        <img src="img/bg-img/a5.jpg" alt="">
                        <div class="album-info">
                            <a href="#">
                                <h5>DJ SMITH</h5>
                            </a>
                            <p>The Album</p>
                        </div>
                    </div>

                    <!-- Single Album -->
                    <div class="single-album">
                        <img src="img/bg-img/a6.jpg" alt="">
                        <div class="album-info">
                            <a href="#">
                                <h5>The Ustopable</h5>
                            </a>
                            <p>Unplugged</p>
                        </div>
                    </div>

                    <!-- Single Album -->
                    <div class="single-album">
                        <img src="img/bg-img/a7.jpg" alt="">
                        <div class="album-info">
                            <a href="#">
                                <h5>Beyonce</h5>
                            </a>
                            <p>Songs</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- ##### Latest Albums Area End ##### -->

<!-- ##### Buy Now Area Start ##### -->
<section class="oneMusic-buy-now-area has-fluid bg-gray section-padding-100">
    <div class="container-fluid">
        <div class="row">
            <div class="col-12">
                <div class="section-heading style-2">
                    <p>See what’s new</p>
                    <h2>Buy What’s New</h2>
                </div>
            </div>
        </div>

        <div class="row">

            <!-- Single Album Area -->
            <div class="col-12 col-sm-6 col-md-4 col-lg-2">
                <div class="single-album-area wow fadeInUp" data-wow-delay="100ms">
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
            <div class="col-12 col-sm-6 col-md-4 col-lg-2">
                <div class="single-album-area wow fadeInUp" data-wow-delay="200ms">
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
            <div class="col-12 col-sm-6 col-md-4 col-lg-2">
                <div class="single-album-area wow fadeInUp" data-wow-delay="300ms">
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
            <div class="col-12 col-sm-6 col-md-4 col-lg-2">
                <div class="single-album-area wow fadeInUp" data-wow-delay="400ms">
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

            <!-- Single Album Area -->
            <div class="col-12 col-sm-6 col-md-4 col-lg-2">
                <div class="single-album-area wow fadeInUp" data-wow-delay="500ms">
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
            <div class="col-12 col-sm-6 col-md-4 col-lg-2">
                <div class="single-album-area wow fadeInUp" data-wow-delay="600ms">
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
            <div class="col-12 col-sm-6 col-md-4 col-lg-2">
                <div class="single-album-area wow fadeInUp" data-wow-delay="100ms">
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
            <div class="col-12 col-sm-6 col-md-4 col-lg-2">
                <div class="single-album-area wow fadeInUp" data-wow-delay="200ms">
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

            <!-- Single Album Area -->
            <div class="col-12 col-sm-6 col-md-4 col-lg-2">
                <div class="single-album-area wow fadeInUp" data-wow-delay="300ms">
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
            <div class="col-12 col-sm-6 col-md-4 col-lg-2">
                <div class="single-album-area wow fadeInUp" data-wow-delay="400ms">
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
            <div class="col-12 col-sm-6 col-md-4 col-lg-2">
                <div class="single-album-area wow fadeInUp" data-wow-delay="500ms">
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
            <div class="col-12 col-sm-6 col-md-4 col-lg-2">
                <div class="single-album-area wow fadeInUp" data-wow-delay="600ms">
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
                <div class="load-more-btn text-center wow fadeInUp" data-wow-delay="300ms">
                    <a href="#" class="btn oneMusic-btn">Load More <i class="fa fa-angle-double-right"></i></a>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- ##### Buy Now Area End ##### -->

<!-- ##### Featured Artist Area Start ##### -->
<section class="featured-artist-area section-padding-100 bg-img bg-overlay bg-fixed"
         style="background-image: url(img/bg-img/bg-4.jpg);">
    <div class="container">
        <div class="row align-items-end">
            <div class="col-12 col-md-5 col-lg-4">
                <div class="featured-artist-thumb">
                    <img src="img/bg-img/fa.jpg" alt="">
                </div>
            </div>
            <div class="col-12 col-md-7 col-lg-8">
                <div class="featured-artist-content">
                    <!-- Section Heading -->
                    <div class="section-heading white text-left mb-30">
                        <p>See what’s new</p>
                        <h2>Buy What’s New</h2>
                    </div>
                    <p>Nam tristique ex vel magna tincidunt, ut porta nisl finibus. Vivamus eu dolor eu quam varius
                        rutrum. Fusce nec justo id sem aliquam fringilla nec non lacus. Suspendisse eget lobortis nisi,
                        ac cursus odio. Vivamus nibh velit, rutrum at ipsum ac, dignissim iaculis ante. Donec in velit
                        non elit pulvinar pellentesque et non eros.</p>
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
    <!-- ##### Add Area End ##### -->
</section>
<!-- ##### Featured Artist Area End ##### -->

<!-- ##### Miscellaneous Area Start ##### -->
<section class="miscellaneous-area section-padding-100-0">
    <div class="container">
        <div class="row">
            <!-- ***** Weeks Top ***** -->
            <div class="col-12 col-lg-4">
                <div class="weeks-top-area mb-100">
                    <div class="section-heading text-left mb-50 wow fadeInUp" data-wow-delay="50ms">
                        <p>See what’s new</p>
                        <h2>New Hits</h2>
                    </div>

                    <!-- Single Top Item -->
                    <c:forEach items="${songList}" var="song">
                    <div class="single-top-item d-flex wow fadeInUp" data-wow-delay="100ms">
                        <div class="thumbnail">
                            <img src="${song.avatar}" alt="">
                        </div>
                        <div class="content-">
                            <h6>${song.singerId}</h6>
                            <p>${song.nameSong}</p>
                        </div>
                        <audio preload="auto" controls>
                            <source src="${song.mp3File}">
                        </audio>
                    </div>
                    </c:forEach>
                </div>
            </div>

            <!-- ***** New Hits Songs ***** -->
            <div class="col-12 col-lg-4">
                <div class="new-hits-area mb-100">
                    <div class="section-heading text-left mb-50 wow fadeInUp" data-wow-delay="50ms">
                        <p>See what’s new</p>
                        <h2>New Hits</h2>
                    </div>

                    <!-- Single Top Item -->
                    <div class="single-new-item d-flex align-items-center justify-content-between wow fadeInUp"
                         data-wow-delay="100ms">
                        <div class="first-part d-flex align-items-center">
                            <div class="thumbnail">
                                <img src="img/bg-img/wt7.jpg" alt="">
                            </div>
                            <div class="content-">
                                <h6>Sam Smith</h6>
                                <p>Underground</p>
                            </div>
                        </div>
                        <audio preload="auto" controls>
                            <source src="audio/dummy-audio.mp3">
                        </audio>
                    </div>

                    <!-- Single Top Item -->
                    <div class="single-new-item d-flex align-items-center justify-content-between wow fadeInUp"
                         data-wow-delay="150ms">
                        <div class="first-part d-flex align-items-center">
                            <div class="thumbnail">
                                <img src="img/bg-img/wt8.jpg" alt="">
                            </div>
                            <div class="content-">
                                <h6>Power Play</h6>
                                <p>In my mind</p>
                            </div>
                        </div>
                        <audio preload="auto" controls>
                            <source src="audio/dummy-audio.mp3">
                        </audio>
                    </div>

                    <!-- Single Top Item -->
                    <div class="single-new-item d-flex align-items-center justify-content-between wow fadeInUp"
                         data-wow-delay="200ms">
                        <div class="first-part d-flex align-items-center">
                            <div class="thumbnail">
                                <img src="img/bg-img/wt9.jpg" alt="">
                            </div>
                            <div class="content-">
                                <h6>Cristinne Smith</h6>
                                <p>My Music</p>
                            </div>
                        </div>
                        <audio preload="auto" controls>
                            <source src="audio/dummy-audio.mp3">
                        </audio>
                    </div>

                    <!-- Single Top Item -->
                    <div class="single-new-item d-flex align-items-center justify-content-between wow fadeInUp"
                         data-wow-delay="250ms">
                        <div class="first-part d-flex align-items-center">
                            <div class="thumbnail">
                                <img src="img/bg-img/wt10.jpg" alt="">
                            </div>
                            <div class="content-">
                                <h6>The Music Band</h6>
                                <p>Underground</p>
                            </div>
                        </div>
                        <audio preload="auto" controls>
                            <source src="audio/dummy-audio.mp3">
                        </audio>
                    </div>

                    <!-- Single Top Item -->
                    <div class="single-new-item d-flex align-items-center justify-content-between wow fadeInUp"
                         data-wow-delay="300ms">
                        <div class="first-part d-flex align-items-center">
                            <div class="thumbnail">
                                <img src="img/bg-img/wt11.jpg" alt="">
                            </div>
                            <div class="content-">
                                <h6>Creative Lyrics</h6>
                                <p>Songs and stuff</p>
                            </div>
                        </div>
                        <audio preload="auto" controls>
                            <source src="audio/dummy-audio.mp3">
                        </audio>
                    </div>

                    <!-- Single Top Item -->
                    <div class="single-new-item d-flex align-items-center justify-content-between wow fadeInUp"
                         data-wow-delay="350ms">
                        <div class="first-part d-flex align-items-center">
                            <div class="thumbnail">
                                <img src="img/bg-img/wt12.jpg" alt="">
                            </div>
                            <div class="content-">
                                <h6>The Culture</h6>
                                <p>Pop Songs</p>
                            </div>
                        </div>
                        <audio preload="auto" controls>
                            <source src="audio/dummy-audio.mp3">
                        </audio>
                    </div>
                </div>
            </div>

            <!-- ***** Popular Artists ***** -->
            <div class="col-12 col-lg-4">
                <div class="popular-artists-area mb-100">
                    <div class="section-heading text-left mb-50 wow fadeInUp" data-wow-delay="50ms">
                        <p>See what’s new</p>
                        <h2>Popular Artist</h2>
                    </div>

                    <!-- Single Artist -->
                    <div class="single-artists d-flex align-items-center wow fadeInUp" data-wow-delay="100ms">
                        <div class="thumbnail">
                            <img src="img/bg-img/pa1.jpg" alt="">
                        </div>
                        <div class="content-">
                            <p>Sam Smith</p>
                        </div>
                    </div>

                    <!-- Single Artist -->
                    <div class="single-artists d-flex align-items-center wow fadeInUp" data-wow-delay="150ms">
                        <div class="thumbnail">
                            <img src="img/bg-img/pa2.jpg" alt="">
                        </div>
                        <div class="content-">
                            <p>William Parker</p>
                        </div>
                    </div>

                    <!-- Single Artist -->
                    <div class="single-artists d-flex align-items-center wow fadeInUp" data-wow-delay="200ms">
                        <div class="thumbnail">
                            <img src="img/bg-img/pa3.jpg" alt="">
                        </div>
                        <div class="content-">
                            <p>Jessica Walsh</p>
                        </div>
                    </div>

                    <!-- Single Artist -->
                    <div class="single-artists d-flex align-items-center wow fadeInUp" data-wow-delay="250ms">
                        <div class="thumbnail">
                            <img src="img/bg-img/pa4.jpg" alt="">
                        </div>
                        <div class="content-">
                            <p>Tha Stoves</p>
                        </div>
                    </div>

                    <!-- Single Artist -->
                    <div class="single-artists d-flex align-items-center wow fadeInUp" data-wow-delay="300ms">
                        <div class="thumbnail">
                            <img src="img/bg-img/pa5.jpg" alt="">
                        </div>
                        <div class="content-">
                            <p>DJ Ajay</p>
                        </div>
                    </div>

                    <!-- Single Artist -->
                    <div class="single-artists d-flex align-items-center wow fadeInUp" data-wow-delay="350ms">
                        <div class="thumbnail">
                            <img src="img/bg-img/pa6.jpg" alt="">
                        </div>
                        <div class="content-">
                            <p>Radio Vibez</p>
                        </div>
                    </div>

                    <!-- Single Artist -->
                    <div class="single-artists d-flex align-items-center wow fadeInUp" data-wow-delay="400ms">
                        <div class="thumbnail">
                            <img src="img/bg-img/pa7.jpg" alt="">
                        </div>
                        <div class="content-">
                            <p>Music 4u</p>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>
</section>
<!-- ##### Miscellaneous Area End ##### -->
<footer class="footer-area">
    <div class="container">
        <div class="row d-flex flex-wrap align-items-center">
            <div class="col-12 col-md-6">
                <a href="#"><img src="img/core-img/logo.png" alt=""></a>
                <p class="copywrite-text"><a href="#"></a>
                    <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                <p class="copywrite-text"><a href="#"></a></a>
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