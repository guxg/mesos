

Client可以安装在任何机器上，执行如下命令：

https://andyyoung01.github.io/2016/08/10/Apache-Mesos-11-使用Aurora创建任务/

## Mac

brew install aurora-cli

> /usr/local/Cellar/aurora-cli/0.19.0: 8 files, 5.2MB

```
$ which aurora
/usr/local/bin/aurora
$ which aurora_admin
/usr/local/bin/aurora_admin
```


```
cp clusters.json ~/.aurora/
```


aurora --help


aurora job create foo/root/devel/docker-nginx  nginx_docker.aurora



 WARN] Transport error communicating with scheduler: Unknown error talking to http://192.168.2.101:8081/api: HTTPConnectionPool(host='192.168.2.101', port=8081): Max retries exceeded with url: /api (Caused by NewConnectionError('<requests.packages.urllib3.connection.HTTPConnection object at 0x1037e0d10>: Failed to establish a new connection: [Errno 61] Connection refused',)), retrying...

 => TOOD:  ZK: http://192.168.2.101:8081/api  => http://192.168.2.101:7081/api


aurora job --help

aurora job create 


aurora config list nginx_docker.aurora

## CentOS 7


### yum install 


```
# python --version
Python 2.7.5
# which wget
/usr/bin/wget

```


```
wget -c https://apache.bintray.com/aurora/centos-7/aurora-tools-0.19.1-1.el7.centos.aurora.x86_64.rpm
yum install -y aurora-tools-0.19.1-1.el7.centos.aurora.x86_64.rpm
```

