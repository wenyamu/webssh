# web版 ssh 连接服务器，支持 ipv6
> 整理自 `https://github.com/huashengdun/webssh` 项目

## 把项目下载到本地并进入目录
```
apt install -y git && \
git clone https://github.com/wenyamu/webssh.git /root/webssh && \
cd /root/webssh
```
## 放行端口
```
iptables -I INPUT -p tcp --dport 8888 -j ACCEPT
ip6tables -I INPUT -p tcp --dport 8888 -j ACCEPT
```
## 安装 python3 模块
```
pip install --no-cache-dir paramiko==3.4.0 tornado==6.4.1
# 或者
pip install -r requirements.txt --no-cache-dir
```
## 运行 python3 程序
```
python3 run.py
```
## 访问
```
http://0.0.0.0:8888
```
## 测试环境
```
root@localhost:~# python3 -V
Python 3.9.2

root@localhost:~# pip show paramiko
Name: paramiko
Version: 3.4.0

root@localhost:~# pip show tornado
Name: tornado
Version: 6.4.1
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

# 创建支持 ipv6 的网络名称 ipv6net(这是关键，支持 ipv6 的 ssh 连接就是这里)
docker network create --ipv6 ipv6net

# 创建容器
docker run -itd --network ipv6net --name ws -p 8888:8888 webssh:tag
```
## 方式二：
> docker compose 创建镜像和创建容器一条命令即可
```
docker compose up -d
```
# 注意
> 删除容器时，网络名也要删除，不然下次创建容器时，再次使用这个网络。ssh 连接 ipv6 服务器会失效
```
docker rm -f ws && docker network rm ipv6net
```
