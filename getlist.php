<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 15-3-4
 * Time: 上午11:06
 */
//username=G2581314&ts=1425969987&sid=11&fcm=1&flag=478f483dd6ecb4ee71c87f00be7d5a91
//username=G2581314&ts=1425970170&sid=1&fcm=1&flag=475789fb9bf1aec8ab0d04bc9ca29386


/*
r=+1001+1426242318+1+1+ETrrCr8uRiW6QA9Hxb9LRk75GxnzoD6E


1001142624231811ETrrCr8uRiW6QA9Hxb9LRk75GxnzoD6E


MD5=fa9173074596a66e49746adf68353236
*/
echo md5('1001142624231811ETrrCr8uRiW6QA9Hxb9LRk75GxnzoD6E');
exit;
//获取最新的列表
 function _get_server_list()
{
    $severlist = file_get_contents('http://wentian.5i.com/serverlist.txt');
    $max_server_name =  _get_plat_max_srv();
    $severlist1 = explode("\n", $severlist);
    $severlist2 = array();
    foreach ($severlist1 as $val) {
        if ($val) {
            $severlist3 = explode(" ", $val);
            $key = str_replace('s', '', $severlist3[2]);
            $severlist2[$severlist3[1]][$key] = $severlist3[2];
        }
    }
    $severlist_all = array();

    foreach ($severlist2 as $key => $val) {
        ksort($val);
        $data_x = $val;
        $i = 0;
        foreach ($val as $key_1 => $val_1) {
            if ($key_1 >= 1000) continue;
            $severlist_all[$key][$key_1]['old'] = $val_1;
            $i++;
            if (!isset($val[$key_1 + 1]) && count($val) != $i) {
                $data_yuan = str_replace('s', '', next($data_x));
                if ($key_1 != $max_server_name[$key])
                    $severlist_all[$key][$key_1]['new'] = $val_1 . '-s' . ($data_yuan - 1);
                elseif ($key_1 < $max_server_name[$key])
                    $severlist_all[$key][$key_1]['new'] = $val_1 . '-s' . $max_server_name[$key];
            } elseif (count($val) == $i&& $key_1 < $max_server_name[$key]) {
                $severlist_all[$key][$key_1]['new'] = $val_1 . '-s' . $max_server_name[$key];
            }
        }
    }
    return $severlist_all;
}

//获取每个平台最大服值
 function _get_plat_max_srv()
{
    $severlist1 = explode("\n", file_get_contents('http://wentian.5i.com/allserverlist.txt'));
    $severlist2 = array();
    foreach ($severlist1 as $val) {
        if ($val) {
            $severlist3 = explode(" ", $val);
            $key = str_replace('s', '', $severlist3[2]);
            $severlist2[$severlist3[1]][$key] = $severlist3[2];
        }
    }
    $severlist_all = array();
    foreach ($severlist2 as $key => $val) {
        ksort($val);
        foreach ($val as $key_1 => $val_1) {
            if ($key_1 >= 1000) continue;
            $severlist_all[$key] = $key_1;
        }
    }
    unset($severlist1);
    unset($severlist2);
    return $severlist_all;
}

$get_new_list = _get_server_list();
print_r($get_new_list);
exit;

exit;
header('Content-type: text/html; charset=utf-8');

//$str = 'jiedian1(,){jiedian2[$]jiedian3[$]jiedian4(|){jiedian5[#]jieidan6}}';

$str1 = "zhi2$zhi3$zhi5#zhi6|zhi5#zhi6,zhi2$zhi3$zhi5#zhi6|zhi5#zhi6";
$chai_arr = array('');

exit;

//获取每个平台最大服值


//获取最新的列表

print_r(_get_server_list());
exit;


$severlist = file_get_contents('http://wentian.5i.com/serverlist.txt');
$max_server_name = get_plat_max_srv();
$severlist1 = explode("\n", $severlist);
$severlist2 = array();
foreach ($severlist1 as $val) {
    if ($val) {
        $severlist3 = explode(" ", $val);
        $key = str_replace('s', '', $severlist3[2]);
        $severlist2[$severlist3[1]][$key] = $severlist3[2];
    }
}
$severlist_all = array();
foreach ($severlist2 as $key => $val) {
    ksort($val);
    $data_x = $val;
    $i = 0;
    foreach ($val as $key_1 => $val_1) {
        if ($key_1 >= 1000) continue;
        $severlist_all[$key][$key_1]['old'] = $val_1;
        $i++;
        if (!isset($val[$key_1 + 1]) && count($val) != $i) {
            $data_yuan = str_replace('s', '', next($data_x));
            if ($key_1 != $max_server_name[$key])
                $severlist_all[$key][$key_1]['new'] = $val_1 . '-s' . $data_yuan;
            elseif ($key_1 < $max_server_name[$key])
                $severlist_all[$key][$key_1]['new'] = $val_1 . '-s' . $max_server_name[$key];
        }
    }
}

ksort($severlist2[4399]);
print_r($severlist2[4399]);

echo '<pre>';
print_r($severlist_all);
echo '</pre>';
exit;
foreach ($severlist2 as $key => $val) {
    ksort($val);
    $data_x = $val;
    $i = 0;
    foreach ($val as $key_1 => $val_1) {
        $severlist_all[$key] = max($val);
    }
}
$severlist = file_get_contents('http://wentian.5i.com/serverlist.txt');
$severlist1 = explode("\n", $severlist);
$severlist2 = array();
foreach ($severlist1 as $val) {
    if ($val) {
        $severlist3 = explode(" ", $val);
        $key = str_replace('s', '', $severlist3[2]);
        $severlist2[$severlist3[1]][$key] = $severlist3[2];
    }
}
$severlist_all = array();
foreach ($severlist2 as $key => $val) {
    ksort($val);
    $data_x = $val;
    $i = 0;
    foreach ($val as $key_1 => $val_1) {
        $severlist_all[$key][$key_1]['old'] = $val_1;
        $i++;
        if (!isset($val[$key_1 + 1]) && count($val) != $i) {
            $severlist_all[$key][$key_1]['new'] = $val_1 . '-s' . (str_replace('s', '', next($data_x)) - 1);
        }
    }
}
echo '<pre>';
print_r($severlist_all);
echo '</pre>';
exit;
/*
//http://s1.tj.g.pps.tv/oss/admintool/api/pps/check.php?
user_id=253733180
&agent=pps
&is_adult=1
&server_id=1
&time=1425536813
&sign=eae51a932f171ce0642e1af225980f29
&is_client=0

http://s1.tj.g.pps.tv/oss/admintool/api/pps/check.php?user_id=
253733180&agent=pps&is_adult=1&server_id=1&time=1425538124&sign=13d8ccad89b41034193567e24e36b550&is_client=0

http://s1.tj.g.pps.tv/oss/admintool/api/pps/usercheck.php?user_id=253733180&server_id=1&agent=pps&time=1425540613&sign=713ecb01b7da7de33cfbeb7ae37f6069
sign= md5(user_id=253733180&server_id=1&key=9E8LFW6nV3RXeuGdnhdKahrgNTTS7xFk)

sign= md5(user_id=$user_id&server_id=$server_id&key=$key)
*/
$md5_string = 'user_id=253733180&agent=pps&is_adult=1&server_id=1&time=1425538124&key=9E8LFW6nV3RXeuGdnhdKahrgNTTS7xFk';
$my_sign = md5('user_id=253733180&server_id=1&key=9E8LFW6nV3RXeuGdnhdKahrgNTTS7xFk');
echo $my_sign;
exit;
$mysql = file_get_contents('http://wentian.5i.com/gen_runningmysqllist.txt');
$mysql1 = explode("\n", $mysql);
$mysql2 = array();
foreach ($mysql1 as $val) {
    $mysql3 = explode(" ", $val);
    $mysql4 = explode("_", $mysql3[1]);
    $mysql2[$mysql4[2]] = str_replace('.sock', '', $mysql4[3]);
}
$data = file_get_contents('http://wentian.5i.com/serverlist.txt');
$data1 = explode("\n", $data);
$data2 = array();
foreach ($data1 as $val) {
    $data2[] = explode(" ", $val);
}

foreach ($data2 as $val) {
    $suiji1 = rand(0, 59);
    $suiji2 = rand(0, 59);
    echo '
#' . $val[1] . '_' . $val[2] . ' START

#每个小时在线人数统计
59 23 * * * /usr/local/php/bin/php /data/game/wentian_' . $val[1] . '_' . $val[2] . '/client/oss/script/count_online.php 2>>/data/game/wentian_' . $val[1] . '_' . $val[2] . '/client/oss/script/crontab_error.txt
#一分钟一次的权限赋值SHELL命令文件，主要给日志文件加上可读权限
*/1 * * * * /usr/local/php/bin/php /data/game/wentian_' . $val[1] . '_' . $val[2] . '/client/oss/script/rolenum.php 2>>/data/game/wentian_' . $val[1] . '_' . $val[2] . '/client/oss/script/crontab_error.txt
#获取每个小时中人数达到最高的时间及人数
0 */1 * * * /usr/local/php/bin/php /data/game/wentian_' . $val[1] . '_' . $val[2] . '/client/oss/script/count_day_online.php 2>>/data/game/wentian_' . $val[1] . '_' . $val[2] . '/client/oss/script/crontab_error.txt
#每30分钟获取游戏产生的log日志数据
#*/15 * * * * /usr/local/php/bin/php /data/game/wentian_' . $val[1] . '_' . $val[2] . '/client/oss/script/readlog.php 2>>/data/game/wentian_' . $val[1] . '_' . $val[2] . '/client/oss/script/crontab_error.txt
*/15 * * * * /usr/local/php/bin/php /data/game/wentian_' . $val[1] . '_' . $val[2] . '/client/oss/script/readlog_b1.php 2>>/data/game/wentian_' . $val[1] . '_' . $val[2] . '/client/oss/script/crontab_error.txt
*/2 * * * * /usr/local/php/bin/php /data/game/wentian_' . $val[1] . '_' . $val[2] . '/client/oss/script/readlog_b2.php 2>>/data/game/wentian_' . $val[1] . '_' . $val[2] . '/client/oss/script/crontab_error.txt
#每天注册流失率统计(每小时统计一次)
01 * * * * /usr/local/php/bin/php /data/game/wentian_' . $val[1] . '_' . $val[2] . '/client/oss/script/count_reg_lostrate.php 86400 2>>/data/game/wentian_' . $val[1] . '_' . $val[2] . '/client/oss/script/crontab_error.txt
#每个小时注册流失率统计
02 * * * * /usr/local/php/bin/php /data/game/wentian_' . $val[1] . '_' . $val[2] . '/client/oss/script/count_reg_lostrate.php 3600 2>>/data/game/wentian_' . $val[1] . '_' . $val[2] . '/client/oss/script/crontab_error.txt
#元宝/绑定元宝/铜钱库存统计，每天00:01分执行统计前一天的内容
01 00 * * * /usr/local/php/bin/php /data/game/wentian_' . $val[1] . '_' . $val[2] . '/client/oss/script/count_store.php 2>>/data/game/wentian_' . $val[1] . '_' . $val[2] . '/client/oss/script/crontab_error.txt
#每天获取玩家实时在线人数数据
03 00 * * * /usr/local/php/bin/php /data/game/wentian_' . $val[1] . '_' . $val[2] . '/client/oss/script/readlog.php 86400 2>>/data/game/wentian_' . $val[1] . '_' . $val[2] . '/client/oss/script/crontab_error.txt
#每天的1:10分获取玩家的留存率
10 1 * * * /usr/local/php/bin/php /data/game/wentian_' . $val[1] . '_' . $val[2] . '/client/oss/script/count_player_live.php 2>>/data/game/wentian_' . $val[1] . '_' . $val[2] . '/client/oss/script/crontab_error.txt
#每个小时获取前一个小时玩家登录人数
02 */1 * * * /usr/local/php/bin/php /data/game/wentian_' . $val[1] . '_' . $val[2] . '/client/oss/script/count_login.php 2>>/data/game/wentian_' . $val[1] . '_' . $val[2] . '/client/oss/script/crontab_error.txt
#5分钟统计一次在线
*/5 * * * * /usr/local/php/bin/php /data/game/wentian_' . $val[1] . '_' . $val[2] . '/client/oss/script/count_ip_online.php 2>>/data/game/wentian_' . $val[1] . '_' . $val[2] . '/client/oss/script/crontab_error.txt
#每天等级玩家登录时长
58 23 * * * /usr/local/php/bin/php /data/game/wentian_' . $val[1] . '_' . $val[2] . '/client/oss/script/count_level_online.php 2>>/data/game/wentian_' . $val[1] . '_' . $val[2] . '/client/oss/script/crontab_error.txt
#30分钟一次的定时发送邮件
*/30 * * * *  /usr/local/php/bin/php /data/game/wentian_' . $val[1] . '_' . $val[2] . '/client/oss/script/sendmail.php 2>>/data/game/wentian_' . $val[1] . '_' . $val[2] . '/client/oss/script/crontab_error.txt
#10分钟一次的日志解析
*/10 * * * *  /usr/local/php/bin/php /data/game/wentian_' . $val[1] . '_' . $val[2] . '/client/oss/script/readlog_a1.php 2>>/data/game/wentian_' . $val[1] . '_' . $val[2] . '/client/oss/script/crontab_error.txt
#个人排行日志
00 00,12 * * *  /usr/local/php/bin/php /data/game/wentian_' . $val[1] . '_' . $val[2] . '/client/oss/script/log_personrank.php 2>>/data/game/wentian_' . $val[1] . '_' . $val[2] . '/client/oss/script/crontab_error.txt
#mysqldump备份数据库
' . $suiji1 . ' 4 * * * /bin/sh /data/shell/backupmysql.sh 127.0.0.1 ' . $mysql2[$val[2]] . ' ' . $val[1] . '_' . $val[2] . ' ye10010@qq.com  2>>/data/game/wentian_' . $val[1] . '_' . $val[2] . '/client/oss/script/crontab_error.txt
#innobackup备份数据库
' . $suiji2 . ' 5 * * * /bin/sh /data/shell/mysqlinnobackupex.sh ' . $val[1] . ' ' . $val[2] . ' ' . $val[1] . '_' . $val[2] . ' ye10010@qq.com  2>>/data/game/wentian_' . $val[1] . '_' . $val[2] . '/client/oss/script/crontab_error.txt
#' . $val[1] . '_' . $val[2] . '  END
';
}
