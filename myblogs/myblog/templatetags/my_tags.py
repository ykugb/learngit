#! /usr/bin/env python
# -*- coding: utf-8 -*-
# __author__ = "Q1mi"
# Date: 2018/5/24
from django import template
from myblog import models
from django.utils.safestring import mark_safe
from django.forms.models import model_to_dict
import collections

register = template.Library()


@register.inclusion_tag("panel.html")
def show_panel(username):
    user = models.UserInfo.objects.filter(username=username).first()
    # 拿到当前用户的博客对象
    blog = user.blog
    # 方式一：查询当前站点的文章分类，在前端用连表查询取分类对应的文章数
    # category_list = models.Category.objects.filter(blog=blog)
    # 方式二：利用分组查询出每一个分类以及分类对应的文章数
    from django.db.models import Count
    category_list = models.Category.objects.filter(blog=blog).annotate(c=Count("article")).values("title", "c")
    # 查询当前站点的文章标签
    tag_list = models.Tag.objects.filter(blog=blog).annotate(c=Count("article")).values("title", "c")
    # 按年月归档文章
    archive_list = models.Article.objects.filter(user=user).extra(
        select={"create_ym": "DATE_FORMAT(create_time, '%%Y-%%m')"}
    ).values("create_ym").annotate(c=Count("nid")).values("create_ym", "c")

    return {
        "username": username,
        "category_list": category_list,
        "tag_list": tag_list,
        "archive_list": archive_list
    }





def generate_comment_html(sub_comment_dic, margin_left_val):
    html = '<div class="comment">'
    TEMP1 = """
    <div class='content' style='margin-left:%s;'>
        <span>%s</span>
    """
    for k, v_dic in sub_comment_dic.items():
        # 因为是子评论了，所以需要加上margin_left_val（30）像素的偏移量，子子评论再加margin_left_val（30）的偏移量，以此类推。
        html += TEMP1 % (str(margin_left_val)+'px', k[1])

        # 只要有字典，就递归的往下执行generate_comment_html()函数
        if v_dic:
            html += generate_comment_html(v_dic, margin_left_val)
        html += "</div>"
    html += "</div>"
    return html



def tree_search(d_dic, comment_obj):
    # 在comment_dic中一个一个的寻找其回复的评论
    # 检查当前评论的 reply_id 和 comment_dic中已有评论的nid是否相同，
    # 如果相同，表示就是回复的此信息
    #   如果不同，则需要去 comment_dic 的所有子元素中寻找，一直找，如果一系列中未找，则继续向下找
    # d_dic{
    # (1, '111', None): {
    #   (5, '555', 1): {}
    # }
    # (2, '222', None): {
    #     "(4, '444', 2)": {
    #           "(6, '666', 4),"： {}
    # }
    # }
    # (3, '333', None): {}
    # }
    # comment_obj # (6, '666', 4),
    for k, v_dic in d_dic.items():
        # 如果key值的元组里的第一个元素与传入元组的第三个元素相等，就表示他俩是父子评论，比如(3,111,10)和(5,555,3)，(5,555,3)就是(3,111,10)的子评论
        if k[0] == comment_obj[2]:
            d_dic[k][comment_obj] = collections.OrderedDict()
            return
        else:
            if v_dic:
                # 在当前第一个跟元素中递归的去寻找父亲
                tree_search(d_dic[k], comment_obj)


def build_tree(comment_list):
    # collections.OrderedDict()的作用是创建一个有序空字典{}；之所以要有序，是因为可以做到让评论有序的显示，不然的话，因为字典是无需的，所以取到的评论内容也是无需的，显示起来会有变化。
    comment_dic = collections.OrderedDict()

    for comment_obj in comment_list:
        if comment_obj[2] is None:
            # 如果是根评论（元组的最后一位是None），添加到comment_dic[(1, '111', None)] ＝ {}
            # {
            #     (1, '111', None): {}
            #     (2, '222', None): {}
            #     (3, '333', None): {}
            # }
            comment_dic[comment_obj] = collections.OrderedDict()
        else:
            # (4, '444', 2),
            # 如果是子评论，则需要在 comment_dic 中找到其回复的评论
            tree_search(comment_dic, comment_obj)
    return comment_dic

@register.inclusion_tag("comment-tree.html")
def comment_tree(comment_dict):
    # comment_list里存储的就当是数据库评论表里的条目，格式必须是元组的，因为元组格式可以作为字典的key。
    # comment_list = [
    #     (1, '111', None),
    #     (2, '222', None),
    #     (3, '333', None),
    #     (4, '444', 2),
    #     (5, '555', 1),
    #     (6, '666', 4),
    #     (7, '777', 2),
    #     (8, '888', 4),
    # ]

    comment_dict = comment_dict.values_list('nid','content','parent_comment')
    comment_list = []
    for c in comment_dict:
        comment_list.append((c[0],c[1],c[2]))
    comment_dict = build_tree(comment_list)
    # 经过build_tree处理后，comment_list就变成下面的字典格式了，有子评论的话，子评论就是父评论的key对应的value；如果没有子评论，则该key对应的value就是一个空有序字典。
    # dic = {
    #     "(1     qqq    None)":{
    #         "(2     360    1)": {
    #             "(4     baidu  2)": {}
    #         },
    #         "(3     ali    1)": {}
    #     },
    #     "(5     baidu  None)": {
    #         "(8     baidu  5)": {}
    #     },
    #     "(6     baidu  None)": {
    #         "(7     baidu  6)": {}
    #     }
    # }

    html = '<div class="comment">'
    TEMP1 = """
    <div class='content' style='margin-left:%s;'>
        <span>%s</span>
    """
    for k, v in comment_dict.items():
        # 因为是根评论，所以margin-left应该是0，所以这里传入（0，k[1]），k[1]是评论内容
        html += TEMP1 % (0, k[1])
        # 如果v不为空字典，则执行generate_comment_html()
        if v:
            html += generate_comment_html(v, 30)
        html += "</div>"
    html += '</div>'

    # 将处理好的字典传入前端
    return {'tree_html': html}