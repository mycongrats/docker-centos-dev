#### PULL镜像
docker pull mycongrats/centos-dev
#### 启动容器
docker run --name centos-dev --hostname centos-dev -dt mycongrats/centos-dev /usr/sbin/init
#### 登录容器
docker exec -ti centos-dev bash
#### 退出容器
exit
