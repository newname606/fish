<?php
/**
 * Created by PhpStorm.
 * User: dongshao
 * Date: 2019/11/8
 * Time: 15:08
 */
namespace Admin\Model;

use Think\Model;

class TypeModel extends Model
{
    protected $_validate = array(
        array('name','require','名称不能为空')
    );
}