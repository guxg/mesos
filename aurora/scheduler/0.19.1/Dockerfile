FROM marketin/mesos-master:1.5.0
MAINTAINER Gu Xiangguo <xiangguo.gu@marketin.cn>

ARG AURORA_VERSION=0.19.1
ARG MESOS_REPLICATED_LOG_PATH=/var/lib/aurora/scheduler/db

RUN yum install -y java-1.8.0-openjdk-headless wget

RUN wget -c https://apache.bintray.com/aurora/centos-7/aurora-scheduler-${AURORA_VERSION}-1.el7.centos.aurora.x86_64.rpm && \
    yum install -y aurora-scheduler-${AURORA_VERSION}-1.el7.centos.aurora.x86_64.rpm

RUN mkdir -p $MESOS_REPLICATED_LOG_PATH && \
    mesos-log initialize --path=$MESOS_REPLICATED_LOG_PATH

COPY scheduler.sh /root/scheduler.sh
RUN  chmod 500 /root/scheduler.sh

WORKDIR /root

ENTRYPOINT ["./scheduler.sh"]

