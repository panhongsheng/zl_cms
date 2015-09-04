<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!--> <html lang="en" class="no-js"> <!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
    <meta charset="utf-8" />
    <title><?php echo L('admin_site_title')?></title>
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
    <link href="/statics/newstyle/css/jquery.gritter.css" rel="stylesheet" type="text/css"/>
    <link href="/statics/newstyle/css/daterangepicker.css" rel="stylesheet" type="text/css" />
    <link href="/statics/newstyle/css/fullcalendar.css" rel="stylesheet" type="text/css"/>
    <link href="/statics/newstyle/css/jqvmap.css" rel="stylesheet" type="text/css" media="screen"/>
    <link href="/statics/newstyle/css/jquery.easy-pie-chart.css" rel="stylesheet" type="text/css" media="screen"/>
    <!-- END PAGE LEVEL STYLES -->
    <link rel="shortcut icon" href="/statics/newstyle/image/favicon.ico" />
    <link href="<?php echo CSS_PATH?>dialog.css" rel="stylesheet" type="text/css" />
    <script language="javascript" type="text/javascript" src="<?php echo JS_PATH?>dialog.js"></script>
</head>
<!-- END HEAD -->
<!-- BEGIN BODY -->
<body class="page-header-fixed"  onload="wSize();" onresize="wSize();">
<!-- 头部开始 BEGIN HEADER -->
<div class="header navbar navbar-inverse navbar-fixed-top">
<!-- BEGIN TOP NAVIGATION BAR -->
<div class="navbar-inner">
<div class="container-fluid">
<!-- BEGIN LOGO -->
<a class="brand" href="index.html">
    <img src="/statics/newstyle/image/logo.png" alt="logo"/>
</a>
<!-- END LOGO -->
    <div class="hor-menu">
        <div class="navbar-inner">
            <ul class="nav" id="top_menu">
                <?php
                $array = admin::admin_menu(0);
                foreach($array as $_value) {
                    if($_value['id']==10) {
                        echo '<li id="_M'.$_value['id'].'" class="active"><a href="javascript:_M('.$_value['id'].',\'?m='.$_value['m'].'&c='.$_value['c'].'&a='.$_value['a'].'\')" hidefocus="true" style="outline:none;">'.L($_value['name']).'<span class="selected"></span></a></li>';
                    } elseif($_value['id']!=8) {
                        echo '<li id="_M'.$_value['id'].'"><a href="javascript:_M('.$_value['id'].',\'?m='.$_value['m'].'&c='.$_value['c'].'&a='.$_value['a'].'\')"  hidefocus="true" style="outline:none;">'.L($_value['name']).'<span class="selected"></span></a></li>';
                    }
                }
                ?>
            </ul>
        </div>
    </div>
    <!-- BEGIN TOP NAVIGATION MENU -->
    <ul class="nav pull-right">
        <!-- BEGIN USER LOGIN DROPDOWN -->
        <li class="dropdown user">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                <img alt="" src="/statics/newstyle/image/avatar1_small.jpg" />
                <span class="username"><?php echo $admin_username?>  [<?php echo $rolename?>]</span>
                <i class="icon-angle-down"></i>
            </a>
            <ul class="dropdown-menu">
                <li><a href="?m=zl_admin&c=index&a=public_logout"><i class="icon-key"></i> <?php echo L('exit')?></a></li>
            </ul>
        </li>
        <!-- END USER LOGIN DROPDOWN -->
    </ul>
    <!-- END TOP NAVIGATION MENU -->
</div>
</div>
<!-- END TOP NAVIGATION BAR -->
</div>
<!-- 头部结束 END HEADER -->
<div class="copyrights">Collect from <a href="#" >zlcms</a></div>
<!-- BEGIN CONTAINER -->
<div class="page-container">
<!-- BEGIN SIDEBAR -->
<div class="page-sidebar nav-collapse collapse">
    <div id="Scroll">
        <div id="leftMain"></div>
    </div>
</div>
<!-- END SIDEBAR -->
<!-- BEGIN PAGE -->
<div class="page-content">
<!-- BEGIN SAMPLE PORTLET CONFIGURATION MODAL FORM-->
<div id="portlet-config" class="modal hide">
    <div class="modal-header">
        <button data-dismiss="modal" class="close" type="button"></button>
        <h3>Widget Settings</h3>
    </div>
    <div class="modal-body">
        Widget settings form goes here
    </div>
</div>
<!-- END SAMPLE PORTLET CONFIGURATION MODAL FORM-->
<!-- BEGIN PAGE CONTAINER-->
<div class="container-fluid">
    <div class="page-content-body row-fluid">
        <div class="row-fluid" style="margin-top: 20px;">
            <ul class="breadcrumb" id="current_pos"><li><i class="icon-home"></i>zlcms</li></ul>
            <!-- END PAGE TITLE & BREADCRUMB-->
        </div>
        <div class="span2" id="display_center_id" style="display:none;padding-left: 30px;background-color: #eeeeee;margin-left: 0px;">
            <iframe name="center_frame" id="center_frame" src="" frameborder="false" scrolling="auto" style="border:none" width="100%" height="auto" allowtransparency="true"></iframe>
        </div>
        <div id="main_center" >
            <iframe name="right" id="rightMain" src="?m=zl_admin&c=index&a=public_main" frameborder="false" scrolling="auto" style="border:none; margin-bottom:30px" width="100%" height="1000xp;" allowtransparency="true"></iframe>
        </div>
    </div>
</div>
<!-- END PAGE -->
</div>
<!-- END CONTAINER -->
<!-- BEGIN FOOTER -->
<div class="footer navbar-fixed-bottom">
    <div class="footer-inner navbar" style="margin-bottom: 0px;">
        <div class="nav" id="panellist">
            <?php foreach($adminpanel as $v) {?>
                <span><a onclick="paneladdclass(this);" target="right" href="<?php echo $v['url'].'menuid='.$v['menuid'].'&pc_hash='.$_SESSION['pc_hash'];?>"><?php echo L($v['name'])?></a>
					 <a class="panel-delete icon-remove icon-white" href="javascript:delete_panel(<?php echo $v['menuid']?>, this);"></a></span>
            <?php }?>
        </div>
        <div id="paneladd"></div>
        <input type="hidden" id="menuid" value="">
        <input type="hidden" id="bigid" value="" />
    </div>
    <div class="footer-tools">
			<span class="go-top">
			<i class="icon-angle-up"></i>
			</span>
    </div>
</div>
<!-- END FOOTER -->
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
<script src="/statics/newstyle/js/jquery.vmap.js" type="text/javascript"></script>
<script src="/statics/newstyle/js/jquery.vmap.russia.js" type="text/javascript"></script>
<script src="/statics/newstyle/js/jquery.vmap.world.js" type="text/javascript"></script>
<script src="/statics/newstyle/js/jquery.vmap.europe.js" type="text/javascript"></script>
<script src="/statics/newstyle/js/jquery.vmap.germany.js" type="text/javascript"></script>
<script src="/statics/newstyle/js/jquery.vmap.usa.js" type="text/javascript"></script>
<script src="/statics/newstyle/js/jquery.vmap.sampledata.js" type="text/javascript"></script>
<script src="/statics/newstyle/js/jquery.flot.js" type="text/javascript"></script>
<script src="/statics/newstyle/js/jquery.flot.resize.js" type="text/javascript"></script>
<script src="/statics/newstyle/js/jquery.pulsate.min.js" type="text/javascript"></script>
<script src="/statics/newstyle/js/date.js" type="text/javascript"></script>
<script src="/statics/newstyle/js/daterangepicker.js" type="text/javascript"></script>
<script src="/statics/newstyle/js/jquery.gritter.js" type="text/javascript"></script>
<script src="/statics/newstyle/js/fullcalendar.min.js" type="text/javascript"></script>
<script src="/statics/newstyle/js/jquery.easy-pie-chart.js" type="text/javascript"></script>
<script src="/statics/newstyle/js/jquery.sparkline.min.js" type="text/javascript"></script>
<!-- END PAGE LEVEL PLUGINS -->
<!-- BEGIN PAGE LEVEL SCRIPTS -->
<script src="/statics/newstyle/js/app.js" type="text/javascript"></script>
<script src="/statics/newstyle/js/index.js" type="text/javascript"></script>
<!-- END PAGE LEVEL SCRIPTS -->
<script>
    jQuery(document).ready(function() {
        App.init(); // initlayout and core plugins
        Index.init();
        Index.initJQVMAP(); // init index page's custom scripts
        Index.initCalendar(); // init index page's custom scripts
        Index.initCharts(); // init index page's custom scripts
        Index.initChat();
        Index.initMiniCharts();
        Index.initDashboardDaterange();
        Index.initIntro();
    });
    var pc_hash = '<?php echo $_SESSION['pc_hash']?>';
    function _MP(menuid,targetUrl) {
        $("#menuid").val(menuid);
        $("#rightMain").attr('src', targetUrl+'&menuid='+menuid+'&pc_hash='+pc_hash);
        $("#paneladd").html('<a class="panel-add icon-plus" href="javascript:add_panel();"><em><?php echo L('add')?></em></a>');
        if(menuid == '822'){
            $('#main_center').addClass('span10');
            $('#display_center_id').css('display','block');
        }else{
            $('#main_center').removeClass('span10');
        }
        $('.sub-menu li').removeClass("active");
        //$(this).siblings().addClass("active");
        $('#_MP'+menuid).addClass("active");
        $('#_MP'+menuid).parent().parent().addClass("active").siblings().removeClass("active");
        $.get("?m=zl_admin&c=index&a=public_current_pos_zl&menuid="+menuid, function(data){
            $("#current_pos").html(data);
        });
    }
    /*获取屏幕尺寸*/
    var getWindowSize = function(){
        return ["Height","Width"].map(function(name){
            return window["inner"+name] ||
                document.compatMode === "CSS1Compat" && document.documentElement[ "client" + name ] || document.body[ "client" + name ]
        });
    }
    function wSize(){
        //这是一字符串
        var str=getWindowSize();
        var strs= new Array(); //定义一数组
        strs=str.toString().split(","); //字符分割
        var heights = strs[0]-190,
        Body = $('body');
        $('.page-content').css('min-height',strs[0]-80+'px');
        $('#rightMain').height(heights);
        $('#main_center').height(heights);
        $('#display_center_id').height(heights);
        var openClose = $("#rightMain").height()+39;
        $('#center_frame').height(openClose+9);
        windowW();
    }
    wSize();
    function _M(menuid,targetUrl) {
        $("#menuid").val(menuid);
        $("#bigid").val(menuid);
        if(menuid!=8) {
            $("#leftMain").load("?m=zl_admin&c=index&a=public_menu_left&menuid="+menuid, {limit: 25}, function(){
                windowW();
            });
        } /**phpsso else {
            $("#leftMain").load("?m=zl_admin&c=phpsso&a=public_menu_left&menuid="+menuid, {limit: 25}, function(){
                windowW();
            });
        }**/
        $('#_M'+menuid).siblings().removeClass("active");
        $('#_M'+menuid).addClass("active");
        $.get("?m=zl_admin&c=index&a=public_current_pos_zl&menuid="+menuid, function(data){
            $("#current_pos").html(data);
        });
        //当点击顶部菜单后，隐藏中间的框架
        $('#display_center_id').css('display','none');
        $("#paneladd").html('<a class="panel-add icon-plus" href="javascript:add_panel();"><em><?php echo L('add')?></em></a>');
    }
    function windowW(){
    }
    function add_panel() {
        var menuid = $("#menuid").val();
        $.ajax({
            type: "POST",
            url: "?m=zl_admin&c=index&a=public_ajax_add_panel",
            data: "menuid=" + menuid,
            success: function(data){
                if(data) {
                    $("#panellist").html(data);
                }
            }
        });
    }
    function delete_panel(menuid, id) {
        $.ajax({
            type: "POST",
            url: "?m=zl_admin&c=index&a=public_ajax_delete_panel",
            data: "menuid=" + menuid,
            success: function(data){
                $("#panellist").html(data);
            }
        });
    }
    function paneladdclass(id) {
        $("#panellist span a[class='on']").removeClass();
        $(id).addClass('on')
    }
    $("#leftMain").load("?m=zl_admin&c=index&a=public_menu_left&menuid=10");
</script>
<!-- END JAVASCRIPTS -->
</body>
<!-- END BODY -->
</html>