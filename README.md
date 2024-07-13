# web版 ssh 连接服务器，支持仅有ipv6的服务器

## 把项目下载到本地并进入目录
```
apt install -y git && \
git clone https://github.com/wenyamu/webssh.git && \
cd webssh
```
## 放行端口
```
iptables -I INPUT -p tcp --dport 8888 -j ACCEPT
```
## 安装 python3 模块
```
pip install paramiko tornado
```
## 运行 python3 程序
```
python3 run.py
```
## 访问
```
http://0.0.0.0:8888
```
