<?php


namespace Admin\Controller;



class ProfessionController extends BaseController{
    protected  $title = '专业表';
    protected  $table_name = 'Profession';

    protected function __index_data(){
        $rows = D('profession')->alias('a')
            ->field('a.id,a.name,b.name as t_name,a.status,a.create_time')
            ->join('teacher b on a.teacher_id=b.id')
            ->select();
        $this->assign('rows',$rows);
    }

    protected function __save_data(){
        $teachers = D('teacher')->field('id,name')->select();
//        dump($teachers);die;
        $this->assign('teachers',$teachers);
    }
}

