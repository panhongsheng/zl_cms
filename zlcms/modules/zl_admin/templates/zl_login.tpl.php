<?php defined('IN_ADMIN') or exit('No permission resources.'); ?>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9"> <![endif]-->
<!--[if !IE]><!--> <html lang="en"> <!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=<?php echo CHARSET;?>" />
    <meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
    <title><?php echo L('ZLCMS_logon')?></title>
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
    <link href="/statics/newstyle/css/login-soft.css" rel="stylesheet" type="text/css"/>
    <!-- END PAGE LEVEL STYLES -->
    <link rel="shortcut icon" href="/statics/newstyle/image/favicon.ico" />
</head>
<!-- END HEAD -->
<!-- BEGIN BODY -->
<body class="login">
<!-- BEGIN LOGO -->
<div class="logo">
    <img src="/statics/newstyle/image/logo-big.png" alt="" />
</div>
<!-- END LOGO -->
<!-- BEGIN LOGIN -->
<div class="content">
    <!-- BEGIN LOGIN FORM -->
    <form class=""  action="index.php?m=zl_admin&c=index&a=login&dosubmit=1" method="post" name="myform">
        <h3 class="form-title">ZLCMS后台登录</h3>
        <div class="alert alert-error hide">
            <button class="close" data-dismiss="alert"></button>
            <span>请输入你的账号和密码</span>
        </div>
        <div class="control-group">
            <!--ie8, ie9 does not support html5 placeholder, so we just show field title for that-->
            <label class="control-label visible-ie8 visible-ie9">账户</label>
            <div class="controls">
                <div class="input-icon left">
                    <i class="icon-user"></i>
                    <input name="dosubmit" value="" type="hidden"/>
                    <input class="m-wrap placeholder-no-fix" type="text" placeholder="请输入用户名" name="username"/>
                </div>
            </div>
        </div>
        <div class="control-group">
            <label class="control-label visible-ie8 visible-ie9">密码</label>
            <div class="controls">
                <div class="input-icon left">
                    <i class="icon-lock"></i>
                    <input class="m-wrap placeholder-no-fix" type="password" placeholder="请输入密码" name="password"/>
                </div>
            </div>
        </div>
        <div class="form-actions">
            <div class="controls">
                <input name="code" type="text" placeholder="small" class="m-wrap small">
                <span class="help-inline" style="margin-top: 0px;">
                    <?php echo form::checkcode('code_img')?><br />
                        <a href="javascript:document.getElementById('code_img').src='<?php echo SITE_PROTOCOL.SITE_URL.WEB_PATH;?>api.php?op=checkcode&m=zl_admin&c=index&a=checkcode&time='+Math.random();void(0);"></a>
                </span>
            </div>
            <button type="submit" class="btn blue pull-left">
                登录<i class="m-icon-swapright m-icon-white"></i>
            </button>
        </div>
    </form>
    <!-- END LOGIN FORM -->
</div>
<!-- END LOGIN -->
<!-- BEGIN COPYRIGHT -->
<div class="copyright">
    2013 &copy; Metronic - Admin Dashboard Template.
</div>
<!-- END COPYRIGHT -->
<!-- BEGIN JAVASCRIPTS(Load javascripts at bottom, this will reduce page load time) -->
<!-- BEGIN CORE PLUGINS -->
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
<script src="/statics/newstyle/js/jquery.validate.min.js" type="text/javascript"></script>
<script src="/statics/newstyle/js/jquery.backstretch.min.js" type="text/javascript"></script>
<!-- END PAGE LEVEL PLUGINS -->
<!-- BEGIN PAGE LEVEL SCRIPTS -->
<script src="/statics/newstyle/js/app.js" type="text/javascript"></script>
<script src="/statics/newstyle/js/login-soft.js" type="text/javascript"></script>
<!-- END PAGE LEVEL SCRIPTS -->
<script>
    jQuery(document).ready(function() {
        App.init();
        Login.init();
    });
</script>
<!-- END JAVASCRIPTS -->
</body>
<!-- END BODY -->
</html>