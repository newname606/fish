<extend name="Public:BaseSave"/>
<block name="content">
    <form method="post" action="{:U('<?php echo $name;  ?>/save')}" enctype="multipart/form-data">
        <table cellspacing="1" cellpadding="3" width="100%">
            <?php foreach($fileds as $field):
            if($field['field']=='id'|| $field['field']=='create_time') continue;
        ?>
            <tr>
                <td class="label"><?php $arr =  str2arr($field['comment'],'@'); echo $arr[0];?></td>
                <td>
                    <?php
                    if(strpos($field['comment'],'radio')!==false):  //处理radio
                        $str =   substr(strstr($field['comment'],'|'),1); //截取出|后面的内容
                        $arr = str2arr($str);
                        foreach($arr as $ar):
                            $ar = str2arr($ar,'=');
                ?>
                    <label>
                        <input type="radio" {$<?php echo $field['field'] ?> ? 'checked="checked"' : ''}
                               style="height:15px;width: 20px" name="<?php echo $field['field'] ?>"
                               value="<?php echo $ar[0]; ?>"/>
                        <?php echo $ar[1]; ?>
                    </label>
                    <?php endForeach; ?>
                    <?php elseif(strpos($field['comment'],'textarea')!==false):  //处理textarea   ?>
                    <textarea name="<?php echo $field['field'] ?>" cols="60"
                              rows="4">{$<?php echo $field['field'] ?>}</textarea>
                    <?php      else:  ?>
                    <input type="text" name="<?php echo $field['field'] ?>" maxlength="60"
                           value="{$<?php echo $field['field'] ?>}"/>
                    <?php endif;   ?>
                    <span class="require-field">*</span>
                </td>
            </tr>

            <?php endForeach; ?>

            <tr>
                <td colspan="2" align="center"><br/>
                    <input type="hidden" name="id" value="{$id}">
                    <input type="submit" class="button" value=" 确定 "/>
                    <input type="reset" class="button" value=" 重置 "/>
                </td>
            </tr>
        </table>
    </form>
</block>
