<?php
namespace Admin\Model;

use Think\Model;

class MenuModel extends Model{
//生成自动验证的代码
protected $_validate= array(
array('path','require','不能为空',self::EXISTS_VALIDATE),
);
}