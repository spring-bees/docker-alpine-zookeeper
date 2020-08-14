coolbeevip/docker-alpine-zookeeper
==============

启动
-----
~~~~
docker run \
    --name zookeeper
    -p 2181:2181 \
    coolbeevip/docker-alpine-zookeeper
~~~~

端口
-----

    2181

卷
-----    

    /zookeeper/conf    
    /zookeeper/data
