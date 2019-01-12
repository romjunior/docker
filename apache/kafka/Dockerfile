FROM alpine:latest

ENV BROKERID=0 \
NUMNETWORKTHREAD=3 \
NUMIOTHREAD=8 \
SOCKETSENDBUFFER=102400 \
SOCKETRECEIVEBUFFER=102400 \
SOCKETREQUESTMAX=104857600 \
LOGDIRS=/tmp/kafka-logs \
NUMPARTITIONS=1

COPY kafka_2.11-2.1.0.tgz . 

RUN apk update && \
apk upgrade && \ 
apk add tar && \
apk add wget && \
apk add bash && \
#wget https://www.apache.org/dyn/closer.cgi?path=/kafka/2.1.0/kafka_2.11-2.1.0.tgz && \
tar -xvzf kafka_2.11-2.1.0.tgz
WORKDIR /kafka_2.11-2.1.0
RUN mkdir -p ${LOGDIRS} && \
mv config/server.properties config/server-backup.properties && \
echo "broker.id=${BROKERID}" >> config/server.properties && \
echo "num.network.threads=${NUMNETWORKTHREAD}" >> config/server.properties && \
echo "num.io.threads=${NUMIOTHREAD}" >> config/server.properties && \
echo "socket.send.buffer.bytes=${SOCKETSENDBUFFER}" >> config/server.properties && \
echo "socket.receive.buffer.bytes=${SOCKETRECEIVEBUFFER}" >> config/server.properties && \
echo "socket.request.max.bytes=${SOCKETREQUESTMAX}" >> config/server.properties && \
echo "log.dirs=${LOGDIRS}" >> config/server.properties && \
echo "num.partitions=${NUMPARTITIONS}" >> config/server.properties && \
echo "num.recovery.threads.per.data.dir=1" >> config/server.properties && \
echo "offsets.topic.replication.factor=1" >> config/server.properties && \
echo "transaction.state.log.replication.factor=1" >> config/server.properties && \
echo "transaction.state.log.min.isr=1" >> config/server.properties && \
echo "log.retention.hours=168" >> config/server.properties && \
echo "log.segment.bytes=1073741824" >> config/server.properties && \
echo "log.retention.check.interval.ms=300000" >> config/server.properties && \
echo "zookeeper.connect=192.168.49.142:8085" >> config/server.properties && \
echo "zookeeper.connection.timeout.ms=6000" >> config/server.properties && \
echo "group.initial.rebalance.delay.ms=0" >> config/server.properties

ENTRYPOINT [ "bin/kafka-server-start.sh config/server.properties" ]

