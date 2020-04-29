<?php


namespace Admin\Controller;



class HeadmasterController extends BaseController{
    protected  $title = '班主任';
    protected  $table_name = 'Headmaster';

    public function __index_data(){
        $rows = D('headmaster')->alias('a')
            ->field('a.id,a.name as h_name,b.name as d_name,a.status,a.create_time')
            ->join('dept as b on a.position=b.id')
            ->select();
        $this->assign('rows',$rows);
//        dump($rows);die;
    }

    protected  function __save_data(){
        $depts = D("dept")->field('id,name')->select();
//        dump($depts);die;
        $this->assign('depts',$depts);
    }
}

