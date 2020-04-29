<?php
namespace Admin\Model;

use Think\Model;

class IntroModel extends Model{
//生成自动验证的代码
protected $_validate= array(
array('class_id','require','班级编号不能为空',self::EXISTS_VALIDATE),
array('teacher_id','require','教师编号不能为空',self::EXISTS_VALIDATE),
array('avg','require','平均分不能为空',self::EXISTS_VALIDATE),
array('point','require','总分不能为空',self::EXISTS_VALIDATE),
array('number','require','人数不能为空',self::EXISTS_VALIDATE),
);
public function points($points){
    $num = count($points);//人数
    $avgs = 0;//总平均分
    foreach ($points as $k=>$v){
        $avg = 0;//平均分
        $avg= bcdiv($v['point'],$v['number'],2);
        $v['avg']=$avg;
        $points[$k] = $v;
        $avgs +=$v['avg'];
    }
    $points['sum']= bcdiv($avgs,$num,2);
    return $points;
}
}