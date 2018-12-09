"""myblogs URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/2.0/topics/http/urls/
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
from django.urls import path, re_path
from myblog import views
from myblogs import settings
from django.views.static import serve

urlpatterns = [
    path('admin/', admin.site.urls),
    path('index/', views.index),
    re_path('^(?P<username>\w+)/articles/(?P<article_id>\d+)/$', views.article_detail),
    path('login/', views.login),
    path('logout/', views.logout),
    path('get_validCode_img/', views.get_valid_code_img),
    path('register/', views.register),
    # media
    re_path(r"media/(?P<path>.*)$", serve, {"document_root": settings.MEDIA_ROOT}),
    # 分类
    re_path('^(?P<username>\w+)/(?P<condition>tag|category|archive)/(?P<param>.*)/$', views.sort),
    # 个人站点
    re_path(r"blog/(?P<username>.*)$", views.home),
    path("comment/", views.comment),
    path("digg/", views.digg),
    path("backend/", views.backend),
    re_path("backend/add_article/$", views.add_article),
    re_path('(edit|delete)/(\d+)', views.op_article),
    path('upload/', views.upload)
]
