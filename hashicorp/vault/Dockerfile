FROM ubuntu:16.04
LABEL author="Romualdo Junior(romualdo.jrr@gmail.com)"
ENV VAULT_ADDR 'http://127.0.0.1:8200'
ENV VAULT_SKIP_VERIFY true
RUN apt-get update \
&& apt-get -y install wget unzip \
&& wget https://releases.hashicorp.com/vault/0.11.5/vault_0.11.5_linux_amd64.zip \
&& mkdir /home/vault \
&& unzip vault_0.11.5_linux_amd64.zip -d /home/vault \
&& rm -f vault_0.11.5_linux_amd64.zip

ENV PATH="/home/vault:${PATH}"

ENTRYPOINT [ "vault", "server", "-dev-listen-address=0.0.0.0:8200", "-dev" ]

#ENTRYPOINT ["/home/vault/vault"]
#CMD ["server", "-dev"]
