<body class="layout-navbar-mini-fixed-bottom">
    <div class="preloader">
        <div class="sk-double-bounce">
            <div class="sk-child sk-double-bounce1"></div>
            <div class="sk-child sk-double-bounce2"></div>
        </div>
    </div>

    <!-- Header Layout -->
    <div class="mdk-header-layout js-mdk-header-layout">

        <!-- Header -->

        <div id="header" class="mdk-header bg-dark js-mdk-header mb-0" data-effects="waterfall blend-background" data-fixed data-condenses>
            <div class="mdk-header__content">

                <div class="navbar navbar-expand-sm navbar-dark bg-dark pr-0 pr-md-16pt" id="default-navbar" data-primary>

                    <!-- Navbar toggler -->
                    <button class="navbar-toggler navbar-toggler-right d-block d-md-none" type="button" data-toggle="sidebar">
                        <span class="navbar-toggler-icon"></span>
                    </button>

                    <!-- Navbar Brand -->
                    <a href="<?php echo base_url('Welcome')?>" class="navbar-brand">
                      <img class="navbar-brand-icon" width="30" alt="">
                      <img src="<?php echo base_url('assets/tealdark/images/logo/putih.png')?>" class="navbar-brand-icon" width="60" alt="">
                        <span class="d-none d-md-block">Tell Me Basdat</span>
                    </a>

                    <button class="btn btn-black mr-16pt" data-toggle="modal" data-target="#courses">Courses <i class="material-icons">arrow_drop_down</i></button>

                    <form class="search-form search-form--black search-form-courses d-none d-md-flex" action="library-filters.html">
                        <input type="text" class="form-control" placeholder="What would you like to learn?">
                        <button class="btn" type="submit" role="button"><i class="material-icons">search</i></button>
                    </form>

                    <!-- Main Navigation -->

                    <ul class="nav navbar-nav ml-auto flex-nowrap" style="white-space: nowrap;">
                        <li class="d-inline d-sm-flex nav-item">
                            <a href="<?php echo base_url('Login')?>" class="btn btn-accent">LOGIN</a>
                        </li>
                    </ul>



                    <!-- // END Main Navigation -->

                </div>

            </div>
        </div>

        <!-- // END Header -->
