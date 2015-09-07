FROM       ubuntu

RUN  apt-get update && apt-get install -y software-properties-common

#########################
# JDK 8
#########################
RUN \
  echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \
  add-apt-repository -y ppa:webupd8team/java && \
  apt-get update && \
  apt-get install -y oracle-java8-installer 
  
###############################
## Elasticsearch
###############################
RUN wget -qO - https://packages.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -
RUN echo "deb http://packages.elastic.co/elasticsearch/1.7/debian stable main" | sudo tee -a /etc/apt/sources.list.d/elasticsearch-1.7.list
RUN sudo apt-get update && sudo apt-get install elasticsearch

###############################
## MongoDb
###############################

RUN apt-get install -y mongodb

###############################
#Graylog
###############################
RUN wget https://packages.graylog2.org/repo/packages/graylog-1.2-repository-ubuntu14.04_latest.deb
RUN dpkg -i graylog-1.2-repository-ubuntu14.04_latest.deb
RUN apt-get install -y apt-transport-https
RUN apt-get update
RUN apt-get install -y graylog-server graylog-web