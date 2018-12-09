from django.shortcuts import render, redirect, HttpResponse
from myblog import models
from django.contrib import auth
from django.http import JsonResponse
from utils import validCode
from myblog import forms
from django.db import transaction
from django.db.models import F

import json
import os
from bs4 import BeautifulSoup
from django.contrib.auth.decorators import login_required
from myblogs import settings


# Create your views here.
def index(request):
    article_list = models.Article.objects.all()
    return render(request, 'index.html', {'article_list': article_list})


@login_required
def home(request, username):
    user = models.UserInfo.objects.filter(username=username).first()
    # 判断用户是否存在!
    if not user:
        return HttpResponse("404")
    article_list = models.Article.objects.filter(user=user)
    return render(request, 'home.html', {'article_list': article_list})


def article_detail(request, username, article_id):
    user = models.UserInfo.objects.filter(username=username).first()
    blog = user.blog
    article_obj = models.Article.objects.filter(pk=article_id).first()
    # 该文章的所有评论
    comment_list = models.Comment.objects.filter(article_id=article_id)
    return render(request, "article_detail.html", {
        "blog": blog,
        "username": username,
        "article_obj": article_obj,
        "comment_list": comment_list
    })


def login(request):
    """
    登录视图函数:
       get请求响应页面
       post(Ajax)请求响应字典
    :param request:
    :return:
    """

    if request.method == "POST":

        response = {"user": None, "msg": None}
        user = request.POST.get("user")
        pwd = request.POST.get("pwd")
        valid_code = request.POST.get("valid_code")

        valid_code_str = request.session.get("valid_code_str")
        if valid_code.upper() == valid_code_str.upper():
            user = auth.authenticate(username=user, password=pwd)
            if user:
                auth.login(request, user)  # request.user== 当前登录对象
                response["user"] = user.username
            else:
                response["msg"] = "用户名或者密码错误!"

        else:
            response["msg"] = "验证码错误!"

        return JsonResponse(response)

    return render(request, "login.html")


def logout(request):
    auth.logout(request)
    return redirect("/login/")


def get_valid_code_img(request):
    """
    基于PIL模块动态生成响应状态码图片
    :param request:
    :return:
    """
    img_data = validCode.get_valid_code_img(request)

    return HttpResponse(img_data)


# 注册
def register(request):
    if request.method == "POST":
        ret = {"status": 0, "msg": ""}
        valid_code = request.session.get("valid_code_str", "")
        valid_code_user = request.POST.get("valid_code")
        if valid_code.upper() == valid_code_user.upper():
            password = request.POST.get("password")
            re_password = request.POST.get("re_password")
            if password == re_password:
                # 验证码相同
                form_obj = forms.RegForm(request.POST)
                if form_obj.is_valid():
                    # 将头像文件加载
                    username = form_obj.cleaned_data.get("username")
                    password = form_obj.cleaned_data.get("password")
                    phone = form_obj.cleaned_data.get("phone")
                    avatar = request.FILES.get("avatar")
                    blog = models.Blog.objects.create(
                        title=username,
                        theme=username,
                    )
                    user = models.UserInfo.objects.create_user(
                        username=username,
                        password=password,
                        phone=phone,
                        avatar=avatar,
                        blog=blog,
                    )
                    # 登录
                    auth.login(request, user)
                    ret["status"] = 0
                    ret["msg"] = "/index/"
                else:
                    ret["status"] = 1
                    ret["msg"] = form_obj.errors
            else:
                ret["status"] = 1
                ret["msg"] = {"re_password": ["两次密码不一致", ]}
        else:
            ret["status"] = 1
            ret["msg"] = {"valid_code": ["验证码错误", ]}
        return JsonResponse(ret)

    form_obj = forms.RegForm()
    return render(request, "register.html", {"form_obj": form_obj})


def sort(request, username, **kwargs):
    user = models.UserInfo.objects.filter(username=username).first()
    # 判断用户是否存在!
    if not user:
        return HttpResponse("404")
    blog = user.blog
    article_list = models.Article.objects.filter(user=user)
    if kwargs:
        condition = kwargs.get("condition")
        param = kwargs.get("param")  # 2012-12
        if condition == "category":
            article_list = article_list.filter(category__title=param)
        elif condition == "tag":
            article_list = article_list.filter(tags__title=param)
        else:
            year, month = param.split("-")
            article_list = article_list.filter(create_time__year=year, create_time__month=month)
    return render(request, "home.html", {"username": username, "blog": blog, "article_list": article_list, })


def digg(request):
    """
    点赞功能
    :param request:
    :return:
    """
    print(12233)
    article_id = request.POST.get("article_id")
    is_up = json.loads(request.POST.get("is_up"))  # "true"
    # 点赞人即当前登录人
    user_id = request.user.pk
    obj = models.ArticleUpDown.objects.filter(user_id=user_id, article_id=article_id).first()
    response = {"state": True}
    if not obj:
        ard = models.ArticleUpDown.objects.create(user_id=user_id, article_id=article_id, is_up=is_up)

        queryset = models.Article.objects.filter(pk=article_id)
        if is_up:
            queryset.update(up_count=F("up_count") + 1)
        else:
            queryset.update(down_count=F("down_count") + 1)
    else:
        response["state"] = False
        response["handled"] = obj.is_up
    print(JsonResponse(response))
    return JsonResponse(response)


def backend(request):
    """
    后台管理的首页
    :param request:
    :return:
    """
    article_list = models.Article.objects.filter(user=request.user)

    return render(request, "backend/backend.html", locals())


def add_article(request):
    """
    后台管理的添加书籍视图函数
    :param request:
    :return:
    """
    if request.method == "POST":
        title = request.POST.get("title")
        content = request.POST.get("content")
        tag1 = request.POST.getlist("tag")
        category = request.POST.get("category")
        # 防止xss攻击,过滤script标签
        soup = clean_content(content)
        # 构建摘要数据,获取标签字符串的文本前150个符号
        desc = soup.text[0:150] + "..."

        article = models.Article.objects.create(title=title, desc=desc, category_id=category, user=request.user)
        models.ArticleDetail.objects.create(content=str(soup), article=article)
        for tag11 in tag1:
            models.Article2Tag.objects.create(article=article, tag_id=tag11)
        return redirect("/backend/")
    user = request.user
    blog = user.blog
    tags = models.Tag.objects.filter(blog=blog)
    categorys = models.Category.objects.filter(blog=blog)
    return render(request, "backend/add_article.html", {"tags": tags, "categorys": categorys, })


def clean_content(content):
    # 需要对提交的内容做处理，去除掉特殊的标签，防止XSS攻击
    soup = BeautifulSoup(content, 'html.parser')
    for tag in soup.select('script'):
        tag.decompose()
    return soup


# 个人管理后台编辑或删除文章
def op_article(request, op, pk):
    article_obj = models.Article.objects.filter(pk=pk).first()

    if article_obj and op == "delete":
        article_obj.delete()
        return redirect("/backend/")
    elif article_obj and op == "edit":
        article_detail = models.ArticleDetail.objects.filter(article=article_obj).first()
        article_tags = models.Article2Tag.objects.filter(article=article_obj)
        tags_list = []
        for i in article_obj.tags.values_list("nid"):
            tags_list.append(i[0])
        blog = request.user.blog
        tags = models.Tag.objects.filter(blog=blog)
        categorys = models.Category.objects.filter(blog=blog)
        print(tags_list)
        print("=" * 120)
        if request.method == "POST":
            user = request.user
            title = request.POST.get("title")
            content = request.POST.get("content")
            tag1 = request.POST.getlist("tag")
            print(tag1)
            category = request.POST.get("category")
            # 防止xss攻击,过滤script标签
            soup = clean_content(content)
            # 构建摘要数据,获取标签字符串的文本前150个符号
            desc = soup.text[0:150] + "..."

            with transaction.atomic():
                article_obj.title = title
                article_obj.user = user
                article_obj.desc = desc
                article_obj.category_id = category
                article_obj.save()
                article_detail.content = soup.prettify()
                article_detail.save()
                article_tags.delete()
                for tag11 in tag1:
                    models.Article2Tag.objects.create(article=article_obj, tag_id=tag11)

                return redirect("/blog/backend/")
        return render(request, "op_article.html",
                      {"article": article_obj, "article_detail": article_detail, "tags_list": tags_list, "tags": tags,
                       "categorys": categorys, })
    else:
        return HttpResponse("404")


# 评论
def comment(request):
    ret = {"code": 0, "data": ""}
    article_id = request.POST.get("article_id")
    content = request.POST.get("content")
    pid = request.POST.get("pid")
    user_id = request.user.pk
    with transaction.atomic():
        # 根评论
        # 提交子评论
        obj = models.Comment.objects.create(
            user_id=user_id,
            article_id=article_id,
            content=content,
            parent_comment_id=pid
        )
        # 更新文章的评论数
        models.Article.objects.filter(pk=article_id).update(comment_count=F("comment_count") + 1)
        ret["data"] = {
            "pk": obj.pk,
            "time": obj.create_time.strftime("%Y-%m-%d %H:%M"),
            "content": obj.content
        }

    return JsonResponse(ret)


def upload(request):
    img_obj = request.FILES.get("upload_img")
    print(img_obj.name)
    path = os.path.join(settings.MEDIA_ROOT, "add_article_img", img_obj.name)

    with open(path, "wb") as f:
        for line in img_obj:
            f.write(line)

    response = {
        'error': 0,
        'url': '/media/add_article_img/%s' % img_obj.name
    }

    return HttpResponse(json.dumps(response))
