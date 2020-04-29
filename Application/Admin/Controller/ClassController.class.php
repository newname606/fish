<?php
namespace Admin\Controller;

class ClassController extends BaseController{
    protected  $title = '班级表';
    protected  $table_name = 'Class';

    protected  function __index_data($start,$end){
        $rows = D('class')->alias('a')
            ->field('a.id,a.name as c_name,b.name as h_name,c.name as t_name,a.status,a.create_time')
            ->join('headmaster as b on a.headmaster_id=b.id')
            ->join('teacher as c on a.teacher_id=c.id')
            ->order('a.id desc')
            ->limit($start,$end)
            ->select();
        $this->assign('rows', $rows);
    }

    protected function __save_data(){
        $headmasters = D('headmaster')->field('id,name')->select();
        $teachers = D('teacher')->field('id,name')->select();
        $this->assign('headmasters',$headmasters);
        $this->assign('teachers',$teachers);
    }
}

