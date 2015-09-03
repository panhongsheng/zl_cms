<?php defined('IN_ADMIN') or exit('No permission resources.'); ?>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9"> <![endif]-->
<!--[if !IE]><!--> <html lang="en"> <!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
    <meta charset="utf-8" />
    <title>Metronic | Data Tables - Managed Tables</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />
    <meta content="" name="description" />
    <meta content="" name="author" />
    <!-- BEGIN GLOBAL MANDATORY STYLES -->
    <link href="/statics/newstyle/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <link href="/statics/newstyle/css/bootstrap-responsive.min.css" rel="stylesheet" type="text/css"/>
    <link href="/statics/newstyle/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
    <link href="/statics/newstyle/css/style-metro.css" rel="stylesheet" type="text/css"/>
    <link href="/statics/newstyle/css/style.css" rel="stylesheet" type="text/css"/>
    <link href="/statics/newstyle/css/style-responsive.css" rel="stylesheet" type="text/css"/>
    <link href="/statics/newstyle/css/default.css" rel="stylesheet" type="text/css" id="style_color"/>
    <link href="/statics/newstyle/css/uniform.default.css" rel="stylesheet" type="text/css"/>
    <!-- END GLOBAL MANDATORY STYLES -->
    <!-- BEGIN PAGE LEVEL STYLES -->
    <link rel="stylesheet" type="text/css" href="/statics/newstyle/css/select2_metro.css" />
    <link rel="stylesheet" href="/statics/newstyle/css/DT_bootstrap.css" />
    <?php if(isset($show_validator)) { ?>
    <link rel="stylesheet" type="text/css" href="media/css/chosen.css" />
    <?php } ?>

    <!-- END PAGE LEVEL STYLES -->
    <link rel="shortcut icon" href="/statics/newstyle/image/favicon.ico" />
    <!-- END PAGE CONTENT-->
    <script src="/statics/newstyle/js/jquery-1.10.1.min.js" type="text/javascript"></script>
    <script src="/statics/newstyle/js/jquery-migrate-1.2.1.min.js" type="text/javascript"></script>
    <!-- IMPORTANT! Load jquery-ui-1.10.1.custom.min.js before bootstrap.min.js to fix bootstrap tooltip conflict with jquery ui tooltip -->
    <script src="/statics/newstyle/js/jquery-ui-1.10.1.custom.min.js" type="text/javascript"></script>
    <script src="/statics/newstyle/js/bootstrap.min.js" type="text/javascript"></script>
    <!--[if lt IE 9]>
    <script src="/statics/newstyle/js/excanvas.min.js"></script>
    <script src="/statics/newstyle/js/respond.min.js"></script>
    <![endif]-->
    <script src="/statics/newstyle/js/jquery.slimscroll.min.js" type="text/javascript"></script>
    <script src="/statics/newstyle/js/jquery.blockui.min.js" type="text/javascript"></script>
    <script src="/statics/newstyle/js/jquery.cookie.min.js" type="text/javascript"></script>
    <script src="/statics/newstyle/js/jquery.uniform.min.js" type="text/javascript" ></script>
    <!-- END CORE PLUGINS -->
    <!-- BEGIN PAGE LEVEL PLUGINS -->
    <script type="text/javascript" src="/statics/newstyle/js/select2.min.js"></script>
    <script type="text/javascript" src="/statics/newstyle/js/jquery.dataTables.js"></script>
    <script type="text/javascript" src="/statics/newstyle/js/DT_bootstrap.js"></script>
    <!-- END PAGE LEVEL PLUGINS -->
    <!-- BEGIN PAGE LEVEL SCRIPTS -->
    <script src="/statics/newstyle/js/app.js"></script>
    <script src="/statics/newstyle/js/table-managed.js"></script>
    <?php if(isset($show_validator)) { ?>
        <script type="text/javascript" src="/statics/newstyle/js/jquery.validate.min.js"></script>
        <script type="text/javascript" src="/statics/newstyle/js/additional-methods.min.js"></script>
        <script type="text/javascript" src="/statics/newstyle/js/chosen.jquery.min.js"></script>
        <script type="text/javascript" src="/statics/newstyle/js/form-validation.js"></script>
    <?php } ?>
    <script>
        jQuery(document).ready(function() {
            App.init();
            TableManaged.init();
            <?php if(isset($show_validator)) { ?>
            FormValidation.init();
            <?php } ?>
        });
    </script>
</head>
<body style="background-color: #ffffff !important;">