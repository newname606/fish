<?php
namespace Admin\Model;

use Think\Model;

class RoleModel extends Model{
//生成自动验证的代码
protected $_validate= array(
//array('menu_id','require','菜单ID不能为空',self::EXISTS_VALIDATE),
);
}