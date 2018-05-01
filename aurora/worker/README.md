## Note

https://andyyoung01.github.io/2016/08/10/Apache-Mesos-11-使用Aurora创建任务/

Worker components需要安装到与Mesos slave相同的节点上

## Build Docker Images

cd worker/0.19.1
docker build -t marketin/aurora-worker:0.19.1 .


### yum install 


```
# python --version
Python 2.7.5
# which wget
/usr/bin/wget

```



```
wget -c https://apache.bintray.com/aurora/centos-7/aurora-executor-0.19.1-1.el7.centos.aurora.x86_64.rpm
yum install -y aurora-executor-0.19.1-1.el7.centos.aurora.x86_64.rpm
```

### user aurora

```
id aurora
uid=999(aurora) gid=998(aurora) groups=998(aurora)
```


### systemd thermos.service 

cat /etc/systemd/system/thermos.service 

```
[Unit]
Description=Thermos Observer
After=network.target
Wants=network.target

[Service]
ExecStart=/usr/bin/thermos-startup
User=root
Group=root
Restart=always
RestartSec=20
LimitNOFILE=16384

[Install]
WantedBy=multi-user.target
```


### /usr/bin/thermos-startup

cat /usr/bin/thermos-startup

```
source /etc/sysconfig/thermos

exec /usr/bin/thermos_observer "${OBSERVER_ARGS[@]}"
```

which thermos_executor
/usr/bin/thermos_executor


cat /etc/sysconfig/thermos

```
#!/bin/bash
# Configuration used when executing the Thermos observer process.

OBSERVER_ARGS=(
  --port=1338
  --log_to_disk=NONE
  --log_to_stderr=google:INFO
)
```








