<?php

namespace Admin\Behavior;

use Think\Behavior;

class TestBehavior extends Behavior
{
    public $arr = array('Login','Index','Gen');

    //行为
    public function run(&$param)
    {
//        if (in_array(CONTROLLER_NAME, $this->arr)) {
//            return true;
//        }
//        $controller_name = CONTROLLER_NAME.'/index';
//
//        $authority = D('user')->alias('a')
//            ->field('a.id,a.role_id,b.menu_id')
//            ->join('role b on a.role_id=b.id')
//            ->where('a.id='.session('id'))
//            ->find();
//        $menus = D('menu')->field('id,name,path')->where(array("id in({$authority['menu_id']})"))
//            ->select();
//        $arr= [];
//        foreach ($menus as $menu) {
//            $arr[] = $menu['path'];
//        }
//        if(in_array($controller_name,$arr)){
//            return true;
//        }else{
//             echo "你不配访问";
//        }
    }
}


