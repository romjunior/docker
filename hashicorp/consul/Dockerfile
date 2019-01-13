FROM ubuntu:16.04
LABEL author="Romualdo Junior(romualdo.jrr@gmail.com)"
ENV ADVADDR=192.168.49.167 \
BINDADDR=0.0.0.0 \
CLIENTADDR=0.0.0.0 \
NUMBERCONSUL=1 \
NODENAME="agent-one" \
DATADIR="/tmp/consul"
RUN apt-get update && apt-get -y install wget unzip 
RUN wget https://releases.hashicorp.com/consul/1.4.0/consul_1.4.0_linux_amd64.zip \
&& mkdir /home/consul \
&& unzip consul_1.4.0_linux_amd64.zip -d /home/consul \
&& rm -f consul_1.4.0_linux_amd64.zip \
&& mkdir /tmp/consul 

ENV PATH="/home/consul:${PATH}"
CMD consul agent -server -bootstrap-expect=$NUMBERCONSUL -data-dir=$DATADIR -node=$NODENAME --advertise=$ADVADDR --bind=$BINDADDR --client=$CLIENTADDR -ui