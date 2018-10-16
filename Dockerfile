FROM debian:stretch
LABEL MAINTAINER="tux1337"

RUN apt-get update && apt-get upgrade -y

RUN apt-get install git python-pip procps -y
WORKDIR /opt
RUN git clone https://github.com/Isilon/isilon_data_insights_connector.git
RUN apt-get remove git -y && apt-get autoremove -y

WORKDIR /opt/isilon_data_insights_connector

RUN pip install -r requirements.txt

RUN mkdir log
RUN mkdir conf
RUN cp example_isi_data_insights_d.cfg conf/isi_data_insights_d.cfg

RUN apt-get clean

COPY run.sh /
RUN chmod 755 /run.sh

CMD ["/run.sh"]
