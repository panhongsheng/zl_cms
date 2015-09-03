<?php
defined('IN_ZLCMS') or exit('No permission resources.');
pc_base::load_sys_class('model', '', 0);
class product_cat_model extends model
{
    function __construct()
    {
        $this->db_config = pc_base::load_config('database');
        $this->db_setting = 'default';
        $this->table_name = 'product_cat';
        parent::__construct();
    }

    function insert_data($array, $father = '', $i = '')
    {
        $k = 0;
        $i++;
        foreach ($array as $key => $dir) {
            //初始化插入数据
            $cat_name = array_iconv($key);
            $in_post = array(
                'parent_id' => $father,
                'cat_original_name' => $cat_name,
            );
            $k++;
            if (count($dir) >= 1) {
                //插入栏目
                $father_id = $this->insert_product($in_post, 1);
                $this->insert_data($dir, $father_id, $i);
            } else {
                $in_post[is_product] = 1;
                //插入产品
                $this->insert_product($in_post, '');
            }
        }
    }

    public function insert_product($in_post, $ret_id)
    {
        $re_id = $this->insert($in_post, $ret_id);
		if($ret_id) return $re_id;
    }

    public function get_file_path($cat_name, $cat_id = '',$files = array())
    {
        if ($cat_id)
            $where = array('cat_id' => $cat_id);
        else
            $where = array('cat_original_name' => $cat_name);
        $data = $this->get_one($where, 'cat_id,parent_id,cat_original_name');
        if ($data[parent_id]) {
            $files[] = $data[cat_original_name];
            $this->get_file_path($data[cat_original_name], $data[parent_id],$files);
        } else {
            print_r($files);
        }
    }
}

?>