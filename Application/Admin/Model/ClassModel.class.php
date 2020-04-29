<?php
namespace Admin\Model;

use Think\Model;

class ClassModel extends Model{
//生成自动验证的代码
protected $_validate= array(
array('name','require','班级名称不能为空',self::EXISTS_VALIDATE),
);
}