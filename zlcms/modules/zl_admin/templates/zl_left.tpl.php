<?php
defined('IN_ADMIN') or exit('No permission resources.');
$pc_hash = $_SESSION['pc_hash'];
echo '<ul class="page-sidebar-menu"><li style="margin-bottom: 10px;"><div class="sidebar-toggler hidden-phone"></div></li>';
$i=0;
foreach($datas as $_m) {
    $i++;
    $first = $i==1?'style="display: block;"':'';
    echo '<li class="open"><a href="javascript:;"><i class="icon-cogs"></i><span class="title">'.L($_m['name']).'</span><span class="arrow "></span><span class="selected"></span></a><ul class="sub-menu" '.$first.'>';
	$sub_array = admin::admin_menu($_m['id']);
	foreach($sub_array as $_key=>$l_m1) {
		//附加参数
		$data = $l_m1['data'] ? '&'.$l_m1['data'] : '';
        $ajax_url = "javascript:_MP(".$l_m1['id'].",'?m=".$l_m1['m']."&c=".$l_m1['c']."&a=".$l_m1['a'].$data."');";
        echo '<li id="_MP'.$l_m1['id'].'"><a class="fstart" href="'.$ajax_url.'">'.L($l_m1['name']).'</a></li>';
	}
	echo '</li></ul>';
}
echo '</ul>';
?>