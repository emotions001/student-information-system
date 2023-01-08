from django.shortcuts import render, HttpResponse, redirect
from django import forms

from api import models
from api.utils.code import check_code
from api.utils.bootstrap import BootStrapForm
from api.utils.bootstrap import BootStrapModelForm
from api.utils.encrypt import md5

from io import BytesIO
#########################################
class LoginFormS(BootStrapForm):
    student_number = forms.CharField(
        label="学号",
        widget=forms.TextInput,
        required=True
    )
    login_passwd = forms.CharField(
        label="登录密码",
        widget=forms.PasswordInput(render_value=True),
        required=True
    )

    code = forms.CharField(
        label="验证码",
        widget=forms.TextInput,
        required=True
    )

    def clean_login_passwd(self):
        pwd = self.cleaned_data.get("login_passwd")
        return md5(pwd)
#############
class LoginFormT(BootStrapForm):
    teacher_number = forms.CharField(
        label="教职工号",
        widget=forms.TextInput,
        required=True
    )
    login_passwd = forms.CharField(
        label="登录密码",
        widget=forms.PasswordInput(render_value=True),
        required=True
    )

    code = forms.CharField(
        label="验证码",
        widget=forms.TextInput,
        required=True
    )

    def clean_login_passwd(self):
        pwd = self.cleaned_data.get("login_passwd")
        return md5(pwd)
################
class LoginForm(BootStrapForm):
    username = forms.CharField(
        label="用户名",
        widget=forms.TextInput,
        required=True
    )
    passwd = forms.CharField(
        label="密码",
        widget=forms.PasswordInput(render_value=True),
        required=True
    )
    code = forms.CharField(
        label="验证码",
        widget=forms.TextInput,
        required=True
    )
    def clean_passwd(self):
        pwd = self.cleaned_data.get("passwd")
        return md5(pwd)
#########################################

def login_root(request):
    title = "超级用户"
    """ 登录 """
    if request.method == "GET":
        form = LoginForm()
        return render(request, 'login.html', {'form': form,'title': title})
    form = LoginForm(data=request.POST)
    if form.is_valid():
        # 验证码的校验
        user_input_code = form.cleaned_data.pop('code')
        code = request.session.get('image_code', "")
        if code.upper() != user_input_code.upper():
            form.add_error("code", "验证码错误")
            return render(request, 'login.html', {'form': form, 'title': title})
        # 去数据库校验用户名和密码是否正确，获取用户对象、None
        root_object = models.Root.objects.filter(**form.cleaned_data).first()
        if not root_object:
            form.add_error("passwd", "用户名或密码错误")
            # form.add_error("username", "用户名或密码错误")
            return render(request, 'login.html', {'form': form, 'title': title})
        # 用户名和密码正确
        # 网站生成随机字符串; 写到用户浏览器的cookie中；在写入到session中；
        request.session["info"] = {'id': root_object.id, 'name': root_object.username}
        # session可以保存7天
        request.session.set_expiry(60 * 60 * 24 * 7)
        return redirect("/depart/list/")
    return render(request, 'login.html', {'form': form, 'title': title})


def login_teacher(request):
    title = '教师'
    """ 登录 """
    if request.method == "GET":
        form = LoginFormT()
        return render(request, 'teacher/login.html', {'form': form, 'title': title})

    form = LoginFormT(data=request.POST)
    if form.is_valid():
        # 验证成功，获取到的用户名和密码
        # {'username': 'wupeiqi', 'password': '123',"code":123}
        # {'username': 'wupeiqi', 'password': '5e5c3bad7eb35cba3638e145c830c35f',"code":xxx}

        # 验证码的校验
        user_input_code = form.cleaned_data.pop('code')
        code = request.session.get('image_code', "")
        if code.upper() != user_input_code.upper():
            form.add_error("code", "验证码错误")
            return render(request, 'teacher/login.html', {'form': form, 'title': title})

        # 去数据库校验用户名和密码是否正确，获取用户对象、None
        # admin_object = models.Admin.objects.filter(username=xxx, password=xxx).first()
        teacher_object = models.TeacherInfo.objects.filter(**form.cleaned_data).first()
        if not teacher_object:
            form.add_error("login_passwd", "工号或密码错误")
            # form.add_error("username", "用户名或密码错误")
            return render(request, 'teacher/login.html', {'form': form, 'title': title})

        # 用户名和密码正确
        # 网站生成随机字符串; 写到用户浏览器的cookie中；在写入到session中；
        request.session["info"] = {'id': teacher_object.id, 'name': teacher_object.teacher_name}
        # session可以保存7天
        request.session.set_expiry(60 * 60 * 24 * 7)

        return render(request, 'teacher/index.html')    # 修改

    return render(request, 'teacher/login.html', {'form': form, 'title': title})


def login_stu(request):
    title = '学生'
    """ 登录 """
    if request.method == "GET":
        form = LoginFormS()
        return render(request, 'student/login.html', {'form': form, 'title': title})

    form = LoginFormS(data=request.POST)
    if form.is_valid():
        # 验证成功，获取到的用户名和密码
        # {'username': 'wupeiqi', 'password': '123',"code":123}
        # {'username': 'wupeiqi', 'password': '5e5c3bad7eb35cba3638e145c830c35f',"code":xxx}

        # 验证码的校验
        user_input_code = form.cleaned_data.pop('code')
        code = request.session.get('image_code', "")
        if code.upper() != user_input_code.upper():
            form.add_error("code", "验证码错误")
            return render(request, 'student/login.html', {'form': form, 'title': title})

        # 去数据库校验用户名和密码是否正确，获取用户对象、None
        # admin_object = models.Admin.objects.filter(username=xxx, password=xxx).first()
        student_object = models.StudentInfo.objects.filter(**form.cleaned_data).first()
        if not student_object:
            form.add_error("login_passwd", "学号或密码错误")
            # form.add_error("username", "用户名或密码错误")
            return render(request, 'student/login.html', {'form': form, 'title': title})

        # 用户名和密码正确
        # 网站生成随机字符串; 写到用户浏览器的cookie中；在写入到session中；
        request.session["info"] = {'id': student_object.id, 'name': student_object.student_name}
        # session可以保存7天
        request.session.set_expiry(60 * 60 * 24 * 7)

        return render(request, 'student/index.html')    # 修改

    return render(request, 'student/login.html', {'form': form, 'title': title})


###############################################################3
def image_code(request):
    """ 生成图片验证码 """

    # 调用pillow函数，生成图片
    img, code_string = check_code()

    # 写入到自己的session中（以便于后续获取验证码再进行校验）
    request.session['image_code'] = code_string
    # 给Session设置60s超时
    request.session.set_expiry(60)

    stream = BytesIO()
    img.save(stream, 'png')
    return HttpResponse(stream.getvalue())


def logout(request):
    """ 注销 """

    request.session.clear()

    return redirect('/login/')

