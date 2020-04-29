<?php
/**
 * Created by PhpStorm.
 * User: gaming
 * Date: 2019/11/12
 * Time: 15:08
 */

namespace Admin\Controller;


use Think\Controller;

class GenController extends Controller
{
    public function index(){

        if(IS_POST){
            //>>1.得到表名和模块的名字
            $table_name = I('post.table_name'); //dept
            $module_name = ucfirst(I('post.module_name')); //admin

            //>>2. 通过表名生成当前对应的标准名字  例如: brand_manager ===> BrandManager
            $name = $this->table2name($table_name); //title===>Title
            //>>3.查询表的注释
            $model = M(); //不写表明的M,可以直接使用原生态的sql语句进行查询
            $sql = "select TABLE_COMMENT from information_schema.TABLES where TABLE_NAME='".$table_name."'
            and TABLE_SCHEMA='".C('DB_NAME')."'";
            $rows = $model->query($sql);

            //获取到表的注视
            $table_comment = $rows[0]['table_comment'];


            //查询表中的字段
            $sql =" show full fields from ".$table_name;

            $fileds = $model->query($sql); //$fields中存放着每一个字段的信息


            //代码生成模板所在的文件夹
            $templateDir = MODULE_PATH.'View/Gen/';
            dump($templateDir);die;

            //>>4.生成控制器
            ob_start();  //ob缓存
            require $templateDir.'Controller.tpl';
            $controller = "<?php\r\n".ob_get_clean(); //得到controller的代码

            $controller_dir = APP_PATH.$module_name."/Controller/"; //controller的文件夹
            //is_dir判断一个文件路径是否存在,or  mkdir如果不存在则创建一个文件夹
            is_dir($controller_dir) or mkdir($controller_dir,0777,true); //确保控制器的文件夹一定存在
            file_put_contents($controller_dir."{$name}Controller.class.php",$controller);

            //>>5.生成模型
            ob_start();
            require $templateDir.'Model.tpl';
            $model = "<?php\r\n".ob_get_clean(); //得到controller的代码
            $model_dir = APP_PATH.$module_name."/Model/"; //controller的文件夹
            is_dir($model_dir) or mkdir($model_dir,0777,true); //确保控制器的文件夹一定存在
            file_put_contents($model_dir."{$name}Model.class.php",$model);



            //5.生成列表index,html
            ob_start();
            require $templateDir.'index.tpl';
            $index = ob_get_clean(); //得到controller的代码
            $index_dir = APP_PATH.$module_name."/View/$name/"; //controller的文件夹
            is_dir($index_dir) or mkdir($index_dir,0777,true); //确保控制器的文件夹一定存在
            file_put_contents($index_dir."index.html",$index);

            //>>5.生成列表save.html
            ob_start();
            require $templateDir.'save.tpl';
            $save = ob_get_clean(); //得到controller的代码
            $save_dir = APP_PATH.$module_name."/View/$name/"; //controller的文件夹
            is_dir($save_dir) or mkdir($save_dir,0777,true); //确保控制器的文件夹一定存在
            file_put_contents($save_dir."save.html",$save);
//            dump($table_name);die;

            $this->success('生成成功');exit;
        }
        $this->display();
    }
    private function table2name($table_name){ //it_brand
        $prefix = C('DB_PREFIX');  //获取数据表上的前缀
        $table_name = substr($table_name,strlen($prefix)); //将前缀截取掉
        $arr = str2arr($table_name,"_"); //先拆分   xh_user array(0=>'xh',1=>'user')
//        dump($arr);die;
        $arr = array_map("ucfirst",$arr); //将首字母大写
        return arr2str($arr,''); //再通过''合并   XhUser
    }
}