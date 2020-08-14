FROM coolbeevip/docker-alpine-jre:1.8

MAINTAINER coolbeevip <coolbeevip@gmail.com>

ENV ZK_VERSION 3.5.7
ENV ZK_HOME /zookeeper
ENV ZK_TAR apache-zookeeper-${ZK_VERSION}-bin.tar.gz

RUN wget -q https://archive.apache.org/dist/zookeeper/zookeeper-${ZK_VERSION}/${ZK_TAR} && \
    tar -xzf ${ZK_TAR} && \
    mv apache-zookeeper-${ZK_VERSION}-bin ${ZK_HOME} && \
    mv ${ZK_HOME}/conf/zoo_sample.cfg ${ZK_HOME}/conf/zoo.cfg && \
    sed  -i "s|/tmp/zookeeper|$ZK_HOME/data|g" $ZK_HOME/conf/zoo.cfg && \
    rm -rf ${ZK_TAR} && \
    mkdir $ZK_HOME/data

ADD start-zk.sh /usr/bin/start-zk.sh
EXPOSE 2181 2888 3888

WORKDIR ${ZK_HOME}
VOLUME ["/zookeeper/conf", "/zookeeper/data"]

CMD ["bash","/usr/bin/start-zk.sh"]
