FROM openjdk:8-jdk-alpine
LABEL autor="Romualdo Junior"
ENV TICKTIME=2000 \
DATADIR=/var/lib/zookeeper \
CLIENTPORT=2181
RUN apk update && \
apk upgrade && \ 
apk add tar && \
apk add wget && \
apk add bash && \
wget http://ftp.unicamp.br/pub/apache/zookeeper/stable/zookeeper-3.4.12.tar.gz && \
tar -xvf zookeeper-3.4.12.tar.gz
WORKDIR /zookeeper-3.4.12
RUN mkdir -p ${TICKTIME} && \
echo "tickTime=$TICKTIME" >> conf/zoo.cfg && \
echo "dataDir=$DATADIR" >> conf/zoo.cfg && \
echo "clientPort=$CLIENTPORT" >> conf/zoo.cfg && \
cat conf/zoo.cfg

ENTRYPOINT ["bin/zkServer.sh", "start-foreground"]
