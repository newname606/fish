<?php
namespace Admin\Controller;
class FractionController extends BaseController{
    protected  $title = '学生满意度汇总';
    protected  $table_name = 'Fraction';

    protected function __index_data(){
        $rows = D('fraction')
            ->field("from_unixtime(create_time,'%Y-%m') as create_date")
            ->group("from_unixtime(create_time,'%Y-%m')")
            ->select();
        $this->assign('rows',$rows);
    }

    //查询班级
    protected function __cs_data(){
        $where["from_unixtime(a.create_time,'%Y-%m')"] = I('get.create_time');
        $css = D('fraction')->alias('a')
            ->field('b.name as c_name,c.name as h_name,from_unixtime(a.create_time,"%Y-%m") as create_date,a.class_id,a.headmaster_id')
            ->join('class as b on a.class_id=b.id')
            ->join('headmaster as c on a.headmaster_id=c.id')
            ->where($where)
            ->group('b.name')
            ->select();
//        dump($css);die;
        $this->assign('css',$css);
    }

    //查询分数
        protected function __point_data(){
            $class_id = I('get.class_id');
            $headmaster_id = I('get.headmaster_id');
            $where['a.class_id'] = $class_id;
            $where['a.headmaster_id'] = $headmaster_id;
            $points = D('fraction')->alias('a')
                ->field("a.t_id,b.name as c_name,c.name as t_name,d.name as i_name,e.name as s_name,a.point,a.number,
                from_unixtime(a.create_time,'%Y-%m') as create_date,a.class_id,a.headmaster_id")
                ->join('class as b on a.class_id=b.id')
                ->join('headmaster as c on a.headmaster_id=c.id')
                ->join('bz_subject as d on a.t_id=d.id')
                ->join('sort as e on a.sort_id=e.id')
                ->where($where)
                ->select();
            $list = D('Fraction')->points($points);
            $this->assign('sum',$list['sum']);
            unset($list['sum']);
            $this->assign('points',$list);
        }

    //意见
    protected function __opinion_data(){
        $class_id = I('get.class_id');
        $headmaster_id = I('get.headmaster_id');
        $where['a.class_id'] = $class_id;
        $where['a.headmaster_id'] = $headmaster_id;
        $opinions = D('idea')->alias('a')
            ->field("b.name as c_name,c.name as t_name,a.name as o_name,from_unixtime(a.create_time,'%Y-%m-%d') as create_date")
            ->join('class as b on a.class_id=b.id')
            ->join('headmaster as c on a.headmaster_id=c.id')
            ->where($where)
            ->select();
//        dump($opinions);die;
        $this->assign('opinions',$opinions);
    }
}

