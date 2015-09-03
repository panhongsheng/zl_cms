<?php
defined('IN_ADMIN') or exit('No permission resources.');
include $this->admin_tpl('zl_header');
?>
<!-- END PAGE HEADER-->
<div class="row-fluid">
<!-- BEGIN EXAMPLE TABLE PORTLET-->
<div class="portlet box light-grey">
<div class="portlet-body">
<div class="clearfix">
    <div class="btn-group">
     <a  class="btn green" href="index.php?m=zl_admin&c=site&a=add&pc_hash=<?php echo $_SESSION['pc_hash']?>"> Add New <i class="icon-plus"></a></i>
    </div>
    <div class="btn-group pull-right">
        <button class="btn dropdown-toggle" data-toggle="dropdown">Tools <i class="icon-angle-down"></i>
        </button>
        <ul class="dropdown-menu pull-right">
            <li><a href="#">Print</a></li>
            <li><a href="#">Save as PDF</a></li>
            <li><a href="#">Export to Excel</a></li>
        </ul>
    </div>
</div>
<table class="table table-striped table-bordered table-hover" id="sample_1">
<thead>
<tr>
    <th style="width:8px;"><input type="checkbox" class="group-checkable" data-set="#sample_1 .checkboxes" /></th>
    <th width="80">Siteid</th>
    <th><?php echo L('site_name')?></th>
    <th><?php echo L('site_dirname')?></th>
    <th><?php echo L('site_domain')?></th>
    <th align="center"><?php echo L('godaddy')?></th>
    <th width="150"><?php echo L('operations_manage')?></th>
</tr>
</thead>
<tbody>
<?php
if(is_array($list)):
foreach($list as $v):
?>
<tr class="odd gradeX">
    <td><input type="checkbox" class="checkboxes" value="1" /></td>
    <td width="80" align="center"><?php echo $v['siteid']?></td>
    <td align="center"><?php echo $v['name']?></td>
    <td align="center"><?php echo $v['dirname']?></td>
    <td align="center"><?php echo $v['domain']?></td>
    <td align="center"><?php if ($v['siteid']!=1){?><?php echo pc_base::load_config('system', 'html_root')?>/<?php echo $v['dirname'];} else{echo '/';}?></td>
    <td>
        <a href="#" class="btn mini purple"><i class="icon-edit"></i>编辑</a>
        <a href="#" class="btn mini black"><i class="icon-trash"></i> Delete</a>
    </td>
</tr>
<?php
endforeach;
endif;
?>
</tbody>
</table>
</div>
</div>
<!-- END EXAMPLE TABLE PORTLET-->
</div>
</body>
<!-- END BODY -->
</html>