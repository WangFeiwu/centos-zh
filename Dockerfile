FROM centos:7
MAINTAINER WFW
ENV UPDATED_AT 2020-06-03

RUN rm -rf /etc/yum.repos.d/*.repo

ADD http://mirrors.aliyun.com/repo/Centos-7.repo /etc/yum.repos.d/

RUN yum clean all -y && \
    yum makecache -y && \
    yum update -y && \
    yum -y install kde-l10n-Chinese && \
    yum reinstall -y glibc-common && \
    yum clean all && \
    rm -rf /tmp/* && \
    rm -rf /var/cache/yum/* && \
    ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

ENV LANG=zh_CN.UTF-8 \
    LANGUAGE=zh_CN:zh \
    LC_ALL=zh_CN.UTF-8
RUN localedef -c -f UTF-8 -i zh_CN zh_CN.UTF-8

CMD ["bash"]