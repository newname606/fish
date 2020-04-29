<?php

namespace Admin\Model;

use Think\Model;

class UserModel extends Model
{
//生成自动验证的代码
    protected $_validate = array(
        array('name', 'require', '名称不能为空', self::EXISTS_VALIDATE),
        array('role_id', 'require', '角色不能为空', self::EXISTS_VALIDATE),
    );

    public function Login()
    {
        $name = I('post.name');
//        dump($username);die;
        $password = I('post.password');
        $result = $this->field('id,password')->where(array('name' => $name))->find();
//        dump($result);die;
        $id = $result['id'];
        if (!empty($result)) {//用户名存在
            if ($result['password'] == $password) {//验证密码
                return $id;
            } else {
                return -2;
            }
        } else {
            return -1;
        }
    }
}