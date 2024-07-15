# web版 ssh 连接服务器，支持 ipv6
> 整理自 `https://github.com/huashengdun/webssh` 项目

## 成功测试环境
> debian11 amd64 (ipv4 & ipv6)
> 
> python 3.9.2
> 
> paramiko 3.4.0
> 
> tornado 6.4.1

## 一键部署
```
apt install -y git && \
curl -L https://github.com/wenyamu/docker/releases/download/v1.0.0/docker-ce.sh | bash && \
iptables -I INPUT -p tcp --dport 8888 -j ACCEPT && \
git clone https://github.com/wenyamu/webssh.git /root/webssh && \
cd /root/webssh && \
docker compose up -d
```
## 修改配置文件
> 把 `default.conf` 中的 `server_name  ssh.site.com;` 替换为你的域名

## 或者你可以手动部署
```
# 创建镜像
docker build -t webssh:tag .

# 创建容器( --network host 这是关键，容器与宿主机共享网格，支持 ipv6 的 ssh 连接就是这里)
docker run -itd --network host --name ws webssh:tag
```
## 访问
```
http://0.0.0.0:8888
# 或者通过域名
http://ssh.site.com
```
