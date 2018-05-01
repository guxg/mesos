FROM marketin/mesos-slave:1.5.0
MAINTAINER Gu Xiangguo <xiangguo.gu@marketin.cn>

ARG AURORA_VERSION=0.19.1
ENV AURORA_CONFIG_ROOT=/home/aurora/.aurora/clusters.json
ENV USER=aurora

RUN yum install -y wget

RUN wget -c https://apache.bintray.com/aurora/centos-7/aurora-tools-${AURORA_VERSION}-1.el7.centos.aurora.x86_64.rpm && \
    yum install -y aurora-tools-${AURORA_VERSION}-1.el7.centos.aurora.x86_64.rpm

RUN useradd $USER --create-home --shell /bin/bash

USER aurora

WORKDIR /home/aurora
