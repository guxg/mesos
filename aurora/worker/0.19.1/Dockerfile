FROM marketin/mesos-slave:1.5.0
MAINTAINER Gu Xiangguo <xiangguo.gu@marketin.cn>

ARG AURORA_VERSION=0.19.1

RUN yum install -y java-1.8.0-openjdk-headless wget

RUN wget -c https://apache.bintray.com/aurora/centos-7/aurora-executor-${AURORA_VERSION}-1.el7.centos.aurora.x86_64.rpm && \
    yum install -y aurora-executor-${AURORA_VERSION}-1.el7.centos.aurora.x86_64.rpm

# http://mesos.apache.org/documentation/latest/isolators/docker-volume/
# https://github.com/sbt/sbt/issues/3108
RUN wget -c https://dl.bintray.com/emccode/dvdcli/stable/latest/dvdcli-latest-x86_64.rpm && \
    yum install -y dvdcli-latest-x86_64.rpm

COPY thermos.sh /root/thermos.sh

RUN chmod 500 /root/thermos.sh

WORKDIR /root

ENTRYPOINT ["./thermos.sh"]
