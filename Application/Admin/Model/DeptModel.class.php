<?php
namespace Admin\Model;

use Think\Model;

class DeptModel extends Model{
//生成自动验证的代码
protected $_validate= array(
array('name','require','部门名称不能为空',self::EXISTS_VALIDATE),
);
}