# web版 ssh 连接服务器，支持 ipv6
> 整理自 `https://github.com/huashengdun/webssh` 项目

## 成功测试环境
> python 3.9.2
> 
> paramiko 3.4.0
> 
> tornado 6.4.1

## 把项目下载到本地并进入目录
```
apt install -y git && \
git clone https://github.com/wenyamu/webssh.git /root/webssh && \
cd /root/webssh && \
bash docker-ce.sh
```

# docker 部署
> `docker network ls` # 查看所有网络
> 
> `docker network rm my_network` # 删除某个网络
> 
> `docker network inspect my_network` # 查看网络信息
## 方式一：
```
# 创建镜像
docker build -t webssh:tag .

# 创建容器( --network host 这是关键，容器与宿主机共享网格，支持 ipv6 的 ssh 连接就是这里)
docker run -itd --network host --name ws -p 8888:8888 webssh:tag
```
## 方式二：
> docker compose 创建镜像和创建容器一条命令即可
```
docker compose up -d
```
## 放行端口
```
iptables -I INPUT -p tcp --dport 8888 -j ACCEPT
ip6tables -I INPUT -p tcp --dport 8888 -j ACCEPT
```
## 访问
```
http://0.0.0.0:8888
```
