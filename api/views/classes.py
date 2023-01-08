from django.shortcuts import render, HttpResponse, redirect
from django import forms
from django.core.exceptions import ValidationError
from django.core.validators import RegexValidator

from api import models
from api.utils.pagination import Pagination
from api.utils.bootstrap import BootStrapModelForm
from api.utils.bootstrap import BootStrapForm
from api.utils.encrypt import md5
###############################################
class ClassesModelForm(BootStrapModelForm):
    class Meta:
        model = models.ClassInfo
        fields = ["class_id","class_depart","class_major","class_name"]

###############################################
def classes_info(request, sid):
    # depart_object = models.Department.objects.filter(id=mid)
    # major_object = models.Major.objects.filter(major_depart=mid)
    # course_object = models.Courses.objects.all()
    classes_object = models.ClassInfo.objects.filter(class_depart=sid)

    context = {
        #"depart_object": depart_object,
        "classes_object": classes_object,
        "sid": sid,
        #"course_object": course_object
    }
    print(classes_object)
    return render(request, 'classes/classes_list.html', context)


def classes_add(request, sid):
    title = "添加班级"
    if request.method == "GET":
        form = ClassesModelForm
        return render(request, 'student_change.html', {'form': form, "title": title})
    form = ClassesModelForm(data=request.POST)
    if form.is_valid():
        form.save()
        return redirect('/class/%d/list/' %sid)
    return render(request, 'student_change.html', {'form': form, "title": title})


def classes_edit(request, sid):
    title = "编辑班级信息"
    qid = request.GET.get('code')
    row_object = models.ClassInfo.objects.filter(id=qid).first()
    # 填充默认数据
    if request.method == 'GET':
        form = ClassesModelForm(instance=row_object)
        return render(request, 'student_change.html', {'form': form, "title": title})
    # 修改信息
    form = ClassesModelForm(data=request.POST, instance=row_object)
    if form.is_valid():
        form.save()
        return redirect('/class/%d/list/' %sid)
    return render(request, 'student_change.html', {'form': form, "title": title})

def classes_delete(request, sid):
    qid = request.GET.get('code')
    row_object = models.ClassInfo.objects.filter(id=qid).delete()
    return redirect('/class/%d/list/' %sid)

