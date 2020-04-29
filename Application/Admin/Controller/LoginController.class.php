<?php
/**
 * Created by PhpStorm.
 * User: gaming
 * Date: 2019/11/15
 * Time: 15:10
 */

namespace Admin\Controller;


use Admin\Model\LoginModel;
use Think\Controller;
use Think\Verify;

class LoginController extends Controller
{
    public function index(){
        $this->display();
    }

    public function logout(){
        session('name',null);
        $this->success('退出成功',U('Login/index'));
    }

    public function validate(){
        if(IS_POST){
            $loginmodel = D('user'); //创建一个login模型
            if($loginmodel->create() !== false){
                $result = $loginmodel->Login(); //拿到返回的结果
                $id = $result;
                if($result > 0){
                    $verify = new Verify();
                    if(!$verify->check(I('post.captcha'))){
                        $this->ajaxReturn(array('status'=>-3,'msg'=>'验证码错误'));
                    }else{
                        if(I('post.remember') == 1){ //保存session
                            $name = I('post.name');
                            session('name',$name);//保存用户名
                            session('id',$id);//保存id
                        }
//                        $this->success('登录成功',U('Index/index'));exit;
                        $this->ajaxReturn(array('status'=>1,'url'=>U('Index/index')));
                    }
                }else{
                    if($result == -1){
//                        $this->error('用户名错误',U('Login/index'));exit;
                        $this->ajaxReturn(array('status'=>-1,'msg'=>'用户名错误'));exit;
                    }elseif($result == -2) {
//                        $this->error('密码错误',U('Login/index'));exit;
                        $this->ajaxReturn(array('status'=>-2,'msg'=>'密码错误'));exit;
                    }else{
                        $this->error('滚',U('Login/index'));exit;
                    }
                }
        }
        $this->display();
        }
    }
}