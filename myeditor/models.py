# -*- coding: utf-8 -*-
from django.db import models
from django.contrib.auth.models import User, Group
import django.utils.timezone as timezone
from django.contrib import admin
from mdeditor.fields import MDTextField  
#顶部导航栏数据
class Topnav(models.Model):
    name = models.CharField(max_length=60,unique=True,verbose_name='导航栏名称')
    lang_name = models.CharField(blank=True,max_length=60,verbose_name='课程名称')
    url=models.CharField(max_length=60,default='#',verbose_name='导航url')
    detail = models.CharField(blank=True,max_length=360,verbose_name='细节说明')
    img = models.ImageField(blank=True,upload_to='assetinfo/',verbose_name='首页图片')
    def __str__(self):
        return self.name

#文章:
class Article(models.Model):
    title = models.CharField(max_length=160,unique=True,verbose_name='文章标题')
    #content = models.TextField(max_length=50000,blank=True,verbose_name='文章内容')
    content = MDTextField(verbose_name='文章内容') 
    programa = models.ForeignKey(Topnav,blank=True,on_delete=models.CASCADE,related_name='art_programa') #分类
    create_time = models.DateTimeField(null=True, blank=True, verbose_name='发布日期')
    read = models.IntegerField(default=0, verbose_name='阅读量')
    order_number = models.DecimalField( max_digits=4, decimal_places=2,default='0.0')
    # 文章正文
    #body = MDTextField()  #修改这个类型
    #def __unicode__(self):#python2使用__unicode__,python3使用__str__
    def __str__(self):
        return self.title
class ArticleAdmin(admin.ModelAdmin):
    list_display = ['title', 'content', 'create_time', 'programa', 'read','order_number']
    ordering = ('-order_number',)
admin.site.register(Article, ArticleAdmin)
admin.site.register(Topnav)
#admin.site.register(Article)
