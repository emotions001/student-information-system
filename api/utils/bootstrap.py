# -*- coding:utf-8 -*-
# @FileName  :BootStrap.py
# @Time      :2022/11/30 下午 9:00
# @Author    :VIVA
from django import forms

class bootstrap:
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        # 循环ModelForm中的所有字段，给每个字段的插件设置
        for name, field in self.fields.items():
            # 字段中有属性，保留原来的属性，没有属性，才增加。
            if field.widget.attrs:
                field.widget.attrs["class"] = "form-control"
                field.widget.attrs["placeholder"] = field.label
            else:
                field.widget.attrs = {
                    "class": "form-control",
                    "placeholder": field.label
                }


class BootStrapModelForm(bootstrap, forms.ModelForm):
    pass

class BootStrapForm(bootstrap, forms.Form):
    pass
