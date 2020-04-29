<?php
namespace Admin\Controller;

class MenuController extends BaseController
{
    protected $title = '菜单';
    protected $table_name = 'Menu';

    protected function __index_data($start,$end)
    {
        $rows = D('menu')->alias('a')
            ->field('a.id,a.name as m_name,b.name as n_name,a.path,a.status,a.create_time')
            ->join('nav as b on a.nav_id=b.id')
            ->order('a.id asc')
            ->limit($start,$end)
            ->select();
//        dump($rows);die;
        $this->assign('rows', $rows);
    }
    protected function __save_data()
    {
        $navs = D("nav")->field('id,name')->select();
        if(!empty(I('get.id'))){
            $menus = D('menu')->field('nav_id')->where('id='.I('get.id'))->find();
            $this->assign('menus',str2arr($menus['nav_id']));
        }

//        dump($navs);die;
        $this->assign('navs', $navs);
    }
    //数组转字符串
    public function __new_data(&$data){
        $data['nav_id'] = arr2str($data['nav_id']);
//        dump($data['nav_id']);die;
    }
}
