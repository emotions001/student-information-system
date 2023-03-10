# Generated by Django 4.1.2 on 2022-12-03 11:53

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('api', '0002_teacherinfo'),
    ]

    operations = [
        migrations.CreateModel(
            name='Major',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('major_code', models.CharField(max_length=64, verbose_name='专业代码')),
                ('major_name', models.CharField(max_length=255, verbose_name='专业名')),
                ('major_depart', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.SET_NULL, to='api.department', verbose_name='专业院系')),
            ],
        ),
    ]
