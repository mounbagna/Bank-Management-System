<%
    if(session.getAttribute("name")==null){
        response.sendRedirect("login.jsp");
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta name="viewport"
          content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>Bill Payment</title>
    <!-- Favicon-->
    <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
    <!-- Font Awesome icons (free version)-->
    <script src="https://use.fontawesome.com/releases/v5.15.4/js/all.js"
            crossorigin="anonymous"></script>
    <!-- Google fonts-->
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700"
          rel="stylesheet" type="text/css" />
    <link
            href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic"
            rel="stylesheet" type="text/css" />
    <!-- Core theme CSS (includes Bootstrap)-->
    <link href="css/index-styles.css" rel="stylesheet" />
</head>
<body id="page-top">
<!-- Navigation-->
<nav
        class="navbar navbar-expand-lg bg-secondary text-uppercase fixed-top"
        id="mainNav">
    <div class="container">
        <a class="navbar-brand" href="#page-top">BANKIFY</a>
        <button
                class="navbar-toggler text-uppercase font-weight-bold bg-primary text-white rounded"
                type="button" data-bs-toggle="collapse"
                data-bs-target="#navbarResponsive" aria-controls="navbarResponsive"
                aria-expanded="false" aria-label="Toggle navigation">
            Menu <i class="fas fa-bars"></i>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item mx-0 mx-lg-1"><a
                        class="nav-link py-3 px-0 px-lg-3 rounded" href="index.jsp">Home</a></li>
                <li class="nav-item mx-0 mx-lg-1"><a
                        class="nav-link py-3 px-0 px-lg-3 rounded" href="#portfolio">DashBoard</a></li>
                <li class="nav-item mx-0 mx-lg-1"><a
                        class="nav-link py-3 px-0 px-lg-3 rounded" href="#about">About</a></li>
                <li class="nav-item mx-0 mx-lg-1"><a
                        class="nav-link py-3 px-0 px-lg-3 rounded" href="logout">Logout</a></li>
                <li class="nav-item mx-0 mx-lg-1 bg-danger"><a
                        class="nav-link py-3 px-0 px-lg-3 rounded" href="logout"><%=session.getAttribute("name")%></a></li>
            </ul>
        </div>
    </div>
</nav>
<!-- Masthead-->
<header class="masthead bg-primary text-white text-center">
    <div class="container d-flex align-items-center flex-column">
        <!-- Masthead Avatar Image-->
        <img class="masthead-avatar mb-5" src="assets/img/bills.png"
             alt="..." />
        <!-- Masthead Heading-->
        <h1 class="masthead-heading text-uppercase mb-0">Welcome To Bill Page</h1>
        <!-- Icon Divider-->
        <div class="divider-custom divider-light">
            <div class="divider-custom-line"></div>
            <div class="divider-custom-icon">
                <i class="fas fa-star"></i>
            </div>
            <div class="divider-custom-line"></div>
        </div>
        <!-- Masthead Subheading-->
        <p class="masthead-subheading font-weight-light mb-0">Secure - Reliable - Fast</p>
    </div>
</header>
<!-- Portfolio Section-->
<section class="page-section portfolio" id="portfolio">
    <div class="container">
        <!-- Portfolio Section Heading-->
        <h2
                class="page-section-heading text-center text-uppercase text-secondary mb-0">DashBoard</h2>
        <!-- Icon Divider-->
        <div class="divider-custom">
            <div class="divider-custom-line"></div>
            <div class="divider-custom-icon">
                <i class="fas fa-star"></i>
            </div>
            <div class="divider-custom-line"></div>
        </div>
        <!-- Portfolio Grid Items-->
        <div class="row justify-content-center">
            <!-- Portfolio Item 1-->
            <div class="col-md-6 col-lg-4 mb-5">
                <div class="portfolio-item mx-auto" data-bs-toggle="modal"
                     data-bs-target="#portfolioModal1"
                >
                    <div
                            class="portfolio-item-caption d-flex align-items-center justify-content-center h-100 w-100">
                        <div
                                class="portfolio-item-caption-content text-center text-white">

                            <a href="tuition.jsp"><i class="fas fa-plus fa-3x"></i></a>
                        </div>
                    </div>
                    <img class="img-fluid" src="assets/img/portfolio/tuition.png"
                         alt="..." />
                </div>
            </div>
            <!-- Portfolio Item 2-->
            <div class="col-md-6 col-lg-4 mb-5">
                <div class="portfolio-item mx-auto" data-bs-toggle="modal"
                     data-bs-target="#portfolioModal2">
                    <div
                            class="portfolio-item-caption d-flex align-items-center justify-content-center h-100 w-100">
                        <div
                                class="portfolio-item-caption-content text-center text-white">
                            <a href="creditCard.jsp"><i class="fas fa-plus fa-3x"></i></a>
                        </div>
                    </div>
                    <img class="img-fluid" src="assets/img/portfolio/ccb.png"
                         alt="..." />
                </div>
            </div>
            <!-- Portfolio Item 3-->
            <div class="col-md-6 col-lg-4 mb-5">
                <div class="portfolio-item mx-auto" data-bs-toggle="modal"
                     data-bs-target="#portfolioModal3">
                    <div
                            class="portfolio-item-caption d-flex align-items-center justify-content-center h-100 w-100">
                        <div
                                class="portfolio-item-caption-content text-center text-white">
                            <a href="electricity.jsp"><i class="fas fa-plus fa-3x"></i></a>
                        </div>
                    </div>
                    <img class="img-fluid" src="assets/img/portfolio/eb.jpg"
                         alt="..." />
                </div>
            </div>
            <!-- Portfolio Item 4-->
            <div class="col-md-6 col-lg-4 mb-5 mb-lg-0">
                <div class="portfolio-item mx-auto" data-bs-toggle="modal"
                     data-bs-target="#portfolioModal4">
                    <div
                            class="portfolio-item-caption d-flex align-items-center justify-content-center h-100 w-100">
                        <div
                                class="portfolio-item-caption-content text-center text-white">
                            <a href="insurance.jsp"><i class="fas fa-plus fa-3x"></i></a>
                        </div>
                    </div>
                    <img class="img-fluid" src="assets/img/portfolio/ip.jpg"
                         alt="..." />
                </div>
            </div>
            <!-- Portfolio Item 5-->
            <div class="col-md-6 col-lg-4 mb-5 mb-md-0">
                <div class="portfolio-item mx-auto" data-bs-toggle="modal"
                     data-bs-target="#portfolioModal5">
                    <div
                            class="portfolio-item-caption d-flex align-items-center justify-content-center h-100 w-100">
                        <div
                                class="portfolio-item-caption-content text-center text-white">
                            <a href="mobileRecharge.jsp"><i class="fas fa-plus fa-3x"></i></a>
                        </div>
                    </div>
                    <img class="img-fluid" src="assets/img/portfolio/mr.jpg"
                         alt="..." />
                </div>
            </div>
        </div>
    </div>
</section>
<!-- About Section-->
<section class="page-section bg-primary text-white mb-0" id="about">
    <div class="container">
        <!-- About Section Heading-->
        <h2
                class="page-section-heading text-center text-uppercase text-white">About</h2>
        <!-- Icon Divider-->
        <div class="divider-custom divider-light">
            <div class="divider-custom-line"></div>
            <div class="divider-custom-icon">
                <i class="fas fa-star"></i>
            </div>
            <div class="divider-custom-line"></div>
        </div>
        <!-- About Section Content-->
        <div class="row">
            <div class="col-lg-4 ms-auto">
                <p class="lead">Welcome to BANKIFY, a collaborative project brought to you by a
                    dedicated student from the Islamic University of Technology. Hailing from Cameroon,I am passionate
                    about revolutionizing the digital banking experience for users
                    across borders.</p>
            </div>
            <div class="col-lg-4 me-auto">
                <p class="lead">At BANKIFY, my mission is to provide a seamless and secure online banking
                    platform that meets the evolving needs of our diverse clientele. I strive to empower individuals
                    and businesses with accessible financial services, facilitating convenient transactions and fostering
                    financial inclusion.</p>
            </div>
        </div>
    </div>
</section>

<!-- Footer-->
<footer class="footer text-center">
    <div class="container">
        <div class="row">
            <!-- Footer Location-->
            <div class="col-lg-4 mb-5 mb-lg-0">
                <h4 class="text-uppercase mb-4">Location</h4>
                <p class="lead mb-0">
                    Islamic University Of Technology <br /> Board Bazar, Gazipur
                </p>
            </div>
            <!-- Footer Social Icons-->
            <div class="col-lg-4 mb-5 mb-lg-0">
                <h4 class="text-uppercase mb-4">Around the Web</h4>
                <a class="btn btn-outline-light btn-social mx-1" href="#!"><i
                        class="fab fa-fw fa-facebook-f"></i></a> <a
                    class="btn btn-outline-light btn-social mx-1" href="#!"><i
                    class="fab fa-fw fa-twitter"></i></a> <a
                    class="btn btn-outline-light btn-social mx-1" href="https://www.linkedin.com/feed/?trk=guest_homepage-basic_google-one-tap-submit"><i
                    class="fab fa-fw fa-linkedin-in"></i></a> <a
                    class="btn btn-outline-light btn-social mx-1" href="#!"><i
                    class="fab fa-fw fa-dribbble"></i></a>
            </div>
            <!-- Footer About Text-->
            <div class="col-lg-4">
                <h4 class="text-uppercase mb-4">About A.S.I.G</h4>
                <p class="lead mb-0">
                    BANKIFY is an online banking app implemented to facilitate transactions for it users. Created
                    by <a href="https://www.linkedin.com/feed/?trk=guest_homepage-basic_google-one-tap-submit">MOUNBAGNA ABDELLA ABASSE</a> .
                </p>
            </div>
        </div>
    </div>
</footer>
<!-- Copyright Section-->
<div class="copyright py-4 text-center text-white">
    <div class="container">
        <small>Copyright &copy; ISIG@Tech 2024</small>
    </div>
</div>
<!-- Portfolio Modals-->
<!-- Portfolio Modal 1-->
<div class="portfolio-modal modal fade" id="portfolioModal1"
     tabindex="-1" aria-labelledby="portfolioModal1" aria-hidden="true">
    <div class="modal-dialog modal-xl">
        <div class="modal-content">
            <div class="modal-header border-0">
                <button class="btn-close" type="button" data-bs-dismiss="modal"
                        aria-label="Close"></button>
            </div>
            <div class="modal-body text-center pb-5">
                <div class="container">
                    <div class="row justify-content-center">
                        <div class="col-lg-8">
                            <!-- Portfolio Modal - Title-->
                            <h2
                                    class="portfolio-modal-title text-secondary text-uppercase mb-0">Tuition
                                Fee</h2>
                            <!-- Icon Divider-->
                            <div class="divider-custom">
                                <div class="divider-custom-line"></div>
                                <div class="divider-custom-icon">
                                    <i class="fas fa-star"></i>
                                </div>
                                <div class="divider-custom-line"></div>
                            </div>
                            <!-- Portfolio Modal - Image-->
                            <img class="img-fluid rounded mb-5"
                                 src="assets/img/portfolio/tuition.png" alt="..." />
                            <!-- Portfolio Modal - Text-->
                            <p class="mb-4">At BANKIFY, we understand the importance of accessibility in education. That's why we offer flexible
                                tuition payment options tailored to suit the individual needs of our users. Whether you're a student managing your own
                                finances or a parent supporting your child's education, our platform provides convenient payment solutions to ensure seamless
                                tuition transactions. With secure payment processing and customizable payment plans, we strive to make education more
                                affordable and attainable for everyone.</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Portfolio Modal 2-->
<div class="portfolio-modal modal fade" id="portfolioModal2"
     tabindex="-1" aria-labelledby="portfolioModal2" aria-hidden="true">
    <div class="modal-dialog modal-xl">
        <div class="modal-content">
            <div class="modal-header border-0">
                <button class="btn-close" type="button" data-bs-dismiss="modal"
                        aria-label="Close"></button>
            </div>
            <div class="modal-body text-center pb-5">
                <div class="container">
                    <div class="row justify-content-center">
                        <div class="col-lg-8">
                            <!-- Portfolio Modal - Title-->
                            <h2
                                    class="portfolio-modal-title text-secondary text-uppercase mb-0">Credit
                                Card</h2>
                            <!-- Icon Divider-->
                            <div class="divider-custom">
                                <div class="divider-custom-line"></div>
                                <div class="divider-custom-icon">
                                    <i class="fas fa-star"></i>
                                </div>
                                <div class="divider-custom-line"></div>
                            </div>
                            <!-- Portfolio Modal - Image-->
                            <img class="img-fluid rounded mb-5"
                                 src="assets/img/portfolio/ccb.png" alt="..." />
                            <!-- Portfolio Modal - Text-->
                            <p class="mb-4">With our credit card bill option, managing your finances has never been easier.
                                Seamlessly track and pay your credit card bills directly through our web application. Enjoy the convenience of
                                timely reminders, secure transactions, and effortless bill management, all within a few clicks. Say goodbye to
                                late fees and missed payments, and take control of your financial health with our intuitive credit card bill
                                option.</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Portfolio Modal 3-->
<div class="portfolio-modal modal fade" id="portfolioModal3"
     tabindex="-1" aria-labelledby="portfolioModal3" aria-hidden="true">
    <div class="modal-dialog modal-xl">
        <div class="modal-content">
            <div class="modal-header border-0">
                <button class="btn-close" type="button" data-bs-dismiss="modal"
                        aria-label="Close"></button>
            </div>
            <div class="modal-body text-center pb-5">
                <div class="container">
                    <div class="row justify-content-center">
                        <div class="col-lg-8">
                            <!-- Portfolio Modal - Title-->
                            <h2
                                    class="portfolio-modal-title text-secondary text-uppercase mb-0">Electricity
                                Payment</h2>
                            <!-- Icon Divider-->
                            <div class="divider-custom">
                                <div class="divider-custom-line"></div>
                                <div class="divider-custom-icon">
                                    <i class="fas fa-star"></i>
                                </div>
                                <div class="divider-custom-line"></div>
                            </div>
                            <!-- Portfolio Modal - Image-->
                            <img class="img-fluid rounded mb-5"
                                 src="assets/img/portfolio/eb.jpg" alt="..." />
                            <!-- Portfolio Modal - Text-->
                            <p class="mb-4">With our electricity bill payment feature, we provide users with the convenience of paying their electricity
                                bills seamlessly through our web application. Whether you're in Cameroon or Nigeria, you can easily settle your
                                electricity bills online without the hassle of visiting physical payment centers.</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Portfolio Modal 4-->
<div class="portfolio-modal modal fade" id="portfolioModal4"
     tabindex="-1" aria-labelledby="portfolioModal4" aria-hidden="true">
    <div class="modal-dialog modal-xl">
        <div class="modal-content">
            <div class="modal-header border-0">
                <button class="btn-close" type="button" data-bs-dismiss="modal"
                        aria-label="Close"></button>
            </div>
            <div class="modal-body text-center pb-5">
                <div class="container">
                    <div class="row justify-content-center">
                        <div class="col-lg-8">
                            <!-- Portfolio Modal - Title-->
                            <h2
                                    class="portfolio-modal-title text-secondary text-uppercase mb-0">Insurance Payment</h2>
                            <!-- Icon Divider-->
                            <div class="divider-custom">
                                <div class="divider-custom-line"></div>
                                <div class="divider-custom-icon">
                                    <i class="fas fa-star"></i>
                                </div>
                                <div class="divider-custom-line"></div>
                            </div>
                            <!-- Portfolio Modal - Image-->
                            <img class="img-fluid rounded mb-5"
                                 src="assets/img/portfolio/ip.jpg" alt="..." />
                            <!-- Portfolio Modal - Text-->
                            <p class="mb-4">In addition to traditional banking services, my web app also offers an intuitive insurance
                                payment option. Users can conveniently manage their insurance premiums and policies directly through our
                                platform, ensuring hassle-free transactions and peace of mind. With secure encryption protocols and seamless
                                integration, our insurance payment feature provides a streamlined experience, empowering users to safeguard
                                their assets with confidence.</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Portfolio Modal 5-->
<div class="portfolio-modal modal fade" id="portfolioModal5"
     tabindex="-1" aria-labelledby="portfolioModal5" aria-hidden="true">
    <div class="modal-dialog modal-xl">
        <div class="modal-content">
            <div class="modal-header border-0">
                <button class="btn-close" type="button" data-bs-dismiss="modal"
                        aria-label="Close"></button>
            </div>
            <div class="modal-body text-center pb-5">
                <div class="container">
                    <div class="row justify-content-center">
                        <div class="col-lg-8">
                            <!-- Portfolio Modal - Title-->
                            <h2
                                    class="portfolio-modal-title text-secondary text-uppercase mb-0">Mobile
                                Recharge</h2>
                            <!-- Icon Divider-->
                            <div class="divider-custom">
                                <div class="divider-custom-line"></div>
                                <div class="divider-custom-icon">
                                    <i class="fas fa-star"></i>
                                </div>
                                <div class="divider-custom-line"></div>
                            </div>
                            <!-- Portfolio Modal - Image-->
                            <img class="img-fluid rounded mb-5"
                                 src="assets/img/portfolio/mr.jpg" alt="..." />
                            <!-- Portfolio Modal - Text-->
                            <p class="mb-4">With our mobile recharge feature, conveniently top-up your prepaid phone credits anytime, anywhere.
                                Whether you're in Cameroon or Nigeria, our seamless integration allows you to recharge your mobile phone with ease
                                directly from our Web App Banking platform. Enjoy uninterrupted communication and stay connected effortlessly with
                                our mobile recharge option.</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Bootstrap core JS-->
<script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- Core theme JS-->
<script src="js/scripts.js"></script>
<script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
</body>
</html>
