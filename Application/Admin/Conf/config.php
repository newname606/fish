<?php
define('__URL__','http://localhost/thinkphp3/');
return array(
	//'配置项'=>'配置值'
    'TMPL_PARSE_STRING'  =>array(
        '__ADMIN_CSS__' => __URL__.'Public/admin/Styles', // 更改默认的/Public 替换规则
        '__ADMIN_JS__'     => __URL__.'Public/admin/js', // 增加新的JS类库路径替换规则
        '__ADMIN_IMG__' => __URL__.'Public/admin/Images' // 增加新的上传路径替换规则
    ),
);

