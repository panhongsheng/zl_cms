<?php
defined('IN_ZLCMS') or exit('No permission resources.');
pc_base::load_sys_class('model', '', 0);
class product_pic_model extends model {
	function __construct() {
		$this->db_config = pc_base::load_config('database');
		$this->db_setting = 'default';
		$this->table_name = 'product_pic';
        $this->product_cat = pc_base::load_model('product_cat_model');
		parent::__construct();
	}
    function insert_data($array,$father='')
    {   $i = 0;
        foreach ($array as $key => $dir) {
            if (is_array($dir)){
                $this->insert_data($dir,$key);
            }elseif($key!='path'){
                //初始化插入数据
                $i++;
                $pic_name = array_iconv($dir);
                $file_path = array_iconv($father);
                $where = array('cat_original_name' => $file_path);
                $get_data = $this->product_cat->get_one($where, 'cat_id');
                $in_post = array(
                    'cat_id' => $get_data[cat_id],
                    'img_path' => array_iconv($array[path]).'/'.$pic_name,
                    'original_name' => $pic_name,
                );
                if($i == 1)$in_post[is_thumb] = 1;
                $this->insert($in_post);
            }
        }
    }

    public function insert_product($in_post, $ret_id)
    {
        echo 'dd';
    }
}
?>