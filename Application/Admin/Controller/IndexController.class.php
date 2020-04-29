<?php
namespace Admin\Controller;
use Think\Controller;
class IndexController extends Controller {
    public function index(){
        $this->display('index');
    }
    public function menu(){
//        echo 1;die;
        $user = D('user')->alias('a')
            ->field('a.id,a.name,a.role_id,b.menu_id')
            ->join('role b on a.role_id=b.id')
            ->where(array('a.id'=>session('id')))
            ->find();

        $navs = D('menu')->alias('a')
            ->field('b.id,b.name')
            ->join('right join nav b on a.nav_id=b.id')
            ->where("a.id in({$user['menu_id']})")

            ->group('b.name')
            ->select();
//
        $menus = D('menu')->field('id,name,nav_id,path')->where("id in({$user['menu_id']})")->select();
//        dump($menus);die;


        $this->assign('navs',$navs);
        $this->assign('menus',$menus);
        $this->display();
    }
}