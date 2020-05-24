# ELK 7.x Vagrant Image

This repo is to make my life with ELK easier. It's been updated to the lastest
version of Elastic product, which currently means Elasticsearch 7.x & Kibana
7.x. 

## Building the image

```bash
    vagrant up
```

And that's it!

In case you need to check the internals of the installed VM, you can always ssh into the box by:

```bash
    vagrant ssh
```

## Forwarded ports

Port     | Application   | Note                               
---------|---------------|------------------------------------
5601/tcp | Kibana        | Reachable via http://localhost:5601/
9200/tcp | Elasticsearch |
9300/tcp | Elasticsearch Transport|

## Authentication

Because one of plugins installed is a plugin named Shield, providing authentication, you will be required to log on to the Kibana in the VM.

For that reason, here's the default credentials:

 * username: *elastic*
 * password: *changeme*

