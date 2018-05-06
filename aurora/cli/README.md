
# Aurora Cli


Client可以安装在任何机器上，执行如下命令：

https://andyyoung01.github.io/2016/08/10/Apache-Mesos-11-使用Aurora创建任务/


## aurora cli commands

### clusters


```
cp clusters.json ~/.aurora/
```


### help

aurora --help

### job

aurora job --help

aurora job list foo

aurora job create foo/root/devel/docker-nginx  nginx_docker.aurora


```
INFO] Creating job docker-nginx
INFO] Checking status of foo/root/devel/docker-nginx
Job create succeeded: job url=http://192.168.2.101:8081/scheduler/root/devel/docker-nginx
```


aurora job list foo/root/devel/docker-nginx
aurora job kill foo/root/devel/docker-nginx/0


 WARN] Transport error communicating with scheduler: Unknown error talking to http://192.168.2.101:8081/api: HTTPConnectionPool(host='192.168.2.101', port=8081): Max retries exceeded with url: /api (Caused by NewConnectionError('<requests.packages.urllib3.connection.HTTPConnection object at 0x1037e0d10>: Failed to establish a new connection: [Errno 61] Connection refused',)), retrying...

 => TOOD:  ZK: http://192.168.2.101:8081/api  => http://192.168.2.101:7081/api


aurora config list nginx_docker.aurora


aurora job list foo/root/devel
aurora job create foo/root/devel/spring-boot-api  spring-boot-api.aurora
aurora job kill foo/root/devel/spring-boot-api/0


        container = Mesos(image=DockerImage(name='demoapi', tag='1.0.1'))



I0506 12:26:09.253535    13 containerizer.cpp:1207] Starting container a072fd3b-bfa2-4e3f-9ac8-2ce4a2eea7f8
I0506 12:26:09.255532    13 containerizer.cpp:2966] Transitioning the state of container a072fd3b-bfa2-4e3f-9ac8-2ce4a2eea7f8 from PROVISIONING to PREPARING
E0506 12:26:09.257211    14 slave.cpp:5690] Container 'a072fd3b-bfa2-4e3f-9ac8-2ce4a2eea7f8' for executor 'thermos-root-devel-spring-boot-api-0-cf7603ea-87d3-4419-834d-fb720f90c2c5' of framework 044b2830-2c82-4245-8333-c06a3d719361-0000 failed to start: Volumes in ContainerInfo is not supported

http://mesos.apache.org/documentation/latest/isolators/docker-volume/


https://issues.apache.org/jira/browse/AURORA-1444



aurora job list foo/root/devel
aurora job create foo/root/devel/hello_docker_image  hello_docker_image.aurora
aurora job kill foo/root/devel/hello_docker_image/0



task command info and docker entrypoint: 
 http://mesos.apache.org/documentation/latest/isolators/docker-runtime/




## Install

### Mac

brew install aurora-cli

> /usr/local/Cellar/aurora-cli/0.19.0: 8 files, 5.2MB

```
$ which aurora
/usr/local/bin/aurora
$ which aurora_admin
/usr/local/bin/aurora_admin
```


### CentOS 7



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

