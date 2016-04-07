<!DOCTYPE html>
<html lang="en">
<head>
    <title>{{ getenv('PAGE_TITLE') }}</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="/images/icons/favicon.ico">
    <link rel="apple-touch-icon" href="/images/icons/favicon.png">
    <link rel="apple-touch-icon" sizes="72x72" href="/images/icons/favicon-72x72.png">
    <link rel="apple-touch-icon" sizes="114x114" href="/images/icons/favicon-114x114.png">
    <!--Loading bootstrap css-->
    <link type="text/css" rel="stylesheet" href="/styles/font_sans.css?family=Open+Sans:400italic,400,300,700">
    <link type="text/css" rel="stylesheet" href="/styles/font_oswald.css?family=Oswald:400,700,300">
    <link type="text/css" rel="stylesheet" href="/styles/jquery-ui-1.10.4.custom.min.css">
    <link type="text/css" rel="stylesheet" href="/font-awesome/css/font-awesome.css">
    <link type="text/css" rel="stylesheet" href="/styles/bootstrap.min.css">
    <link type="text/css" rel="stylesheet" href="/styles/animate.css">
    <link type="text/css" rel="stylesheet" href="/styles/all.css">
    <link type="text/css" rel="stylesheet" href="/styles/main.css">
    <link type="text/css" rel="stylesheet" href="/styles/style-responsive.css">
    <link type="text/css" rel="stylesheet" href="/styles/zabuto_calendar.min.css">
    <link type="text/css" rel="stylesheet" href="/styles/pace.css">
    <link type="text/css" rel="stylesheet" href="/styles/jquery.news-ticker.css">
    <link type="text/css" rel="stylesheet" href="/styles/jplist-custom.css">
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js" type="text/javascript"></script>

       <link rel="stylesheet" href="/packages/tooltips/css/tooltip.css">
</head>
<body>
    <div>
       
        <!--END THEME SETTING-->
        <!--BEGIN BACK TO TOP-->
        <a id="totop" href="#"><i class="fa fa-angle-up"></i></a>
        <!--END BACK TO TOP-->
        <!--BEGIN TOPBAR-->
        <div id="header-topbar-option-demo" class="page-header-topbar">
            <nav id="topbar" role="navigation" style="margin-bottom: 0;" data-step="3" class="navbar navbar-default navbar-static-top">
            <div class="navbar-header">
                <button type="button" data-toggle="collapse" data-target=".sidebar-collapse" class="navbar-toggle"><span class="sr-only">Toggle navigation</span><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></button>
                <a id="logo"  class="navbar-brand"><span class="fa fa-rocket"></span><span class="logo-text"><img src="/images/logo.png" width="100px" style="    margin-top: -21px; margin-bottom: -15px;" ></span><span style="display: none" class="logo-text-icon">µ</span></a></div>
            <div class="topbar-main"><a id="menu-toggle" href="#" class="hidden-xs"><i class="fa fa-bars"></i></a>
                <ul class="nav navbar navbar-top-links navbar-right mbn">
           <!--          <li class="dropdown"><a data-hover="dropdown" href="#" class="dropdown-toggle"><i class="fa fa-bell fa-fw"></i><span class="badge badge-green">3</span></a>
                        
                    </li>
                    <li class="dropdown"><a data-hover="dropdown" href="#" class="dropdown-toggle"><i class="fa fa-envelope fa-fw"></i><span class="badge badge-orange">7</span></a>
                        
                    </li>
                    <li class="dropdown"><a data-hover="dropdown" href="#" class="dropdown-toggle"><i class="fa fa-tasks fa-fw"></i><span class="badge badge-yellow">8</span></a>
                        
                    </li> -->
                    {% include 'partials/drop_menu.volt'%}
                    <!-- <li id="topbar-chat" class="hidden-xs"><a href="javascript:void(0)" data-step="4" data-intro="&lt;b&gt;Form chat&lt;/b&gt; keep you connecting with other coworker" data-position="left" class="btn-chat"><i class="fa fa-comments"></i><span class="badge badge-info">3</span></a></li> -->
                </ul>
            </div>
        </nav>
        </div>
        <!--END TOPBAR-->
        <div id="wrapper">
              {% include "partials/left_menu.volt" %}

            <!--BEGIN PAGE WRAPPER-->
            <div id="page-wrapper">
                <!--BEGIN TITLE & BREADCRUMB PAGE-->
                {% include "partials/sub_head.volt" %} 
                <!--END TITLE & BREADCRUMB PAGE-->
                <!--BEGIN CONTENT-->
<!-- <div class="page-content"> -->
                    <!-- <div id="tab-general"> -->
                        <!-- <div id="sum_box" class="row mbl"> -->
                        <?=$this->getContent()?>
                        <!-- </div> -->
                    <!-- </div> -->
     <!-- </div> -->
                <!--END CONTENT-->
                <!--BEGIN FOOTER-->
                <div id="footer">
                    <div class="copyright">
                    <!-- Some text -->
                    </div>
                </div>
                <!--END FOOTER-->
            </div>
            <!--END PAGE WRAPPER-->
        </div>
    </div>
    <!-- // <script src="/script/jquery-1.10.2.min.js" type="text/javascript"></script> -->

    <script src="/script/jquery-migrate-1.2.1.min.js"></script>
    <script src="/script/jquery-ui.js"></script>
    <script src="/script/bootstrap.min.js"></script>
    <script src="/script/bootstrap-hover-dropdown.js"></script>
    <script src="/script/html5shiv.js"></script>
    <script src="/script/respond.min.js"></script>
    <script src="/script/jquery.metisMenu.js"></script>
    <script src="/script/jquery.slimscroll.js"></script>
    <script src="/script/jquery.cookie.js"></script>
    <script src="/script/icheck.min.js"></script>
    <script src="/script/custom.min.js"></script>
    <script src="/script/jquery.news-ticker.js"></script>
    <script src="/script/jquery.menu.js"></script>
    <script src="/script/pace.min.js"></script>
    <script src="/script/holder.js"></script>
    <script src="/script/responsive-tabs.js"></script>
      <script src="/script/jplist.min.js"></script>
    <script src="/script/jplist.js"></script>
     <!-- <script src="/script/jquery.flot.js"></script>
    // <script src="/script/jquery.flot.categories.js"></script>
    // <script src="/script/jquery.flot.pie.js"></script>
    // <script src="/script/jquery.flot.tooltip.js"></script>
    // <script src="/script/jquery.flot.resize.js"></script>
    // <script src="/script/jquery.flot.fillbetween.js"></script>
    // <script src="/script/jquery.flot.stack.js"></script>
    // <script src="/script/jquery.flot.spline.js"></script>
    // <script src="/script/zabuto_calendar.min.js"></script> -->
    <!-- // <script src="/script/index.js"></script> -->
    <!--CORE JAVASCRIPT-->
      <!--   <script src="/script/highcharts.js"></script>
    // <script src="/script/data.js"></script>
    // <script src="/script/drilldown.js"></script>
    // <script src="/script/exporting.js"></script>
    // <script src="/script/highcharts-more.js"></script>
    // <script src="/script/charts-highchart-pie.js"></script>
    // <script src="/script/charts-highchart-more.js"></script> -->
    <script src="/script/main.js"></script>
    
</body>
    <script src="/packages/tooltips/js/tooltip.js"></script>
<script>
    $(document).ready(function() {

        $('input[type="text"]').tooltip({ container: 'body'});
        $('input').tooltip({ container: 'body'});
        $('select').tooltip({ container: 'body'});
        $('input[type="number"]').tooltip({ container: 'body'});
    });
</script>
</html>
