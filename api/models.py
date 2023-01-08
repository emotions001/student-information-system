from django.db import models

# Create your models here.

# 超级管理员表：
class Root(models.Model):
    username = models.CharField(verbose_name="用户名", max_length=32)
    passwd = models.CharField(verbose_name="密码", max_length=64)

# 学院系表：
class Department(models.Model):
    department_name = models.CharField(verbose_name="院系名称", max_length=64)
    def __str__(self):
        return self.department_name

# 管理员表: 登录名,登录密码,姓名,所属院系
class Admin(models.Model):
    username = models.CharField(verbose_name="登录名", max_length=32)
    passwd = models.CharField(verbose_name="登录密码", max_length=64)
    admin_name = models.CharField(verbose_name="姓名", max_length=32)
    admin_depart = models.ForeignKey(verbose_name="所属院系", to="Department", to_field="id", null=True, blank=True, on_delete=models.SET_NULL)

# 教师表：职工号，院系，姓名，性别，年龄,出生年月，联系电话
class TeacherInfo(models.Model):
    gender_choices = (
        (1, "男"),
        (2, "女"),
    )
    teacher_number = models.CharField(verbose_name="教职工号", unique=True, max_length=64)
    login_passwd = models.CharField(verbose_name="登录密码", max_length=64)
    teacher_depart = models.ForeignKey(verbose_name="所属院系", to="Department", to_field="id", null=True, blank=True, on_delete=models.SET_NULL)
    teacher_name = models.CharField(verbose_name="教师姓名", max_length=32,)
    teacher_gender = models.SmallIntegerField(verbose_name="性别", choices=gender_choices)
    teacher_age = models.IntegerField(verbose_name="年龄")
    teacher_birth = models.DateField(verbose_name="出生年月")
    teacher_phone = models.CharField(verbose_name="联系电话", max_length=64)

# 专业表：专业代码,专业名称,院系
class Major(models.Model):
    major_code = models.CharField(verbose_name="专业代码", max_length=64)
    major_name = models.CharField(verbose_name="专业名", max_length=255)
    major_depart = models.ForeignKey(verbose_name="专业院系", to="Department", to_field="id", null=True, blank=True, on_delete=models.SET_NULL)
    def __str__(self):
        return self.major_name

# 课程表：课程代码，所属专业，课程名称，学分
class Courses(models.Model):
    course_code = models.CharField(verbose_name="课程代码", max_length=64)
    course_major = models.ForeignKey(verbose_name="所属专业", to="Major", to_field="id", null=True, blank=True, on_delete=models.SET_NULL)
    course_name = models.CharField(verbose_name="课程名字",  max_length=255)
    def __str__(self):
        return self.course_name
    course_type = models.CharField(verbose_name="是否必修", max_length=20)
    course_credit = models.DecimalField(verbose_name="学分", max_digits=3, decimal_places=1)


# 班级表： 所属院系，所属专业，班级ID，班级名称
class ClassInfo(models.Model):
    class_id = models.CharField(verbose_name="班级ID", max_length=60)
    class_depart = models.ForeignKey(verbose_name="所属院系", to="Department", to_field="id", null=True, blank=True, on_delete=models.SET_NULL)
    class_major = models.ForeignKey(verbose_name="所属专业", to="Major", to_field="id", null=True, blank=True, on_delete=models.SET_NULL)
    class_name = models.CharField(verbose_name="班级名称", max_length=255)
    def __str__(self):
        return self.class_name

# 学生表：所属院系,所属专业,学号,姓名,性别,出生年月,班级
class StudentInfo(models.Model):
    student_depart = models.ForeignKey(verbose_name="所属院系", to="Department", to_field="id", null=True, blank=True, on_delete=models.SET_NULL)
    student_major = models.ForeignKey(verbose_name="所属专业", to="Major", to_field="id", null=True, blank=True, on_delete=models.SET_NULL)
    student_number = models.CharField(verbose_name="学号", unique=True, max_length=64)
    login_passwd = models.CharField(verbose_name="登录密码", max_length=64)
    student_name = models.CharField(verbose_name="姓名", max_length=64)
    gender_choices = (
        (1, "男"),
        (2, "女"),
    )
    student_gender = models.SmallIntegerField(verbose_name="性别", choices=gender_choices)
    student_birth = models.DateField(verbose_name="出生年月")
    student_class = models.ForeignKey(verbose_name="所属班级", to="ClassInfo", to_field="id", null=True, blank=True, on_delete=models.SET_NULL)
    student_scores = models.DecimalField(verbose_name="学生总成绩", max_digits=5, decimal_places=2, null=True, blank=True)

class ChoiceCourse(models.Model):
    student_id = models.ForeignKey(verbose_name="id", to="StudentInfo", to_field="id", null=True, blank=True, on_delete=models.SET_NULL)
    student_number = models.CharField(verbose_name="学号", max_length=64)
    student_name = models.CharField(verbose_name="姓名", max_length=64)
    course_name = models.ForeignKey(verbose_name="课程名称", to="Courses", to_field="id", null=True, blank=True, on_delete=models.SET_NULL)
# # 教师登录信息表
# class TeacherLogin(models.Model):
#     login_username = models.ForeignKey(verbose_name="登录名", to="TeacherInfo", to_field="teacher_number", on_delete=models.CASCADE)
#
# #    teacher_name = models.ForeignKey(verbose_name="教师姓名", to="TeacherInfo", to_field="teacher_name", on_delete=models.CASCADE)
#
# # 学生登录信息表:
# class StudentLogin(models.Model):
#     login_username = models.ForeignKey(verbose_name="登录名", to="StudentInfo", to_field="student_number", on_delete=models.CASCADE)
#
# #    student_name = models.ForeignKey(verbose_name="学生姓名", to="StudentInfo", to_field="student_name", on_delete=models.CASCADE)
