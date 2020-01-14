# Docker Certification Associate

#### VMs são boas, mas...

* São muitos pesadas(GBs)
* Contém um sistema operacional completo
* Lentas para iniciar e autoscaling e autohealing é lento também.

#### Container

É um pacote, executável, leve e stand-alone de um software que inclui tudo necessário para a execução do mesmo: Código, runtime, tools, libraries e configurações.

![Definição do Container](https://github.com/romjunior/docker/blob/master/certification/imgs/container-def.png)

#### Eles são:

*  Platform independent
* possuem um runtime como uma camada de abstração e só dependem dela(Container Engine)
* Consegue conterniarizar suas aplicações em containers.

#### Vantagens:

* Não possuem Guest OS
* Platform independent
* Imagens são leves(Mbs em tamanho)
* São rápidas para iniciar e escalar.
* Híbridas e multi-cloud

#### O que é Docker?

Uma ferramenta que "empacota" uma aplicação e suas dependencias em um container que pode executar em qualquer computador usando o Kernel do linux(real ou emulado)

* Tecnologia de Containers
* Imagens leves
* isolamento de recursos e outras ferramentas.

Ferramentas:

* **Docker Compose**: Criação de multiplos containers usando manifesto .yaml para definir containers e suas interações. 

* **Docker Swarm**: Orquestrador de Cluster(Líder atualmente: k8s)

#### Arquitetura do Docker

* **Docker Daemon**:
  
  * Escuta solicitações da API do Docker 
  * Gerencia *Docker Objects*
  * Comunica com outros *Daemons* para gerenciar os *Docker Services*.
* **Docker Client**:
  
  * Jeito primário de como o usuário interage com o Docker.
  * Os comandos do Docker usam o Docker API 
  * Envia *docker run commands* para o *dockerd*
  * Consegue comunicar com múltiplos *Daemons*(Ideal para o Swarm)
* **Docker Registries**: 
  
  * Armazenamento para imagens.
  * *Docker Hub* e *Docker Cloud* são registries públicos.
  * Usa o *Docker Datacenter(DDC)* e inclui *Docker Trusted Registry*.
  * Quando executado o *run* ou *pull*, as imagens serão *pulled* dos registries configurados.
  * *Docker Store* permite você vender ou comprar imagens, ou distribuí-las de graça.
* **Docker Objects**: 

  * Imagens
    * um template somente leitura.
    * uma imagem é baseada em outra imagem, com alguma customização.
    * Pode criar ou usar disponíveis nos registries.
    * para criar sua imagem, deve criar e usar um *Dockerfile*
  * Containers:
    
    * uma instância executável de uma imagem
    * pode criar, iniciar, parar, mover, deletar um container usando CLI ou API.
    * pode controlar o nível de isolamento do container: Rede, armazenamento, ou outros subsistemas de outros containers ou host.
    * é definido pela sua imagem assim como configurações que você define quando você o criar ou inicia.
  * Redes 
  * Services 
  * Volumes

![Ciclo de Vida do Container](https://github.com/romjunior/docker/blob/master/certification/imgs/container-lifecycle.png)

Dockerfile:
 
 * Define o que vai dentro do seu container
 * Acessa a recursos como interfaces de rede, discos são virtualizados dentro do ambiente
 * Consegue copiar arquivos da sua máquina ou de fora para dentro da imagem.
 * Instruções não são case-sensitive(FROM, COPY, ADD...)

 Exemplo:

 ```dockerfile
 FROM ubuntu:latest # imagem:tag -- layer 1
 RUN apt update && apt install redis_server # commando para instalar o redis -- layer 2
 EXPOSE 6379 # expõe a porta -- layer 3
 ENTRYPOINT ["/usr/bin/redis_server"] # comando para iniciar o container -- layer 4
 ```

 **.dockerignore file**: antes do CLI enviar o contexto para o *Daemon*, ele olha uma arquivo chamado `.dockerignore` no diretório atual, se existir o CLI modifica o contexto e exclui os arquivos e diretório que baterem com o padrão. Isso evita enviar coisas desnecessárias ou sensíveis para o *Daemon* e adicionando eles as imagens usando `ADD` e `COPY`

 * ex: */temp\*: */ significa 1 nível do diretório atual e qualquer arquivo de inicie com *temp*.
 * ex: */\*/temp\*: significa 2 níveis do diretório atual e qualquer arquivo que inicie com *temp*
 * ex: temp?: qualquer arquivo que inicie com temp mais um caractere: tempa, tempb e etc
 * ignorar arquivos e ou pastas use ! antes. Ex:!README.md

 **scape chars**: \ ou `(especialmente no Windows) no dockerfile

 Exemplo:

 ```dockerfile
 FROM microsoft/nanoserver
 COPY test.txt C:\\ # vai dar erro por que a segunda barra é de escape, vai juntar a linha debaixo em uma só e vai dar erro no build
 RUN dir C:\
 ```

 Como resolver:

 ```
 # escape=`   # só definir o padrão do escape
 FROM microsoft/nanoserver
 COPY test.txt C:\
 RUN dir C:\
 ```

 #### Construindo a primeira imagem

 ```dockerfile
 FROM ubuntu #baseimage
 LABEL maintainer junior # metadados key=value
 ADD https://arquivo.txt  /tmp/teste.txt #faz o download e adiciona o arquivo no /tmp do sistema de arquivos do container
 RUN ["bash"] # executa o comando bash
 ```

Para construir a imagem pode usar

 ```
 docker build -f dockerfile -t imagem:[tag] .
 ```

 * `build`: comando para construir uma imagem a partir de um dockerfile
 * `-f`: especificar o arquivo, se for omitida vai procurar um arquivo chamado `dockerfile` no diretório especificado
 * `-t`: dar nome e opcionalmente uma tag(padrão `latest`) para uma imagem
 * `.`: pode dar um caminho para o docker construir a imagem e os parametros seguirão dessa localização

Para verificar se a imagem foi criado, executar

 ```
 docker images
 ```

Para executar o container a partir de uma imagem use o seguinte comando:

```
docker run -it -d --name nome-do-container nome-da-imagem
```

* `-it`: modo interativo
* `-d`: desacoplado do terminal
*  `--name`: especifica um nome para o container, senão recebe um padrão(TODO: ver padrão)

Para verificar se o container est[a executando use o seguinte comando:

```
docker ps|container -a
```

* `-a`: serve para mostrar todos os container, não só em execução

Podemos acoplar ao nosso container usando:

```
docker attach container-name
```