/*
 Navicat Premium Data Transfer

 Source Server         : xp
 Source Server Type    : MySQL
 Source Server Version : 50726
 Source Host           : localhost:3306
 Source Schema         : school

 Target Server Type    : MySQL
 Target Server Version : 50726
 File Encoding         : 65001

 Date: 18/12/2022 21:10:41
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for api_admin
-- ----------------------------
DROP TABLE IF EXISTS `api_admin`;
CREATE TABLE `api_admin`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `passwd` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `admin_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `admin_depart_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `api_admin_admin_depart_id_87a2dac7`(`admin_depart_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of api_admin
-- ----------------------------
INSERT INTO `api_admin` VALUES (1, 'jsjxxxy', '123456', '计算机信息学院', 6);

-- ----------------------------
-- Table structure for api_choicecourse
-- ----------------------------
DROP TABLE IF EXISTS `api_choicecourse`;
CREATE TABLE `api_choicecourse`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `student_number` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `student_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `course_name_id` bigint(20) NULL DEFAULT NULL,
  `student_id_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `api_choicecourse_student_id_id_35a04bd4`(`student_id_id`) USING BTREE,
  INDEX `api_choicecourse_course_name_id_cb9cfb2c`(`course_name_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of api_choicecourse
-- ----------------------------
INSERT INTO `api_choicecourse` VALUES (1, '2000005557', '张三', 2, 1);
INSERT INTO `api_choicecourse` VALUES (6, '2000005557', '张三', 5, 1);
INSERT INTO `api_choicecourse` VALUES (3, '2000005557', '张三', 2, NULL);
INSERT INTO `api_choicecourse` VALUES (4, '2000005557', '张三', 1, NULL);

-- ----------------------------
-- Table structure for api_classinfo
-- ----------------------------
DROP TABLE IF EXISTS `api_classinfo`;
CREATE TABLE `api_classinfo`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `class_id` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `class_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `class_depart_id` bigint(20) NULL DEFAULT NULL,
  `class_major_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `api_classinfo_class_depart_id_1c173f4e`(`class_depart_id`) USING BTREE,
  INDEX `api_classinfo_class_major_id_585a4972`(`class_major_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of api_classinfo
-- ----------------------------
INSERT INTO `api_classinfo` VALUES (1, '1', '网络2031班', 6, 1);
INSERT INTO `api_classinfo` VALUES (2, '2', '网络2032班', 6, 1);

-- ----------------------------
-- Table structure for api_courses
-- ----------------------------
DROP TABLE IF EXISTS `api_courses`;
CREATE TABLE `api_courses`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `course_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `course_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `course_type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `course_credit` decimal(3, 1) NOT NULL,
  `course_major_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `api_courses_course_major_id_a37df39c`(`course_major_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of api_courses
-- ----------------------------
INSERT INTO `api_courses` VALUES (1, 'J1001', '网络基础', '必修', 2.0, 1);
INSERT INTO `api_courses` VALUES (2, 'j1002', 'python', '必修', 2.0, 1);
INSERT INTO `api_courses` VALUES (5, 'j1003', 'mysql', '必修', 2.0, 1);

-- ----------------------------
-- Table structure for api_department
-- ----------------------------
DROP TABLE IF EXISTS `api_department`;
CREATE TABLE `api_department`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `department_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of api_department
-- ----------------------------
INSERT INTO `api_department` VALUES (6, '计算机信息学院');
INSERT INTO `api_department` VALUES (2, '外语学院');
INSERT INTO `api_department` VALUES (3, '冶矿学院');
INSERT INTO `api_department` VALUES (4, '建工学院');
INSERT INTO `api_department` VALUES (5, '马克思主义学院');
INSERT INTO `api_department` VALUES (8, '建工学院');

-- ----------------------------
-- Table structure for api_major
-- ----------------------------
DROP TABLE IF EXISTS `api_major`;
CREATE TABLE `api_major`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `major_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `major_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `major_depart_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `api_major_major_depart_id_2d71078d`(`major_depart_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of api_major
-- ----------------------------
INSERT INTO `api_major` VALUES (1, 'J-001', '计算机网络技术', 6);
INSERT INTO `api_major` VALUES (2, 'j-002', '网络安全技术', 6);
INSERT INTO `api_major` VALUES (10, 'j--003', '物联网技术', 6);
INSERT INTO `api_major` VALUES (8, 'w-001', '商业英语', 2);
INSERT INTO `api_major` VALUES (9, 'y-001', '冶矿专业', 3);

-- ----------------------------
-- Table structure for api_root
-- ----------------------------
DROP TABLE IF EXISTS `api_root`;
CREATE TABLE `api_root`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `passwd` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of api_root
-- ----------------------------
INSERT INTO `api_root` VALUES (1, 'root', '33086f47fe94a90167a31416097d9848');

-- ----------------------------
-- Table structure for api_studentinfo
-- ----------------------------
DROP TABLE IF EXISTS `api_studentinfo`;
CREATE TABLE `api_studentinfo`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `student_number` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `student_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `student_gender` smallint(6) NOT NULL,
  `student_birth` date NOT NULL,
  `student_scores` decimal(5, 2) NULL DEFAULT NULL,
  `student_class_id` bigint(20) NULL DEFAULT NULL,
  `student_depart_id` bigint(20) NULL DEFAULT NULL,
  `student_major_id` bigint(20) NULL DEFAULT NULL,
  `login_passwd` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `api_studentinfo_student_number_e329da80_uniq`(`student_number`) USING BTREE,
  INDEX `api_studentinfo_student_class_id_c6656c1f`(`student_class_id`) USING BTREE,
  INDEX `api_studentinfo_student_depart_id_889d27dd`(`student_depart_id`) USING BTREE,
  INDEX `api_studentinfo_student_major_id_ca9349bd`(`student_major_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of api_studentinfo
-- ----------------------------
INSERT INTO `api_studentinfo` VALUES (1, '2000005557', '张三', 1, '2000-08-10', 150.00, 1, 6, 1, 'f959837bf071864d20a5f0bf1d0822e3');
INSERT INTO `api_studentinfo` VALUES (2, '2000005558', '李四', 1, '2000-11-11', 100.00, 1, 6, 1, 'f959837bf071864d20a5f0bf1d0822e3');
INSERT INTO `api_studentinfo` VALUES (5, '2000005538', '赵一', 1, '2000-02-05', NULL, 1, 6, 1, 'f959837bf071864d20a5f0bf1d0822e3');
INSERT INTO `api_studentinfo` VALUES (7, '2000005551', '王五', 1, '2000-01-02', NULL, 1, 6, 1, 'f959837bf071864d20a5f0bf1d0822e3');
INSERT INTO `api_studentinfo` VALUES (8, '2000001114', '狗腾讯', 1, '2000-01-01', NULL, 1, 6, 1, 'f959837bf071864d20a5f0bf1d0822e3');
INSERT INTO `api_studentinfo` VALUES (11, '2000002221', '一一', 1, '2020-05-10', NULL, 1, 6, 1, 'f959837bf071864d20a5f0bf1d0822e3');
INSERT INTO `api_studentinfo` VALUES (10, '111145444', '卷神', 1, '2020-05-02', NULL, 1, 6, 1, 'f959837bf071864d20a5f0bf1d0822e3');

-- ----------------------------
-- Table structure for api_teacherinfo
-- ----------------------------
DROP TABLE IF EXISTS `api_teacherinfo`;
CREATE TABLE `api_teacherinfo`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `teacher_number` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `teacher_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `teacher_gender` smallint(6) NOT NULL,
  `teacher_age` int(11) NOT NULL,
  `teacher_birth` date NOT NULL,
  `teacher_phone` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `teacher_depart_id` bigint(20) NULL DEFAULT NULL,
  `login_passwd` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `api_teacherinfo_teacher_number_cb486923_uniq`(`teacher_number`) USING BTREE,
  INDEX `api_teacherinfo_teacher_depart_id_80809b57`(`teacher_depart_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of api_teacherinfo
-- ----------------------------
INSERT INTO `api_teacherinfo` VALUES (1, '123456', '小黄', 1, 28, '1995-02-01', '18687270679', 6, 'f959837bf071864d20a5f0bf1d0822e3');
INSERT INTO `api_teacherinfo` VALUES (3, '12345698745', '杰哥', 1, 28, '2000-01-03', '18584587542', 6, 'f959837bf071864d20a5f0bf1d0822e3');
INSERT INTO `api_teacherinfo` VALUES (4, '55555555', '一二', 1, 26, '2020-01-02', '18652549631', 6, 'f959837bf071864d20a5f0bf1d0822e3');

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_group
-- ----------------------------

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_group_permissions_group_id_permission_id_0cd325b0_uniq`(`group_id`, `permission_id`) USING BTREE,
  INDEX `auth_group_permissions_group_id_b120cbf9`(`group_id`) USING BTREE,
  INDEX `auth_group_permissions_permission_id_84c5c92e`(`permission_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of auth_group_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_permission_content_type_id_codename_01ab375a_uniq`(`content_type_id`, `codename`) USING BTREE,
  INDEX `auth_permission_content_type_id_2f476e4b`(`content_type_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 69 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES (1, 'Can add log entry', 1, 'add_logentry');
INSERT INTO `auth_permission` VALUES (2, 'Can change log entry', 1, 'change_logentry');
INSERT INTO `auth_permission` VALUES (3, 'Can delete log entry', 1, 'delete_logentry');
INSERT INTO `auth_permission` VALUES (4, 'Can view log entry', 1, 'view_logentry');
INSERT INTO `auth_permission` VALUES (5, 'Can add permission', 2, 'add_permission');
INSERT INTO `auth_permission` VALUES (6, 'Can change permission', 2, 'change_permission');
INSERT INTO `auth_permission` VALUES (7, 'Can delete permission', 2, 'delete_permission');
INSERT INTO `auth_permission` VALUES (8, 'Can view permission', 2, 'view_permission');
INSERT INTO `auth_permission` VALUES (9, 'Can add group', 3, 'add_group');
INSERT INTO `auth_permission` VALUES (10, 'Can change group', 3, 'change_group');
INSERT INTO `auth_permission` VALUES (11, 'Can delete group', 3, 'delete_group');
INSERT INTO `auth_permission` VALUES (12, 'Can view group', 3, 'view_group');
INSERT INTO `auth_permission` VALUES (13, 'Can add user', 4, 'add_user');
INSERT INTO `auth_permission` VALUES (14, 'Can change user', 4, 'change_user');
INSERT INTO `auth_permission` VALUES (15, 'Can delete user', 4, 'delete_user');
INSERT INTO `auth_permission` VALUES (16, 'Can view user', 4, 'view_user');
INSERT INTO `auth_permission` VALUES (17, 'Can add content type', 5, 'add_contenttype');
INSERT INTO `auth_permission` VALUES (18, 'Can change content type', 5, 'change_contenttype');
INSERT INTO `auth_permission` VALUES (19, 'Can delete content type', 5, 'delete_contenttype');
INSERT INTO `auth_permission` VALUES (20, 'Can view content type', 5, 'view_contenttype');
INSERT INTO `auth_permission` VALUES (21, 'Can add session', 6, 'add_session');
INSERT INTO `auth_permission` VALUES (22, 'Can change session', 6, 'change_session');
INSERT INTO `auth_permission` VALUES (23, 'Can delete session', 6, 'delete_session');
INSERT INTO `auth_permission` VALUES (24, 'Can view session', 6, 'view_session');
INSERT INTO `auth_permission` VALUES (25, 'Can add root', 7, 'add_root');
INSERT INTO `auth_permission` VALUES (26, 'Can change root', 7, 'change_root');
INSERT INTO `auth_permission` VALUES (27, 'Can delete root', 7, 'delete_root');
INSERT INTO `auth_permission` VALUES (28, 'Can view root', 7, 'view_root');
INSERT INTO `auth_permission` VALUES (29, 'Can add department', 8, 'add_department');
INSERT INTO `auth_permission` VALUES (30, 'Can change department', 8, 'change_department');
INSERT INTO `auth_permission` VALUES (31, 'Can delete department', 8, 'delete_department');
INSERT INTO `auth_permission` VALUES (32, 'Can view department', 8, 'view_department');
INSERT INTO `auth_permission` VALUES (33, 'Can add admin', 9, 'add_admin');
INSERT INTO `auth_permission` VALUES (34, 'Can change admin', 9, 'change_admin');
INSERT INTO `auth_permission` VALUES (35, 'Can delete admin', 9, 'delete_admin');
INSERT INTO `auth_permission` VALUES (36, 'Can view admin', 9, 'view_admin');
INSERT INTO `auth_permission` VALUES (37, 'Can add teacher info', 10, 'add_teacherinfo');
INSERT INTO `auth_permission` VALUES (38, 'Can change teacher info', 10, 'change_teacherinfo');
INSERT INTO `auth_permission` VALUES (39, 'Can delete teacher info', 10, 'delete_teacherinfo');
INSERT INTO `auth_permission` VALUES (40, 'Can view teacher info', 10, 'view_teacherinfo');
INSERT INTO `auth_permission` VALUES (41, 'Can add major', 11, 'add_major');
INSERT INTO `auth_permission` VALUES (42, 'Can change major', 11, 'change_major');
INSERT INTO `auth_permission` VALUES (43, 'Can delete major', 11, 'delete_major');
INSERT INTO `auth_permission` VALUES (44, 'Can view major', 11, 'view_major');
INSERT INTO `auth_permission` VALUES (45, 'Can add courses', 12, 'add_courses');
INSERT INTO `auth_permission` VALUES (46, 'Can change courses', 12, 'change_courses');
INSERT INTO `auth_permission` VALUES (47, 'Can delete courses', 12, 'delete_courses');
INSERT INTO `auth_permission` VALUES (48, 'Can view courses', 12, 'view_courses');
INSERT INTO `auth_permission` VALUES (49, 'Can add class info', 13, 'add_classinfo');
INSERT INTO `auth_permission` VALUES (50, 'Can change class info', 13, 'change_classinfo');
INSERT INTO `auth_permission` VALUES (51, 'Can delete class info', 13, 'delete_classinfo');
INSERT INTO `auth_permission` VALUES (52, 'Can view class info', 13, 'view_classinfo');
INSERT INTO `auth_permission` VALUES (53, 'Can add student info', 14, 'add_studentinfo');
INSERT INTO `auth_permission` VALUES (54, 'Can change student info', 14, 'change_studentinfo');
INSERT INTO `auth_permission` VALUES (55, 'Can delete student info', 14, 'delete_studentinfo');
INSERT INTO `auth_permission` VALUES (56, 'Can view student info', 14, 'view_studentinfo');
INSERT INTO `auth_permission` VALUES (57, 'Can add teacher login', 15, 'add_teacherlogin');
INSERT INTO `auth_permission` VALUES (58, 'Can change teacher login', 15, 'change_teacherlogin');
INSERT INTO `auth_permission` VALUES (59, 'Can delete teacher login', 15, 'delete_teacherlogin');
INSERT INTO `auth_permission` VALUES (60, 'Can view teacher login', 15, 'view_teacherlogin');
INSERT INTO `auth_permission` VALUES (61, 'Can add student login', 16, 'add_studentlogin');
INSERT INTO `auth_permission` VALUES (62, 'Can change student login', 16, 'change_studentlogin');
INSERT INTO `auth_permission` VALUES (63, 'Can delete student login', 16, 'delete_studentlogin');
INSERT INTO `auth_permission` VALUES (64, 'Can view student login', 16, 'view_studentlogin');
INSERT INTO `auth_permission` VALUES (65, 'Can add choice course', 17, 'add_choicecourse');
INSERT INTO `auth_permission` VALUES (66, 'Can change choice course', 17, 'change_choicecourse');
INSERT INTO `auth_permission` VALUES (67, 'Can delete choice course', 17, 'delete_choicecourse');
INSERT INTO `auth_permission` VALUES (68, 'Can view choice course', 17, 'view_choicecourse');

-- ----------------------------
-- Table structure for auth_user
-- ----------------------------
DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `last_login` datetime(6) NULL DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `first_name` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `last_name` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email` varchar(254) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_user
-- ----------------------------

-- ----------------------------
-- Table structure for auth_user_groups
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE `auth_user_groups`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_user_groups_user_id_group_id_94350c0c_uniq`(`user_id`, `group_id`) USING BTREE,
  INDEX `auth_user_groups_user_id_6a12ed8b`(`user_id`) USING BTREE,
  INDEX `auth_user_groups_group_id_97559544`(`group_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of auth_user_groups
-- ----------------------------

-- ----------------------------
-- Table structure for auth_user_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE `auth_user_user_permissions`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq`(`user_id`, `permission_id`) USING BTREE,
  INDEX `auth_user_user_permissions_user_id_a95ead1b`(`user_id`) USING BTREE,
  INDEX `auth_user_user_permissions_permission_id_1fbb5f2c`(`permission_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of auth_user_user_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `object_repr` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content_type_id` int(11) NULL DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `django_admin_log_content_type_id_c4bce8eb`(`content_type_id`) USING BTREE,
  INDEX `django_admin_log_user_id_c564eba6`(`user_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `model` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `django_content_type_app_label_model_76bd3d3b_uniq`(`app_label`, `model`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 18 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES (1, 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES (2, 'auth', 'permission');
INSERT INTO `django_content_type` VALUES (3, 'auth', 'group');
INSERT INTO `django_content_type` VALUES (4, 'auth', 'user');
INSERT INTO `django_content_type` VALUES (5, 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES (6, 'sessions', 'session');
INSERT INTO `django_content_type` VALUES (7, 'api', 'root');
INSERT INTO `django_content_type` VALUES (8, 'api', 'department');
INSERT INTO `django_content_type` VALUES (9, 'api', 'admin');
INSERT INTO `django_content_type` VALUES (10, 'api', 'teacherinfo');
INSERT INTO `django_content_type` VALUES (11, 'api', 'major');
INSERT INTO `django_content_type` VALUES (12, 'api', 'courses');
INSERT INTO `django_content_type` VALUES (13, 'api', 'classinfo');
INSERT INTO `django_content_type` VALUES (14, 'api', 'studentinfo');
INSERT INTO `django_content_type` VALUES (15, 'api', 'teacherlogin');
INSERT INTO `django_content_type` VALUES (16, 'api', 'studentlogin');
INSERT INTO `django_content_type` VALUES (17, 'api', 'choicecourse');

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 37 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES (1, 'contenttypes', '0001_initial', '2022-12-03 11:35:28.079313');
INSERT INTO `django_migrations` VALUES (2, 'auth', '0001_initial', '2022-12-03 11:35:28.286553');
INSERT INTO `django_migrations` VALUES (3, 'admin', '0001_initial', '2022-12-03 11:35:28.330862');
INSERT INTO `django_migrations` VALUES (4, 'admin', '0002_logentry_remove_auto_add', '2022-12-03 11:35:28.337857');
INSERT INTO `django_migrations` VALUES (5, 'admin', '0003_logentry_add_action_flag_choices', '2022-12-03 11:35:28.346853');
INSERT INTO `django_migrations` VALUES (6, 'contenttypes', '0002_remove_content_type_name', '2022-12-03 11:35:28.375109');
INSERT INTO `django_migrations` VALUES (7, 'auth', '0002_alter_permission_name_max_length', '2022-12-03 11:35:28.389990');
INSERT INTO `django_migrations` VALUES (8, 'auth', '0003_alter_user_email_max_length', '2022-12-03 11:35:28.407039');
INSERT INTO `django_migrations` VALUES (9, 'auth', '0004_alter_user_username_opts', '2022-12-03 11:35:28.415029');
INSERT INTO `django_migrations` VALUES (10, 'auth', '0005_alter_user_last_login_null', '2022-12-03 11:35:28.429811');
INSERT INTO `django_migrations` VALUES (11, 'auth', '0006_require_contenttypes_0002', '2022-12-03 11:35:28.431793');
INSERT INTO `django_migrations` VALUES (12, 'auth', '0007_alter_validators_add_error_messages', '2022-12-03 11:35:28.436806');
INSERT INTO `django_migrations` VALUES (13, 'auth', '0008_alter_user_username_max_length', '2022-12-03 11:35:28.451782');
INSERT INTO `django_migrations` VALUES (14, 'auth', '0009_alter_user_last_name_max_length', '2022-12-03 11:35:28.465829');
INSERT INTO `django_migrations` VALUES (15, 'auth', '0010_alter_group_name_max_length', '2022-12-03 11:35:28.484820');
INSERT INTO `django_migrations` VALUES (16, 'auth', '0011_update_proxy_permissions', '2022-12-03 11:35:28.493816');
INSERT INTO `django_migrations` VALUES (17, 'auth', '0012_alter_user_first_name_max_length', '2022-12-03 11:35:28.512806');
INSERT INTO `django_migrations` VALUES (18, 'sessions', '0001_initial', '2022-12-03 11:35:28.529507');
INSERT INTO `django_migrations` VALUES (19, 'api', '0001_initial', '2022-12-03 11:52:05.166745');
INSERT INTO `django_migrations` VALUES (20, 'api', '0002_teacherinfo', '2022-12-03 11:52:33.268515');
INSERT INTO `django_migrations` VALUES (21, 'api', '0003_major', '2022-12-03 11:53:30.994068');
INSERT INTO `django_migrations` VALUES (22, 'api', '0004_courses', '2022-12-03 11:53:54.117878');
INSERT INTO `django_migrations` VALUES (23, 'api', '0005_classinfo', '2022-12-03 11:54:11.172075');
INSERT INTO `django_migrations` VALUES (24, 'api', '0006_studentinfo', '2022-12-03 11:54:29.993827');
INSERT INTO `django_migrations` VALUES (25, 'api', '0007_alter_studentinfo_student_number_and_more', '2022-12-03 12:12:20.738884');
INSERT INTO `django_migrations` VALUES (26, 'api', '0008_alter_studentinfo_student_number', '2022-12-03 12:12:20.826504');
INSERT INTO `django_migrations` VALUES (27, 'api', '0009_remove_teacherlogin_login_username_and_more', '2022-12-03 12:32:10.190595');
INSERT INTO `django_migrations` VALUES (28, 'api', '0010_remove_studentinfo_login_passwd_and_more', '2022-12-04 05:29:05.988007');
INSERT INTO `django_migrations` VALUES (29, 'api', '0011_alter_studentinfo_student_scores', '2022-12-04 07:14:50.275038');
INSERT INTO `django_migrations` VALUES (30, 'api', '0012_remove_teacherlogin_login_username_and_more', '2022-12-07 06:05:51.917167');
INSERT INTO `django_migrations` VALUES (31, 'api', '0013_alter_courses_course_type', '2022-12-10 15:25:58.013964');
INSERT INTO `django_migrations` VALUES (32, 'api', '0014_alter_courses_course_type', '2022-12-10 15:40:17.146782');
INSERT INTO `django_migrations` VALUES (33, 'api', '0015_alter_classinfo_class_id_alter_courses_course_name_and_more', '2022-12-14 13:01:20.033377');
INSERT INTO `django_migrations` VALUES (34, 'api', '0016_choicecourse_student_id', '2022-12-14 16:40:47.029339');
INSERT INTO `django_migrations` VALUES (35, 'api', '0017_alter_choicecourse_course_name', '2022-12-14 16:40:47.760619');
INSERT INTO `django_migrations` VALUES (36, 'api', '0018_alter_choicecourse_course_name_and_more', '2022-12-14 18:34:41.798065');

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session`  (
  `session_key` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `session_data` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`) USING BTREE,
  INDEX `django_session_expire_date_a5c62663`(`expire_date`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_session
-- ----------------------------
INSERT INTO `django_session` VALUES ('agnzrxq74k0s8tyx0rrpsnddhlh4vywr', 'eyJpbWFnZV9jb2RlIjoiWlJXWk8iLCJfc2Vzc2lvbl9leHBpcnkiOjYwfQ:1p4HHT:RoKVaOG6mrNErK09l7vFLSgfg6rC-q7-CE_lD_H_j9g', '2022-12-11 08:02:51.606750');
INSERT INTO `django_session` VALUES ('cx7z15nctez90h3ewesrb0z73tbao90v', 'eyJpbWFnZV9jb2RlIjoiUkZDVEgiLCJfc2Vzc2lvbl9leHBpcnkiOjYwfQ:1p4HNf:ljBIWREPvUziPbOGGV3ke9PikXGUqTs4IHtrlnKG7cg', '2022-12-11 08:09:15.005669');
INSERT INTO `django_session` VALUES ('ift9295uylesy4mmlix1e92zuvjf2p1c', 'eyJpbWFnZV9jb2RlIjoiUllBV1AiLCJfc2Vzc2lvbl9leHBpcnkiOjYwfQ:1p4HQc:Kkp6fZKZrsi75P_DHN6O4YjmJOWzddvVPfweH3xAP8k', '2022-12-11 08:12:18.773891');
INSERT INTO `django_session` VALUES ('mzmqeuw45f1qu8yj3pis3bdjweeevz5z', 'eyJpbWFnZV9jb2RlIjoiQVJJSFgiLCJfc2Vzc2lvbl9leHBpcnkiOjYwLCJpbmZvIjp7ImlkIjoxLCJuYW1lIjoicm9vdCJ9fQ:1p5Hoj:zXwkGDtHPyp4pTODCzl40oK3uWU-__n3XfNhPOL55Pw', '2022-12-14 02:49:21.538303');
INSERT INTO `django_session` VALUES ('qcstu2rl2zq5foau0dnbwucm0tot1r7j', 'eyJpbWFnZV9jb2RlIjoiWFNDT0wiLCJfc2Vzc2lvbl9leHBpcnkiOjYwfQ:1p5Hq9:fmnxXESs-WcHmNLJGOUjR6zXyuYzHvuyFlDtmXP9RqQ', '2022-12-14 02:50:49.181669');
INSERT INTO `django_session` VALUES ('innsaw4u1s9ymrbqdqrel90kruns6hgd', 'eyJpbWFnZV9jb2RlIjoiRUdIUUkiLCJfc2Vzc2lvbl9leHBpcnkiOjYwfQ:1p5HsD:DLgqjF65tQNw4o2MDk5xVcWxMq5vuOBtQ9Grqt2IgMw', '2022-12-14 02:52:57.238955');
INSERT INTO `django_session` VALUES ('qcb2b6jyxb72rzvwf37vw2t9mxlvnj2d', 'eyJpbWFnZV9jb2RlIjoiSlpGUUYiLCJfc2Vzc2lvbl9leHBpcnkiOjYwfQ:1p5HtP:OUXsaF8gqRA4jKNwEvxk9ixZWea5KjtdYl26WOABdDw', '2022-12-14 02:54:11.682616');
INSERT INTO `django_session` VALUES ('g0cvlqd7d2wi08nwr8y4qs3v2j9ewlkb', 'eyJpbWFnZV9jb2RlIjoiQkVTR0giLCJfc2Vzc2lvbl9leHBpcnkiOjYwfQ:1p5Hzl:Z8zTCqAtlVIimP5Nj3PS21jUJAv-0mTbTJBVEX_ZOlE', '2022-12-14 03:00:45.563838');
INSERT INTO `django_session` VALUES ('daepgyy1lq6zgz67b5uwe4o57rkuropo', 'eyJpbWFnZV9jb2RlIjoiUUJHWkciLCJfc2Vzc2lvbl9leHBpcnkiOjYwfQ:1p5I2h:UMwjav2FGg-u-4I932DSHEgWNnS_SwysKR5Vgt2Isnc', '2022-12-14 03:03:47.175079');
INSERT INTO `django_session` VALUES ('9cssv4gb6047c2x02qhvsjya3pgb9thf', 'eyJpbWFnZV9jb2RlIjoiWUtDWVIiLCJfc2Vzc2lvbl9leHBpcnkiOjYwfQ:1p5IKx:qI7C85e8172qESJP2sxOt3PfMScUNI4WAStKHH-gIYo', '2022-12-14 03:22:39.928434');
INSERT INTO `django_session` VALUES ('cghx5f67bbcbetr6wgnc2uzwgch5u9rf', 'eyJpbWFnZV9jb2RlIjoiT01DSlEiLCJfc2Vzc2lvbl9leHBpcnkiOjYwfQ:1p5IUM:HecZa6am6SOtMbo2i6dhJRt9PY-VwYpYBpSKCLXgtvM', '2022-12-14 03:32:22.114414');
INSERT INTO `django_session` VALUES ('392sbtzt50lkcb5cswd1xcblmwslv3zn', 'eyJpbWFnZV9jb2RlIjoiU1lDWEYiLCJfc2Vzc2lvbl9leHBpcnkiOjYwfQ:1p5Kxa:aAiNk0YrgINdWfu1s54orbH0P5aAtDO_6powwth4_bc', '2022-12-14 06:10:42.887371');
INSERT INTO `django_session` VALUES ('8pqdeswmk4rhfm0up1bbkselafmt4vjv', 'eyJpbWFnZV9jb2RlIjoiR0ZaV04iLCJfc2Vzc2lvbl9leHBpcnkiOjYwfQ:1p5KyC:aTpSd1KNwP3cIiEPn_sdqgP9cZevUjIvtp2LZiQfRBk', '2022-12-14 06:11:20.861802');
INSERT INTO `django_session` VALUES ('fdomgt64efrjoa7ndt4946ai4grwjys5', 'eyJpbWFnZV9jb2RlIjoiQkRZS0UiLCJfc2Vzc2lvbl9leHBpcnkiOjYwNDgwMCwiaW5mbyI6eyJpZCI6MSwibmFtZSI6Ilx1NWMwZlx1OWVjNCJ9fQ:1p5LxN:W8CRnN1E19yv93zkNOWW1v29j6QzWY9aISzbcmi9kJA', '2022-12-21 07:13:33.824257');
INSERT INTO `django_session` VALUES ('q27kmez6akf55hxa65lj7dke9l7lr105', 'eyJpbWFnZV9jb2RlIjoiWklVRUUiLCJfc2Vzc2lvbl9leHBpcnkiOjYwfQ:1p5Xfv:PzzWKNxBGWK7mTZ8SOTaVhcLwX_84ExpEe6SZPz2tws', '2022-12-14 19:45:19.381446');
INSERT INTO `django_session` VALUES ('7q6v797y5w3qlnkcbt9it2si6b48vg7u', 'eyJpbWFnZV9jb2RlIjoiTEFTUVIiLCJfc2Vzc2lvbl9leHBpcnkiOjYwNDgwMCwiaW5mbyI6eyJpZCI6MSwibmFtZSI6Ilx1NWYyMFx1NGUwOSJ9fQ:1p5dT4:A-a-54_UZwzA8rbhE3jtosVQFeQjeXvDgXzwE1oMc-M', '2022-12-22 01:55:26.279883');

SET FOREIGN_KEY_CHECKS = 1;
