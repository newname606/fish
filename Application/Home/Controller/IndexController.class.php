<?php
namespace Home\Controller;
use Think\Controller;
class IndexController extends Controller
{
    //前台首页
    public function index()
    {
        $surveys = M('survey')->field('id,name')->select();
        $classs = D('class')->field('id,name')->group('name')->select();

        $this->assign([
            'surveys'=>$surveys,
            'classs'=>$classs
    ]);
        $this->display();
    }

    public function tcher()
    {
        $survey_id = I('post.survey_id', '');
        $class_id = I('post.class_id', '');
        //当调查编号为1就是班主任,反之就是任课教师
        if ($survey_id == 1) {
            $tchers = $this->headmaster($class_id);
        } else {
            $tchers = $this->teacher($class_id);
        }
        $this->ajaxReturn($tchers);exit;
    }

    //班主任
    public function headmaster($a)
    {
        $headmasters = D('headmaster')->alias('a')
            ->field('a.id,a.name')
            ->join('class as b on a.id=b.headmaster_id')
            ->where('b.id=' . $a)
            ->select();
//        dump($headmasters);die;
        return $headmasters;
    }

    //教师
    public function teacher($a)
    {
        $teacher = D('teacher')->alias('a')
            ->field('a.id,a.name')
            ->join('class b on a.id=b.teacher_id')
            ->where('b.id=' . $a)
            ->select();
//        dump($teacher);die;
        return $teacher;
    }

    public function check()
    {
        $data = I();
        $list['survey'] = M('survey')->field('id,name')->where('id='.$data['survey'])->find();
        $list['class']  = M('class')->field('id,name')->where('id=' .$data['class'])->find();
        $list['teacher'] = M('teacher')->field('id,name')->where('id=' .$data['teacher'])->find();
        if ($list['survey']['id'] == 1) {//1为学生满意度,否则教师满意度
            $sorts = M('Bz_subject')->alias('a')
                ->field('a.id,a.name as s_name,a.sort_id,b.name,b.id')
                ->join('sort as b on a.sort_id=b.id')
                ->group('a.id')
                ->select();
            foreach($sorts as $sort)
                $vo[$sort['name']][]=$sort;
//            dump($vo);die;
        }else {
            $vo = M('tc_subject')->field('id,name')->select();
        }
//        dump($subjects);
//        dump($vo);die;
        $this->assign([
            'vo'=>$vo,
            'list'=>$list
        ]);
        $this->display();
    }

    //分数
    public function point(){
        //获取id
        $survey_id = I('get.survey_id');
        $class_id = I('get.class_id', '');
        //survey_id为1 就是学生满意度.否则就是教师满意度
        if ($survey_id == 1) {
            $headmaster_id = I('get.teacher_id');
            $where['class_id'] = $class_id;
            $where['headmaster_id'] = $headmaster_id;
            $fraction = M('fraction')->where($where)->select();
            if($fraction == null){/*查询出这个班做没做,没做就添加,做了就修改*/
                foreach (I('subject') as $k=>$v){//添加
                    foreach ($v as $value=>$vi){
                        $data = [
                            'sort_id'=>$k,
                            'class_id'=>$class_id,
                            'headmaster_id'=>$headmaster_id,
                            'create_time'=>time(),
                            't_id'=>$value,
                            'point'=>$vi,
                        ];
                        $sql= M('fraction')->add($data);
                    }
                }
            }else{//修改
                foreach(I('subject') as $key=>$value){
                    foreach ($value as $k=>$v){
                        $sort_id = $key;
                        $t_id = $k;
                        $point=$v;
                        $sql = M('fraction')->execute("update fraction set number= number+1,point = point+$point
                        where class_id=$class_id and headmaster_id=$headmaster_id and sort_id=$sort_id and t_id=$t_id");
                    }
                }
            }
            foreach (I('intro') as $k=>$value){//意见入库
                $idea = [
                    'class_id' =>$class_id,
                    'headmaster_id'=>$headmaster_id,
                    'sort_id'=>$k,
                    'name'=>$value,
                    'create_time'=>time(),
                ];
                $result = M('idea')->add($idea);
            }
            if($sql != false and $result !=false){
                $this->display('Index/thanks');exit;
            }else{
                echo "滚蛋";
            }
        }else{
            $teacher_id = I('get.teacher_id', '');
            $where['class_id'] = $class_id;
            $where['teacher_id'] = $teacher_id;
//            $where['create_time'] = time();
            $intro = M('intro')->field('id,number')->where($where)->select();
            if ($intro == null){//添加
                foreach(I('subject') as $v=>$k){
                    $data = [
                        'teacher_id' =>$teacher_id,
                        'class_id'=>$class_id,
                        't_id'=>$v,
                        'point'=>$k,
                        'create_time'=>time(),
                    ];
                   $sql = M('intro')->add($data);
                }
            }else{/*修改*/
               foreach (I('subject') as $v=>$k){
                   $t_id = $v;
                   $point = $k;
                   $sql = M('intro')->execute("update intro set number=number+1,point=point+$point where class_id=$class_id and teacher_id=$teacher_id and t_id=$t_id");
               }
            }
            /*意见*/
            $opinion = I('get.');
            $opinion['name'] = I('post.intro');
            $opinion['create_time'] = time();
            $result = M('opinion')->add($opinion);
            if($sql !== false and $result != false){
                $this->display('Index/thanks');exit;
            }else{
                echo "滚蛋";
            }
        }
    }
}