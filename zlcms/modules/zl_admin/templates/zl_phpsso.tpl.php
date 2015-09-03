<?php defined('IN_ADMIN') or exit('No permission resources.'); ?>
<script language="javascript" type="text/javascript" src="<?php echo JS_PATH?>jquery.min.js"></script>
<ul class="page-sidebar-menu">
    <li style="margin-bottom: 10px;"><div class="sidebar-toggler hidden-phone"></div></li>
    <li class="open"><a href="javascript:;"><i class="icon-cogs"></i><span class="title">phpsso<?php echo L('manage')?></span><span class="arrow "></span></a>
        <ul class="sub-menu"><li>
		<a style="outline: medium none;" hidefocus="true" href="<?php echo $setting['phpsso_api_url']?>/index.php?m=zl_admin&c=member&a=manage&forward=<?php echo urlencode($setting['phpsso_api_url'].'/index.php?m=zl_admin&c=member&a=manage')?>" target="right"><?php echo L('member_manage')?></a>
		</li>
		<li>
		<a style="outline: medium none;" hidefocus="true" href="<?php echo $setting['phpsso_api_url']?>/index.php?m=zl_admin&c=applications&a=init&forward=<?php echo urlencode($setting['phpsso_api_url'].'/index.php?m=zl_admin&c=applications&a=init')?>" target="right"><?php echo L('application')?></a>
		</li>
		<li>
		<a style="outline: medium none;" hidefocus="true" href="<?php echo $setting['phpsso_api_url']?>/index.php?m=zl_admin&c=messagequeue&a=manage&forward=<?php echo urlencode($setting['phpsso_api_url'].'/index.php?m=zl_admin&c=messagequeue&a=manage')?>" target="right"><?php echo L('communication')?></a>
		</li>
		<li>
		<a style="outline: medium none;" hidefocus="true" href="<?php echo $setting['phpsso_api_url']?>/index.php?m=zl_admin&c=credit&a=manage&forward=<?php echo urlencode($setting['phpsso_api_url'].'/index.php?m=zl_admin&c=credit&a=manage')?>" target="right"><?php echo L('redeem')?></a>
		</li>
		<li>
		<a style="outline: medium none;" hidefocus="true" href="<?php echo $setting['phpsso_api_url']?>/index.php?m=zl_admin&c=administrator&a=init&forward=<?php echo urlencode($setting['phpsso_api_url'].'/index.php?m=zl_admin&c=administrator&a=init')?>" target="right"><?php echo L('administrator')?></a>
		</li>
		<li>
		<a style="outline: medium none;" hidefocus="true" href="<?php echo $setting['phpsso_api_url']?>/index.php?m=zl_admin&c=system&a=init&forward=<?php echo urlencode($setting['phpsso_api_url'].'/index.php?m=zl_admin&c=system&a=init')?>" target="right"><?php echo L('system_setting')?></a>
		</li>
		<li>
		<a style="outline: medium none;" hidefocus="true" href="<?php echo $setting['phpsso_api_url']?>/index.php?m=zl_admin&c=cache&a=init&forward=<?php echo urlencode($setting['phpsso_api_url'].'/index.php?m=zl_admin&c=cache&a=init')?>" target="right"><?php echo L('update_phpsso_cache')?></a>
		</li>
		<li>
		<a style="outline: medium none;" hidefocus="true" href="<?php echo $setting['phpsso_api_url']?>/index.php?m=zl_admin&c=password&a=init&forward=<?php echo urlencode($setting['phpsso_api_url'].'/index.php?m=zl_admin&c=password&a=init')?>" target="right"><?php echo L('change_password')?></a>
		</li>
		<li>
		<a style="outline: medium none;" hidefocus="true" href="<?php echo $setting['phpsso_api_url']?>/index.php?m=zl_admin&c=login&a=logout&forward=<?php echo urlencode($setting['phpsso_api_url'].'/index.php?m=zl_admin&c=member&a=manage')?>" target="right"><?php echo L('exit')?>phpsso</a>
		</li>
		</ul>
</ul>
		<script  type="text/javascript">
			$("#leftMain li").click(function() {
				var i =$(this).index() + 1;
				$("#leftMain li").removeClass();
				$("#leftMain li:nth-child("+i+")").addClass("on fb blue");
			});
		</script>