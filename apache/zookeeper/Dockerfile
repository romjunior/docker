FROM openjdk:8-jdk-alpine
LABEL autor="Romualdo Junior"
ENV TICKTIME=2000 \
DATADIR=/var/lib/zookeeper \
CLIENTPORT=2181
#COPY zookeeper-3.4.12.tar.gz .
RUN apk update && \
apk upgrade && \ 
apk add tar && \
apk add wget && \
apk add bash && \
wget https://downloads.apache.org/zookeeper/zookeeper-3.6.2/apache-zookeeper-3.6.2-bin.tar.gz && \
tar -xvf apache-zookeeper-3.6.2-bin.tar.gz
WORKDIR /apache-zookeeper-3.6.2-bin
RUN mkdir -p ${DATADIR} && \
echo "tickTime=$TICKTIME" >> conf/zoo.cfg && \
echo "dataDir=$DATADIR" >> conf/zoo.cfg && \
echo "clientPort=$CLIENTPORT" >> conf/zoo.cfg && \
cat conf/zoo.cfg

ENTRYPOINT ["bin/zkServer.sh", "start-foreground"]
