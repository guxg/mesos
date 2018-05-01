## Build Docker Images

cd scheduler/0.19.1
docker build -t marketin/aurora-scheduler:0.19.1 .

## yum install

```
wget -c https://apache.bintray.com/aurora/centos-7/aurora-scheduler-${AURORA_VERSION}-1.el7.centos.aurora.x86_64.rpm
yum install -y aurora-scheduler-${AURORA_VERSION}-1.el7.centos.aurora.x86_64.rpm
```

### user aurora

uid=999(aurora) gid=998(aurora) groups=998(aurora)

### systemd aurora-scheduler.service 

cat /etc/systemd/system/aurora-scheduler.service 

```
[Unit]
Description=Aurora Scheduler
After=network.target
Wants=network.target

[Service]
ExecStart=/usr/bin/aurora-scheduler-startup
User=aurora
Group=aurora
Restart=always
RestartSec=20
LimitNOFILE=16384

[Install]
WantedBy=multi-user.target
```


### aurora-scheduler-startup

>  cat /usr/bin/aurora-scheduler-startup

```
// AURORA_FLAGS
source /etc/sysconfig/aurora-scheduler

// exec 
exec /usr/lib/aurora/bin/aurora-scheduler "${AURORA_FLAGS[@]}"

```

### parameters

```
/usr/lib/aurora/bin/aurora-scheduler -help
```





FROM marketin/mesos-master:1.5.0
MAINTAINER Gu Xiangguo <xiangguo.gu@marketin.cn>

ARG AURORA_VERSION=0.19.1
ARG MESOS_REPLICATED_LOG_PATH=/var/lib/aurora/scheduler/db
ENV USER=aurora

RUN yum install -y java-1.8.0-openjdk-headless wget

RUN wget -c https://apache.bintray.com/aurora/centos-7/aurora-scheduler-${AURORA_VERSION}-1.el7.centos.aurora.x86_64.rpm && \
    yum install -y aurora-scheduler-${AURORA_VERSION}-1.el7.centos.aurora.x86_64.rpm

RUN systemctl stop aurora && \
    mkdir -p $MESOS_REPLICATED_LOG_PATH && \
    mesos-log initialize --path=$MESOS_REPLICATED_LOG_PATH

RUN chown -R $USER:$USER $MESOS_REPLICATED_LOG_PATH

COPY scheduler.sh /home/$USER/scheduler.sh

RUN chown $USER:$USER /home/$USER/scheduler.sh && \
    chmod 500 /home/$USER/scheduler.sh

USER aurora

WORKDIR /home/$USER

ENTRYPOINT ["./scheduler.sh"]
