# web版 ssh 连接服务器，支持仅有ipv6的服务器
> 整理自 `https://github.com/huashengdun/webssh` 项目

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
pip install --no-cache-dir paramiko tornado
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
