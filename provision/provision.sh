#!/bin/bash

# Prepare the repositories
sudo rpm --import https://artifacts.elastic.co/GPG-KEY-elasticsearch
sudo cp /vagrant/provision/elastic.repo /etc/yum.repos.d/

# Install all the necessary packages
sudo yum install -y java-headless
sudo yum install -y --enablerepo=elasticsearch elasticsearch kibana logstash filebeat

# Update the VM mapping, so that it may prevent some Elasticsearch issues
sudo sysctl -w vm.max_map_count=262144

# Rewrite this to use `install` command
sudo install -o root -g elasticsearch /vagrant/config/elasticsearch.yml /etc/elasticsearch/elasticsearch.yml
sudo install -o root -g elasticsearch /vagrant/config/kibana.yml /etc/kibana/kibana.yml

# This is unnecessary now
# /usr/share/elasticsearch/bin/elasticsearch-plugin install x-pack
# /usr/share/kibana/bin/kibana-plugin install x-pack

sudo systemctl start elasticsearch.service
sudo systemctl start kibana.service

# Announce the URL where Kibana is available now
echo "***************************************************************************"
echo " Congratulations! Your ELK instance is running at the following URLs."
echo "    Kibana:        http://localhost:5601/"
echo "    ElasticSearch: http://localhost:9200/"
echo "***************************************************************************"

