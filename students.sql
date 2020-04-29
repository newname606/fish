/*
Navicat MySQL Data Transfer

Source Server         : students
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : students

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2020-04-24 08:52:19
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `bz_subject`
-- ----------------------------
DROP TABLE IF EXISTS `bz_subject`;
CREATE TABLE `bz_subject` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(50) DEFAULT '' COMMENT '名称',
  `sort_id` int(11) DEFAULT '1' COMMENT '分类编号',
  `class_id` int(11) DEFAULT NULL COMMENT '班级编号',
  `status` int(11) DEFAULT '1' COMMENT '状态@radio|1=是,0=否',
  `create_time` int(11) DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='班主任题目';

-- ----------------------------
-- Records of bz_subject
-- ----------------------------
INSERT INTO `bz_subject` VALUES ('1', '老师一直仪表大方、举止得体吗？', '1', '1', '1', '0');
INSERT INTO `bz_subject` VALUES ('2', '456', '1', '1', '1', '0');
INSERT INTO `bz_subject` VALUES ('3', '123', '1', '1', '1', '0');
INSERT INTO `bz_subject` VALUES ('4', '678', '2', '1', '1', '0');
INSERT INTO `bz_subject` VALUES ('5', '912', '2', '1', '1', '0');
INSERT INTO `bz_subject` VALUES ('6', '345', '2', '1', '1', '0');

-- ----------------------------
-- Table structure for `class`
-- ----------------------------
DROP TABLE IF EXISTS `class`;
CREATE TABLE `class` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '班级编号',
  `name` varchar(10) NOT NULL DEFAULT '' COMMENT '班级名称',
  `teacher_id` varchar(20) DEFAULT NULL COMMENT '教师ID',
  `headmaster_id` varchar(20) DEFAULT NULL COMMENT '班主任ID',
  `status` int(11) DEFAULT '1' COMMENT '状态@radio|1=是,0=否',
  `create_time` int(11) DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='班级表';

-- ----------------------------
-- Records of class
-- ----------------------------
INSERT INTO `class` VALUES ('1', '17三年软件二班', '1', '1', '1', '0');
INSERT INTO `class` VALUES ('2', '17三年软件三班', '2', '2', '1', '0');
INSERT INTO `class` VALUES ('3', '17三年软件四班', '1', '2', '1', '0');
INSERT INTO `class` VALUES ('4', '17三年软件五班', '2', '1', '1', '0');

-- ----------------------------
-- Table structure for `dept`
-- ----------------------------
DROP TABLE IF EXISTS `dept`;
CREATE TABLE `dept` (
  `id` int(2) NOT NULL AUTO_INCREMENT COMMENT '部门编号',
  `name` varchar(20) NOT NULL DEFAULT '' COMMENT '部门名称',
  `status` int(11) DEFAULT '1' COMMENT '状态@radio|1=是,0=否',
  `create_time` int(11) DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='部门表';

-- ----------------------------
-- Records of dept
-- ----------------------------
INSERT INTO `dept` VALUES ('1', '教务处', '1', '1574041313');
INSERT INTO `dept` VALUES ('2', '学生处', '1', '1574041321');
INSERT INTO `dept` VALUES ('3', '食堂', '1', '1574218380');

-- ----------------------------
-- Table structure for `fraction`
-- ----------------------------
DROP TABLE IF EXISTS `fraction`;
CREATE TABLE `fraction` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `sort_id` smallint(6) NOT NULL DEFAULT '1' COMMENT '分类编号',
  `t_id` smallint(6) NOT NULL DEFAULT '1' COMMENT '题目编号',
  `class_id` int(11) NOT NULL DEFAULT '1' COMMENT '班级编号',
  `headmaster_id` int(11) NOT NULL DEFAULT '1' COMMENT '班主任编号',
  `point` smallint(6) NOT NULL DEFAULT '0' COMMENT '总分',
  `number` smallint(6) NOT NULL DEFAULT '1' COMMENT '人数',
  `create_time` int(11) DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COMMENT='学生满意度汇总';

-- ----------------------------
-- Records of fraction
-- ----------------------------
INSERT INTO `fraction` VALUES ('1', '1', '1', '2', '2', '130', '2', '1577412226');
INSERT INTO `fraction` VALUES ('2', '1', '2', '2', '2', '110', '2', '1577412226');
INSERT INTO `fraction` VALUES ('3', '1', '3', '2', '2', '120', '2', '1577412226');
INSERT INTO `fraction` VALUES ('4', '2', '1', '2', '2', '110', '2', '1577412226');
INSERT INTO `fraction` VALUES ('5', '2', '2', '2', '2', '100', '2', '1577412226');
INSERT INTO `fraction` VALUES ('6', '2', '3', '2', '2', '110', '2', '1577412226');
INSERT INTO `fraction` VALUES ('7', '1', '1', '1', '1', '80', '3', '1577412261');
INSERT INTO `fraction` VALUES ('8', '1', '2', '1', '1', '40', '3', '1577412261');
INSERT INTO `fraction` VALUES ('9', '1', '3', '1', '1', '60', '3', '1577412261');
INSERT INTO `fraction` VALUES ('10', '2', '1', '1', '1', '90', '3', '1577412261');
INSERT INTO `fraction` VALUES ('11', '2', '2', '1', '1', '80', '3', '1577412261');
INSERT INTO `fraction` VALUES ('12', '2', '3', '1', '1', '50', '3', '1577412261');
INSERT INTO `fraction` VALUES ('13', '1', '1', '4', '1', '90', '2', '1577412284');
INSERT INTO `fraction` VALUES ('14', '1', '2', '4', '1', '80', '2', '1577412284');
INSERT INTO `fraction` VALUES ('15', '1', '3', '4', '1', '100', '2', '1577412284');
INSERT INTO `fraction` VALUES ('16', '2', '1', '4', '1', '90', '2', '1577412284');
INSERT INTO `fraction` VALUES ('17', '2', '2', '4', '1', '70', '2', '1577412284');
INSERT INTO `fraction` VALUES ('18', '2', '3', '4', '1', '80', '2', '1577412284');
INSERT INTO `fraction` VALUES ('19', '1', '1', '3', '2', '30', '1', '1577412308');
INSERT INTO `fraction` VALUES ('20', '1', '2', '3', '2', '30', '1', '1577412308');
INSERT INTO `fraction` VALUES ('21', '1', '3', '3', '2', '30', '1', '1577412308');
INSERT INTO `fraction` VALUES ('22', '2', '1', '3', '2', '20', '1', '1577412308');
INSERT INTO `fraction` VALUES ('23', '2', '2', '3', '2', '20', '1', '1577412308');
INSERT INTO `fraction` VALUES ('24', '2', '3', '3', '2', '30', '1', '1577412308');

-- ----------------------------
-- Table structure for `headmaster`
-- ----------------------------
DROP TABLE IF EXISTS `headmaster`;
CREATE TABLE `headmaster` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(10) NOT NULL DEFAULT '' COMMENT '名称',
  `position` int(11) DEFAULT '0' COMMENT '状态@radio|1=班主任,0=任课老师',
  `status` int(11) DEFAULT '1' COMMENT '状态@radio|1=是,0=否',
  `create_time` int(11) DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='班主任';

-- ----------------------------
-- Records of headmaster
-- ----------------------------
INSERT INTO `headmaster` VALUES ('1', '李隆斌', '1', '1', '1579930524');
INSERT INTO `headmaster` VALUES ('2', '王智', '1', '1', '1577235719');

-- ----------------------------
-- Table structure for `idea`
-- ----------------------------
DROP TABLE IF EXISTS `idea`;
CREATE TABLE `idea` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(50) DEFAULT '' COMMENT '名称',
  `sort_id` int(11) DEFAULT '1' COMMENT '分类编号',
  `class_id` int(11) NOT NULL DEFAULT '1' COMMENT '班级编号',
  `headmaster_id` int(11) NOT NULL DEFAULT '1' COMMENT '班主任编号',
  `create_time` int(11) DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COMMENT='学生满意度意见汇总';

-- ----------------------------
-- Records of idea
-- ----------------------------
INSERT INTO `idea` VALUES ('1', 'good', '1', '2', '2', '0');
INSERT INTO `idea` VALUES ('2', 'good job', '2', '2', '2', '0');
INSERT INTO `idea` VALUES ('3', 'good job 哦', '1', '2', '2', '0');
INSERT INTO `idea` VALUES ('4', 'good job 啊', '2', '2', '2', '0');
INSERT INTO `idea` VALUES ('5', '1', '1', '1', '1', '0');
INSERT INTO `idea` VALUES ('6', '2', '2', '1', '1', '0');
INSERT INTO `idea` VALUES ('7', '3', '1', '1', '1', '0');
INSERT INTO `idea` VALUES ('8', '4', '2', '1', '1', '0');
INSERT INTO `idea` VALUES ('9', '1', '1', '4', '1', '0');
INSERT INTO `idea` VALUES ('10', '2', '2', '4', '1', '0');
INSERT INTO `idea` VALUES ('11', '3', '1', '4', '1', '0');
INSERT INTO `idea` VALUES ('12', '4', '2', '4', '1', '0');
INSERT INTO `idea` VALUES ('13', '1', '1', '3', '2', '0');
INSERT INTO `idea` VALUES ('14', '2', '2', '3', '2', '0');
INSERT INTO `idea` VALUES ('15', '', '1', '1', '1', '1578122250');
INSERT INTO `idea` VALUES ('16', '', '2', '1', '1', '1578122250');

-- ----------------------------
-- Table structure for `intro`
-- ----------------------------
DROP TABLE IF EXISTS `intro`;
CREATE TABLE `intro` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `t_id` int(11) DEFAULT '1' COMMENT '题目编号',
  `class_id` int(11) NOT NULL DEFAULT '1' COMMENT '班级编号',
  `teacher_id` int(11) NOT NULL DEFAULT '1' COMMENT '教师编号',
  `point` smallint(6) DEFAULT '0' COMMENT '分数',
  `number` smallint(6) DEFAULT '1' COMMENT '人数',
  `create_time` int(11) DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COMMENT='教师满意度分数汇总';

-- ----------------------------
-- Records of intro
-- ----------------------------
INSERT INTO `intro` VALUES ('1', '1', '4', '2', '140', '3', '1577407733');
INSERT INTO `intro` VALUES ('2', '2', '4', '2', '130', '3', '1577407733');
INSERT INTO `intro` VALUES ('3', '3', '4', '2', '120', '3', '1577407733');
INSERT INTO `intro` VALUES ('4', '4', '4', '2', '90', '3', '1577407733');
INSERT INTO `intro` VALUES ('5', '5', '4', '2', '90', '3', '1577407733');
INSERT INTO `intro` VALUES ('6', '1', '2', '2', '240', '6', '1577407863');
INSERT INTO `intro` VALUES ('7', '2', '2', '2', '230', '6', '1577407863');
INSERT INTO `intro` VALUES ('8', '3', '2', '2', '200', '6', '1577407863');
INSERT INTO `intro` VALUES ('9', '4', '2', '2', '180', '6', '1577407863');
INSERT INTO `intro` VALUES ('10', '5', '2', '2', '180', '6', '1577407863');
INSERT INTO `intro` VALUES ('11', '1', '1', '1', '340', '5', '1577407903');
INSERT INTO `intro` VALUES ('12', '2', '1', '1', '240', '5', '1577407903');
INSERT INTO `intro` VALUES ('13', '3', '1', '1', '160', '5', '1577407903');
INSERT INTO `intro` VALUES ('14', '4', '1', '1', '180', '5', '1577407903');
INSERT INTO `intro` VALUES ('15', '5', '1', '1', '190', '5', '1577407903');
INSERT INTO `intro` VALUES ('16', '1', '3', '1', '70', '1', '1577407933');
INSERT INTO `intro` VALUES ('17', '2', '3', '1', '50', '1', '1577407933');
INSERT INTO `intro` VALUES ('18', '3', '3', '1', '40', '1', '1577407933');
INSERT INTO `intro` VALUES ('19', '4', '3', '1', '40', '1', '1577407933');
INSERT INTO `intro` VALUES ('20', '5', '3', '1', '50', '1', '1577407933');

-- ----------------------------
-- Table structure for `menu`
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(20) DEFAULT '' COMMENT '名称',
  `nav_id` int(11) NOT NULL DEFAULT '0' COMMENT '导航',
  `controller_name` varchar(50) DEFAULT NULL COMMENT '控制器名',
  `path` varchar(50) NOT NULL DEFAULT '' COMMENT '地址',
  `status` int(11) DEFAULT '1' COMMENT '状态@radio|1=是,0=否',
  `create_time` int(11) DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COMMENT='菜单';

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES ('1', '调查管理', '1', null, 'Survey/index', '1', '1574649694');
INSERT INTO `menu` VALUES ('2', '部门管理', '1', null, 'Dept/index', '1', '0');
INSERT INTO `menu` VALUES ('3', '教师管理', '1', null, 'Teacher/index', '1', '0');
INSERT INTO `menu` VALUES ('4', '班级管理', '1', null, 'Class/index', '1', '0');
INSERT INTO `menu` VALUES ('5', '专业管理', '1', null, 'Profession/index', '1', '0');
INSERT INTO `menu` VALUES ('15', '学生满意度汇总', '0', null, 'Fraction/index', '1', '1577412603');
INSERT INTO `menu` VALUES ('16', '学生满意度汇总', '2', null, 'Fraction/index', '1', '1577412887');
INSERT INTO `menu` VALUES ('8', '导航管理', '3', null, 'Nav/index', '1', '0');
INSERT INTO `menu` VALUES ('9', '角色管理', '3', null, 'Role/index', '1', '0');
INSERT INTO `menu` VALUES ('10', '菜单管理', '3', null, 'Menu/index', '1', '0');
INSERT INTO `menu` VALUES ('11', '用户管理', '3', null, 'User/index', '1', '1575272325');
INSERT INTO `menu` VALUES ('12', '班主任管理', '1', null, 'Headmaster/index', '1', '0');
INSERT INTO `menu` VALUES ('13', '教师满意度汇总', '2', null, 'Intro/index', '1', '0');

-- ----------------------------
-- Table structure for `nav`
-- ----------------------------
DROP TABLE IF EXISTS `nav`;
CREATE TABLE `nav` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(20) DEFAULT '' COMMENT '名称',
  `status` int(11) DEFAULT '1' COMMENT '状态@radio|1=是,0=否',
  `create_time` int(11) DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='导航';

-- ----------------------------
-- Records of nav
-- ----------------------------
INSERT INTO `nav` VALUES ('1', '分类管理', '1', '1574648858');
INSERT INTO `nav` VALUES ('2', '题目管理', '1', '1574648865');
INSERT INTO `nav` VALUES ('3', '权限管理', '1', '1574648872');

-- ----------------------------
-- Table structure for `opinion`
-- ----------------------------
DROP TABLE IF EXISTS `opinion`;
CREATE TABLE `opinion` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(50) DEFAULT '' COMMENT '名称',
  `class_id` int(11) NOT NULL DEFAULT '1' COMMENT '班级编号',
  `teacher_id` int(11) NOT NULL DEFAULT '1' COMMENT '教师编号',
  `create_time` int(11) DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='教师满意度意见汇总';

-- ----------------------------
-- Records of opinion
-- ----------------------------
INSERT INTO `opinion` VALUES ('1', '1234', '4', '2', '1577407733');
INSERT INTO `opinion` VALUES ('2', '4321', '4', '2', '1577407768');
INSERT INTO `opinion` VALUES ('3', 'ggg', '4', '2', '1577407835');
INSERT INTO `opinion` VALUES ('4', '去去去', '2', '2', '1577407863');
INSERT INTO `opinion` VALUES ('5', '5555', '2', '2', '1577407876');
INSERT INTO `opinion` VALUES ('6', '555555', '1', '1', '1577407903');
INSERT INTO `opinion` VALUES ('7', '555555', '1', '1', '1577407907');
INSERT INTO `opinion` VALUES ('8', '不不不', '3', '1', '1577407933');
INSERT INTO `opinion` VALUES ('9', '没有', '2', '2', '1577412322');
INSERT INTO `opinion` VALUES ('10', '没有意见', '2', '2', '1577412329');
INSERT INTO `opinion` VALUES ('11', '很好', '1', '1', '1577412346');
INSERT INTO `opinion` VALUES ('12', '很好的啊', '1', '1', '1577412355');
INSERT INTO `opinion` VALUES ('13', '678', '2', '2', '1577948001');
INSERT INTO `opinion` VALUES ('14', '12345', '1', '1', '1577958773');
INSERT INTO `opinion` VALUES ('15', '123', '2', '2', '1578124558');

-- ----------------------------
-- Table structure for `profession`
-- ----------------------------
DROP TABLE IF EXISTS `profession`;
CREATE TABLE `profession` (
  `id` int(2) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(20) DEFAULT '' COMMENT '名称',
  `teacher_id` int(11) DEFAULT '0' COMMENT '教师名称',
  `status` int(11) DEFAULT '1' COMMENT '状态@radio|1=是,0=否',
  `create_time` int(11) DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='专业表';

-- ----------------------------
-- Records of profession
-- ----------------------------
INSERT INTO `profession` VALUES ('1', '软件组', '1', '1', '0');
INSERT INTO `profession` VALUES ('2', '搬砖组', '0', '0', '1574220763');

-- ----------------------------
-- Table structure for `role`
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(100) DEFAULT '' COMMENT '名称',
  `menu_id` varchar(100) NOT NULL DEFAULT '0' COMMENT '菜单ID',
  `status` int(11) DEFAULT '1' COMMENT '状态@radio|1=是,0=否',
  `create_time` int(11) DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='角色';

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('1', '普通用户', '1,2,3,4,5,6,7', '1', '1575273329');
INSERT INTO `role` VALUES ('2', '管理员', '1,2,3,4,5,15,16,8,9,10,11,12,13', '1', '1577412902');

-- ----------------------------
-- Table structure for `sort`
-- ----------------------------
DROP TABLE IF EXISTS `sort`;
CREATE TABLE `sort` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(20) DEFAULT '' COMMENT '名称',
  `status` int(11) DEFAULT '1' COMMENT '状态@radio|1=是,0=否',
  `create_time` int(11) DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='分类';

-- ----------------------------
-- Records of sort
-- ----------------------------
INSERT INTO `sort` VALUES ('1', '食堂', '1', '0');
INSERT INTO `sort` VALUES ('2', '超市', '1', '0');
INSERT INTO `sort` VALUES ('3', '寝室', '1', '0');

-- ----------------------------
-- Table structure for `survey`
-- ----------------------------
DROP TABLE IF EXISTS `survey`;
CREATE TABLE `survey` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(10) NOT NULL DEFAULT '' COMMENT '名称',
  `status` int(11) DEFAULT '1' COMMENT '状态@radio|1=是,0=否',
  `create_time` int(11) DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='分类表';

-- ----------------------------
-- Records of survey
-- ----------------------------
INSERT INTO `survey` VALUES ('1', '学生满意度', '1', '1574041294');
INSERT INTO `survey` VALUES ('2', '教师满意度', '1', '1574041302');

-- ----------------------------
-- Table structure for `tc_subject`
-- ----------------------------
DROP TABLE IF EXISTS `tc_subject`;
CREATE TABLE `tc_subject` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(50) DEFAULT '' COMMENT '名称',
  `teacher_id` int(11) DEFAULT '1' COMMENT '教师编号',
  `status` int(11) DEFAULT '1' COMMENT '状态@radio|1=是,0=否',
  `create_time` int(11) DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='教师题目';

-- ----------------------------
-- Records of tc_subject
-- ----------------------------
INSERT INTO `tc_subject` VALUES ('1', '老师一直仪表大方、举止得体吗？', '1', '1', '0');
INSERT INTO `tc_subject` VALUES ('2', '老师上课时声音洪亮、运用普通话吗？', '1', '1', '0');
INSERT INTO `tc_subject` VALUES ('3', '老师在上课期间对课堂纪律是否严格管理?', '1', '1', '0');
INSERT INTO `tc_subject` VALUES ('4', '老师从未有过迟到、早退或推迟下课现象吗？', '1', '1', '0');
INSERT INTO `tc_subject` VALUES ('5', '老师上课从不接听手机吗?', '1', '1', '0');

-- ----------------------------
-- Table structure for `teacher`
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(10) NOT NULL DEFAULT '' COMMENT '名称',
  `position` int(11) DEFAULT '1' COMMENT '状态@radio|1=班主任,0=任课老师',
  `status` int(11) DEFAULT '1' COMMENT '状态@radio|1=是,0=否',
  `create_time` int(11) DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='教师';

-- ----------------------------
-- Records of teacher
-- ----------------------------
INSERT INTO `teacher` VALUES ('1', '陈雪冬', '1', '1', '1574150084');
INSERT INTO `teacher` VALUES ('2', '樊家岐', '1', '1', '1574218358');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(20) NOT NULL DEFAULT '' COMMENT '名称',
  `role_id` int(11) NOT NULL DEFAULT '0' COMMENT '角色',
  `password` varchar(20) DEFAULT '' COMMENT '密码',
  `status` int(11) DEFAULT '1' COMMENT '状态@radio|1=是,0=否',
  `create_time` int(11) DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='用户';

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('2', '1', '2', '1', '1', '0');
INSERT INTO `user` VALUES ('4', '123', '1', '123', '1', '0');
