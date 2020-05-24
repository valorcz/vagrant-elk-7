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
sudo cp /vagrant/config/elasticsearch.yml /etc/elasticsearch/elasticsearch.yml.vagrant
sudo cp /vagrant/config/kibana.yml /etc/kibana/kibana.yml.vagrant

# This is unnecessary now
# /usr/share/elasticsearch/bin/elasticsearch-plugin install x-pack
# /usr/share/kibana/bin/kibana-plugin install x-pack

sudo systemctl start elasticsearch.service
sudo systemctl start kibana.service
