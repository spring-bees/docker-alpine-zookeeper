FROM coolbeevip/docker-alpine-jre:1.8

MAINTAINER coolbeevip <coolbeevip@gmail.com>

ENV ZK_VERSION 3.4.9
ENV ZK_HOME /zookeeper
ENV ZK_TAR zookeeper-${ZK_VERSION}-bin.tar.gz

RUN wget -q https://mirrors.sonic.net/apache/zookeeper/zookeeper-${ZK_VERSION}/${ZK_TAR} && \
    tar -xzf ${ZK_TAR} && \
    mv apache-zookeeper-${ZK_VERSION}-bin ${ZK_HOME} && \
    mv ${ZK_HOME}/conf/zoo_sample.cfg ${ZK_HOME}/conf/zoo.cfg && \
    sed  -i "s|/tmp/zookeeper|$ZK_HOME/data|g" $ZK_HOME/conf/zoo.cfg && \
    rm -rf ${ZK_TAR} && \
    mkdir $ZK_HOME/data

ADD start-zk.sh /usr/bin/start-zk.sh
EXPOSE 2181 2888 3888

WORKDIR /zookeeper
VOLUME ["/zookeeper/conf", "/zookeeper/data"]

CMD ["bash","/usr/bin/start-zk.sh"]
