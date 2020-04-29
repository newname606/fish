<?php
namespace Admin\Controller;
class RoleController extends BaseController{
    protected  $title = '角色';
    protected  $table_name = 'Role';

    protected function __save_data(){
        $menus = D('menu')->field('id,name')->select();
//        dump(I('get.'));die;
        if(!empty(I('get.id'))){
            $authority = D('role')->field('menu_id')->where('id='.I('get.id'))->find();
            $this->assign('authority',str2arr($authority['menu_id']));
        }
//        dump(I('get.id'));die;
        $this->assign('menus',$menus);
    }
    public function __new_data(&$data){
        $data['menu_id'] = arr2str($data['menu_id']);
//        dump($data);die;
    }
}

