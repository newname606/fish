namespace <?php echo $module_name;?>\Model;

use Think\Model;

class <?php echo $name ?>Model extends Model{
//生成自动验证的代码
protected $_validate= array(
<?php  foreach($fileds as $field):
             if($field['key']=='PRI' || $field['null']!='NO'){
                continue;
             }
?>
array('<?php echo $field['field'] ?>','require','<?php $arr =  str2arr($field['comment'],'@'); echo $arr[0];?>不能为空',self::EXISTS_VALIDATE),
<?php endForeach; ?>
);
}