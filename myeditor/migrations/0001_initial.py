# Generated by Django 3.0.1 on 2019-12-26 01:51

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Topnav',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=60, unique=True)),
            ],
        ),
        migrations.CreateModel(
            name='Article',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('title', models.CharField(max_length=160, unique=True, verbose_name='文章标题')),
                ('content', models.TextField(blank=True, max_length=50000, verbose_name='文章内容')),
                ('create_time', models.DateTimeField(blank=True, null=True, verbose_name='发布日期')),
                ('read', models.IntegerField(default=0, verbose_name='阅读量')),
                ('programa', models.ForeignKey(blank=True, on_delete=django.db.models.deletion.CASCADE, to='myeditor.Topnav')),
            ],
        ),
    ]