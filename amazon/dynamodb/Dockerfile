FROM openjdk:11-slim-stretch

COPY dynamodb_local_latest.tar.gz .

ENV STORAGE=/storage \
PORT=8000

RUN apt-get update && \
apt-get upgrade -y && \ 
apt-get install -y wget && \
#wget https://s3-sa-east-1.amazonaws.com/dynamodb-local-sao-paulo/dynamodb_local_latest.tar.gz && \
tar -xzf dynamodb_local_latest.tar.gz && \
rm -f kafka_2.12-2.1.0 kafka && \
mkdir ${STORAGE}

CMD java -Djava.library.path=./DynamoDBLocal_lib -jar DynamoDBLocal.jar -dbPath ${STORAGE} -sharedDb -port ${PORT}
