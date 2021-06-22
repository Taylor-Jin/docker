# 基础镜像
FROM php:8.0-fpm

# 作者
MAINTAINER  JinHuaChao
    
RUN apt-get update \
    # 相关依赖必须手动安装
    && apt-get install -y libfreetype6-dev libjpeg62-turbo-dev libmcrypt-dev libpng-dev \
    # memcached 的相关依赖
    && apt-get install -y libmemcached-dev zlib1g-dev \
    # 安装扩展
    && docker-php-ext-install -j$(nproc) iconv \
    # 如果安装的扩展需要自定义配置时
    # && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    # && docker-php-ext-install -j$(nproc) gd \
    
    # pecl 安卓mcrypt php从7.2开始不再在源码里支持mcrypt扩展而转到pecl方式支持
    #&& pecl install mcrypt-1.0.1 \
    #&& docker-php-ext-enable mcrypt \
    #
    # 其他扩展
    && docker-php-ext-install mysqli \
    && docker-php-ext-install pdo_mysql \
    && docker-php-ext-install gd \
    # pecl安装php的memcached扩展
    && pecl install memcached \
    # 启用memcached 扩展
    && docker-php-ext-enable memcached \

    # pecl 安装php的redis扩展
    && pecl install redis \
    # 启用redis扩展
    && docker-php-ext-enable redis

#数据卷挂载
VOLUME ['/usr/local/etc/php']

EXPOSE 9000   


