<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9"> <![endif]-->
<!--[if !IE]><!--> <html lang="en"> <!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
    <meta charset="utf-8" />
    <title>Metronic | UI Features - General</title>
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
</head>
<!-- END HEAD -->
<!-- BEGIN BODY -->
<style>
    body {
        background-color: #ffffff !important;
    }
</style>
<body>
<div id="myModal2" class="modal hide fade in" tabindex="-1" role="dialog" aria-labelledby="myModalLabel2" aria-hidden="false" style="display: block">
    <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
        <h3 id="myModalLabel2"><?php echo L('message_tips');?></h3>
    </div>
    <div class="modal-body">
        <p><?php echo $msg?></p>
    </div>
    <div class="modal-footer">
        <div class="bottom">
            <?php if($url_forward=='goback' || $url_forward=='') {
            $show_id = 'goback'; $showmsg = L('return_previous');
            } elseif($url_forward=="close") {
            $show_id = 'close'; $showmsg = '';
            } elseif($url_forward=="blank") {
            $show_id = 'blank'; $showmsg = '';
            } elseif($url_forward) {//��
            if(strpos($url_forward,'&pc_hash')===false) $url_forward .= '&pc_hash='.$_SESSION['pc_hash'];
             $show_id = 'url_forward'; $showmsg = L('click_here');
             }?>
        </div>
        <button  id="<?php echo $show_id;?>" data-dismiss="modal" class="btn green"><?php echo $showmsg;?></button>
    </div>
</div>
<!-- END JAVASCRIPTS -->
<script src="/statics/newstyle/js/jquery-1.10.1.min.js" type="text/javascript"></script>
<?php if($returnjs) { ?> <script style="text/javascript"><?php echo $returnjs;?></script><?php } ?>
<?php if ($dialog):?><script style="text/javascript">window.top.right.location.reload();window.top.art.dialog({id:"<?php echo $dialog?>"}).close();</script><?php endif;?>
<script type="text/javascript">
    <?php if($url_forward&&$url_forward!='goback'){?>
     setTimeout(location.href ='<?php echo $url_forward?>',<?php echo $ms?>);
    <?php }?>
    $("#myModalLabel2").click(function () {
        history.back();
    })
    $("#goback").click(function () {
        history.back();
    })
    $(".close").click(function () {
        window.close()
    })
    $("#url_forward").click(function () {
        window.location.href = '<?php echo $url_forward?>';
    })
</script>
</body>
<!-- END BODY -->
</html>