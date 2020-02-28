FROM centos:7

COPY vim.cnf /root/
COPY solarized.vim /usr/share/vim/vim74/colors/

RUN yum install -y epel-release

RUN yum install -y java java-devel svn git gcc gcc-c++ make python2-pip python-devel which cronie lsof vim zip unzip openssh-server openssh-clients \
    && yum clean all

RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && localedef -c -f UTF-8 -i zh_CN zh_CN.utf8 \
    && cat /root/vim.cnf >> /etc/vimrc \
    && rm -rf /root/vim.cnf \
    && sed -i "$ a export LANG=zh_CN.UTF-8" /etc/bashrc \
    && sed -i '$ a export HISTTIMEFORMAT="%F %T `whoami` "' /etc/bashrc \
    && sed -i '$ a export JAVA_HOME=/etc/alternatives/java_sdk' /etc/bashrc
