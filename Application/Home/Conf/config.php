<?php
define('__URL__','http://localhost/thinkphp3');
return array(
	//'配置项'=>'配置值'
    'TMPL_PARSE_STRING'  =>array(
        '__HOME_CSS__' => __URL__.'/Public/Home/css', // 更改默认的/Public 替换规则
        '__HOME_JS__'     => __URL__.'/Public/Home/js', // 增加新的JS类库路径替换规则
        '__HOME_IMG__'     => __URL__.'/Public/Home/img', // 增加新的JS类库路径替换规则
    )
);