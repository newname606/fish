<extend name="Public:BaseIndex" />
<block name="content">
<tr>
    <?php foreach($fileds as $field):   ?>
    <th><?php $arr =  str2arr($field['comment'],'@'); echo $arr[0];?></th>
    <?php endForeach;  ?>
    <th>操作</th>
</tr>
<volist name="rows" id="row">
    <tr>
        <?php foreach($fileds as $field):
    if($field['field']=='status'):
?>
        <td align="center"><a class="ajax-get" href="{:U('Status',array('id'=>$row['id'],'status'=>$row['status']))}">
                <img src="__ADMIN_IMG__/{$row.status}.gif"/>
            </a></td>
        <?php elseif($field['field']=='create_time'): ?>
        <td align="center">{:date('Y-m-d H:i:s',$row[<?php echo $field['field'] ?>])}</td>
        <?php else: ?>
        <td align="center">{$row.<?php echo $field['field'] ?>}</td>
        <?php endif;?>
        <?php endForeach;  ?>
        <td>
            <a href="{:U('<?php echo $name; ?>/save',array('id'=>$row['id']))}">编辑</a>
            |
            <a class="ajax-get" href="{:U('<?php echo $name; ?>/delete',array('id'=>$row['id']))}">删除</a>
        </td>
    </tr>
</volist>
</block>
