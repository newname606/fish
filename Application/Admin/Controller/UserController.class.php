<?php


namespace Admin\Controller;



class UserController extends BaseController{
    protected  $title = '用户';
    protected  $table_name = 'User';

    protected function __index_data(){
        //teacher表为a,dept表为b
        $rows = D('user')->alias('a')
            ->field('a.id,a.name as u_name,a.role_id,b.name as r_name,a.status,a.create_time')
            ->join('role b on a.role_id=b.id')
            ->select();
//        dump($rows);die;
        $this->assign('rows',$rows);
    }

    /*
     * 添加数据的时候查询部门信息
     */
    protected function __save_data(){
        $roles = D("role")->field('id,name')->select();
        $this->assign("roles",$roles);
    }
    public function __new_data(&$data){
        $data['role_name'] = arr2str($data['role_name']);
    }
}

