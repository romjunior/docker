FROM openjdk:8-jdk-alpine

ENV CONFIGPATH=config/server.properties

#COPY kafka_2.12-2.1.0.tgz . 

RUN apk update && \
apk upgrade && \ 
apk add tar && \
apk add wget && \
apk add bash && \
wget https://downloads.apache.org/kafka/2.7.0/kafka_2.13-2.7.0.tgz && \
tar -xvzf kafka_2.13-2.7.0.tgz && \
mv kafka_2.13-2.7.0 kafka
WORKDIR /kafka

CMD bin/kafka-server-start.sh ${CONFIGPATH}
#ENTRYPOINT [ "bin/kafka-server-start.sh", "config/server.properties" ]

