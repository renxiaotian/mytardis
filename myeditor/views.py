# -*- coding: utf-8 -*-
#from django.contrib.auth.models import User
from django.shortcuts import render, get_object_or_404
from django.http import HttpResponse
from django.http import HttpResponseRedirect
from django.shortcuts import render
#from django.contrib import auth
#from django.contrib.auth.decorators import login_required
#from django.contrib.auth import authenticate
#from django.contrib.auth import  login as Lg
from django.http import JsonResponse
import json, markdown
from django.core.files.uploadedfile import InMemoryUploadedFile
from myeditor.models import Topnav,Article
from mistletoe import Document, HTMLRenderer




def index(req):
    topclass=Topnav.objects.all()
    return render(req,'index.html',locals())

def wiki(req,*args):
    if len(args)  == 2:
        #art_id= int(art_id)
        url=args[0]
        art_id=args[1]
        topclasses=Topnav.objects.all()
        topclass=Topnav.objects.get(url=url)
        articles=topclass.art_programa.all().order_by('order_number')
        print(art_id)
        #def_art=Article.objects.filter(__contains=)
        def_art=Article.objects.get(id = art_id)    
        def_art.read+=1
        def_art.save()
        md=markdown.Markdown(extensions=[
        'markdown.extensions.extra',
        'markdown.extensions.codehilite',#语法高亮拓展
        'markdown.extensions.toc',#自动生成目录
        #'markdown.extensions.tables'
        ])#修改blog.content内容为html
        def_art.content = md.convert(def_art.content)

        # mdcontent=def_art.content
        # def_art.content = md.convert(def_art.content)
        # print(def_art.content)
        # print("#########################################################")
        # with HTMLRenderer() as renderer:
        #     def_art.content = renderer.render(Document(mdcontent))
        # print(def_art.content)

        #取上一章节，下一章节
        pre=''
        net=''
        i=0

        num=len(articles)
        if num == 1:   
            pre = ''
            net = ''
        else:
            for art in articles:
                
                if art.id == def_art.id:
                    if i-1 < 0:
                        pre=''
                        net=articles[1]
                    elif i+1 >num-1:
                        pre=articles[i-1]
                        net=''
                    else:
                        pre=articles[i-1]
                        net=articles[i+1]
                i+=1
        #context = {'topclasses':topclasses,'articles':articles,'def_art':def_art, 'toc':md.toc }
        return render(req,'page.html',locals())
    else:      
        url=args[0]
        topclasses=Topnav.objects.all()
        topclass=Topnav.objects.get(url=url)
        articles=topclass.art_programa.all().order_by('order_number')
        def_art=articles[0]
        md=markdown.Markdown(extensions=[
        'markdown.extensions.extra',
        'markdown.extensions.codehilite',#语法高亮拓展
        'markdown.extensions.toc',#自动生成目录
        #'markdown.extensions.tables'
        ])#修改blog.content内容为html
        def_art.content = md.convert(def_art.content)
        # mdcontent=def_art.content
        # def_art.content = md.convert(def_art.content)
        # with HTMLRenderer() as renderer:

        #     def_art.content = renderer.render(Document(mdcontent))

                #取上一章节，下一章节
        pre=''
        net=''
        i=0

        num=len(articles)
        if num == 1:   
            pre = ''
            net = ''
        else:
            for art in articles:
                if art.id == def_art.id:
                    if i-1 < 0:
                        pre=''
                        net=articles[1]
                    elif i+1 >num-1:
                        pre=articles[i-1]
                        net=''
                    else:
                        pre=articles[i-1]
                        net=articles[i+1]
                i+=1
        return render(req,'page.html',locals())