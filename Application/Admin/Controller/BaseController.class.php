<?php
/**
 * Created by PhpStorm.
 * User: gaming
 * Date: 2019/11/10
 * Time: 10:09
 */

namespace Admin\Controller;

use Think\Controller;
use Think\Page;

class BaseController extends Controller
{
    protected $title;
    protected $table_name;
    public $model;
    protected function _initialize(){
        $this->model = D($this->table_name);
    }
    //后台首页
    public  function index(){
        $count = $this->model->count();
        $page = new Page($count,5);
        $pageHtml = $page->show();

        $rows = $this->model->order('id asc')->limit($page->firstRow.','.$page->listRows)->select();
        $this->assign('title',$this->title);
        $this->assign('rows',$rows);
        $this->__index_data($page->firstRow,$page->listRows);
        $this->assign('pageHtml',$pageHtml);
        $this->display();
    }
    //id为空添加,不为空修改
    public function save(){
        if(IS_POST){
            $data = $this->model->create();

            $this->__new_data($data);//文件上传
            if($data !==false){
                $data['create_time'] = time();
                if(empty(I('post.id'))){
                    if($this->model->add($data) !== false){
                        $this->success("添加成功",U('index'));exit;
                    }
                }else{
                    if($this->model->save($data) !== false){
//                        $this->model->getLastSql();die;
                        $this->success("编辑成功",U('index'));exit;
                    }
                }
            }
        }
        $id = I('get.id');
        if(!empty($id)){
            $row = $this->model->find($id);
            $this->assign($row);
        }
        $this->__save_data();
        $this->display();
    }

    //教师班级
    public function classs(){
        $this->__cs_data();
        $this->display();
    }

    //教师分数
    public function point(){
        $this->__point_data();
        $this->display();
    }

    //教师意见
    public function opinion(){
        $this->__opinion_data();
        $this->display();
    }

    protected function __cs_data(){}
    protected function __new_data(&$data){}
    protected function __index_data(){}
    protected function __save_data(){}//添加一个钩子方法,为有需要的控制准备数据
    protected function __point_data(){}
    protected function __opinion_data(){}



    //删除
    public function delete($id){
        $result = $this->model->delete($id);
        if ($result){
            $this->success('删除成功',U('index'));
        }
    }
}