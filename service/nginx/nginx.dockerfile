#基础镜像
FROM nginx

#作者
MAINTAINER  JinHuaChao

#数据卷挂载
VOLUME ['/var/www','./conf.d']

#暴露端口号
EXPOSE 80
