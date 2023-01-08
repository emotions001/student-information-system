"""student_system URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/4.1/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path
from api.views import root, student, teacher, depart, major, course, classes, account, index, home

urlpatterns = [
    # 首页与登录
    path('index/', index.index),
    path('login-root/', account.login_root),
    path('login-teacher/', account.login_teacher),
    path('login-stu/', account.login_stu),
    path('logout/', account.logout),
    path('image/code/', account.image_code),

    # 教师相关操作
    path('teacher/index/', home.teacher_index),
    path('t-student/list/', home.student_list),
    path('t-student/<int:sid>/detailes/', home.student_detailes),
    path('t-student/add/', home.student_add),
    path('t-student/<int:sid>/delete/', home.student_delete),
    path('t-teacher/<int:tid>/self/', home.teacher_self),
    path('t-teacher/<int:tid>/reset/', home.teacher_reset),


    # 学生相关操作
    path('student/index/', home.student_index),
    path('student/<int:sid>/self/', home.student_self),
    # 选课
    path('student/<int:sid>/courselist/', home.student_courselist),
    path('student/<int:sid>/courseadd/', home.student_courseadd),
    path('student/<int:sid>/coursedel/', home.student_coursedel),
    path('student/<int:tid>/reset/', home.student_reset),

    # 学生管理
    path('student/list/', student.student_list),
    path('student/<int:sid>/detailes/', student.student_detailes),
    path('student/add/', student.student_add),
    path('student/<int:sid>/delete/', student.student_delete),

    # 教师管理
    path('teacher/list/', teacher.teacher_list),
    path('teacher/<int:tid>/detailes/', teacher.teacher_detailes),
    path('teacher/add/', teacher.teacher_add),
    path('teacher/<int:tid>/delete/', teacher.teacher_delete),

    # 院系管理 1
    path('depart/list/', depart.depart_list),
    path('depart/add/', depart.depart_add),
    path('depart/<int:did>/delete/', depart.depart_delete),
    path('depart/<int:did>/edit/', depart.depart_edit),

    # 1.1 专业管理
    path('major/<int:mid>/list/', major.major_list),
    path('major/<int:mid>/add/', major.major_add),
    path('major/<int:mid>/edit/', major.major_edit),
    path('major/<int:mid>/delete/', major.major_delete),

    # 1.2 课程管理
    path('course/<int:cid>/list/', course.course_list),
    path('course/<int:cid>/add/', course.course_add),
    path('course/<int:cid>/edit/', course.course_edit),
    path('course/<int:cid>/delete/', course.course_delete),

    # 1.3 班级管理
    path('class/<int:sid>/list/', classes.classes_info),
    path('class/<int:sid>/add/', classes.classes_add),
    path('class/<int:sid>/edit/', classes.classes_edit),
    path('class/<int:sid>/delete/', classes.classes_delete),
]
