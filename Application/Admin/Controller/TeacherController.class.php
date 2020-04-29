<?php


namespace Admin\Controller;



class TeacherController extends BaseController{
    protected  $title = '教师';
    protected  $table_name = 'Teacher';



    protected  function __index_data(){
        $rows = D('teacher')->alias('a')
            ->field('a.id,a.name as t_name,b.name as d_name,a.status,a.create_time')
            ->join('dept as b on a.position=b.id')
            ->select();
        $this->assign('rows', $rows);
    }



    protected  function __save_data(){
        $depts = D("dept")->field('id,name')->select();
//        dump($depts);die;
        $this->assign('depts',$depts);
    }
}

