# isilon_data_insights_connector-Docker

This repository provides everything to dockerize [isilon_data_insights_connector](https://github.com/Isilon/isilon_data_insights_connector).

There is an automated build on Docker Hub: [tux1337/isilon_data_insights_connector](https://hub.docker.com/r/tux1337/isilon_data_insights_connector/)

## How to use 
You can use the following `docker-compose.yml` to startup the container. You need to link your config file into the container. 
Please refer the documentation of the application to create an config file. 
```yaml
version: '3'
services:
  isilon-harvest:
    image: "tux1337/isilon_data_insights_connector"
    volumes:
      # link your config file of the connector to the container
      - <dockerhost_path>/isi_data_insights_d.cfg:/opt/isilon_data_insights_connector/conf/isi_data_insights_d.cfg
      # save the log files outside of the container
      - <dockerhost_path>/log:/opt/isilon_data_insights_connector/log
    container_name: isilon-harvest
    environment:
      #set the log level of the connector
      CON_LOGLEVEL: "error"
```
