<?php
namespace Admin\Controller;

class IntroController extends BaseController{
    protected  $title = '教师满意度分数汇总';
    protected  $table_name = 'Intro';

    protected  function __index_data(){
        $rows = D('intro')
            ->field("from_unixtime(create_time,'%Y-%m') as create_date")
            ->group("from_unixtime(create_time,'%Y-%m')")
            ->select();
//        dump($rows);die;
        $this->assign('rows',$rows);
    }

    //班级
    protected function __cs_data(){
//        dump(I('get.'));die;
        $where["from_unixtime(a.create_time,'%Y-%m')"] = I('get.create_time');
        $classs = D('intro')->alias('a')
            ->field("a.id,a.class_id,a.teacher_id,b.name as c_name,c.name as t_name,from_unixtime(a.create_time,'%Y-%m') as create_date")
            ->join('class as b on a.class_id=b.id')
            ->join('teacher as c on a.teacher_id=c.id')
            ->where($where)
            ->group('c.name')
            ->select();
//        dump(D('intro')->getLastSql());die;
        $this->assign('classs',$classs);
    }
    //分数
    protected function __point_data(){
        $class_id = I('get.class_id');
        $teacher_id = I('get.teacher_id');
        $where['a.class_id'] = $class_id;
        $where['a.teacher_id'] = $teacher_id;
        $points = D('intro')->alias('a')
            ->field("a.t_id,b.name as c_name,c.name as t_name,d.name as i_name,a.point,a.number,
            from_unixtime(a.create_time,'%Y-%m') as create_date,a.class_id,a.teacher_id")
            ->join('class as b on a.class_id=b.id')
            ->join('teacher as c on a.teacher_id=c.id')
            ->join('tc_subject as d on a.t_id=d.id')
            ->where($where)
            ->select();
        $list = D('intro')->points($points);
//        dump($list);die;
        $this->assign('sum',$list["sum"]);
       unset($list['sum']);
        $this->assign([
            'points'=>$list
        ]);
    }
    //意见
    protected function __opinion_data(){
        $class_id = I('get.class_id');
        $teacher_id = I('get.teacher_id');
        $where['a.class_id'] = $class_id;
        $where['a.teacher_id'] = $teacher_id;
        $opinions = D('opinion')->alias('a')
            ->field("b.name as c_name,c.name as t_name,a.name as o_name,from_unixtime(a.create_time,'%Y-%m-%d') as create_date")
            ->join('class as b on a.class_id=b.id')
            ->join('teacher as c on a.teacher_id=c.id')
            ->where($where)
            ->select();
//        dump(D('opinion')->getLastSql());die;
        $this->assign('opinions',$opinions);
    }
}

