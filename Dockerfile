FROM java:8-alpine

MAINTAINER Maxim Zalysin <zalysin.m@gmail.com>

LABEL pro.magnaz.docker.transmission.version="{\"container\": 1.1, \"traccar\": 3.6}"

ADD https://github.com/tananaev/traccar/releases/download/v3.6/traccar-other-3.6.zip /tmp/

RUN unzip /tmp/traccar-other-3.6.zip -d /opt/traccar/ && rm /tmp/traccar-other-3.6.zip

EXPOSE 8082 5000-5150 5000-5150/udp

WORKDIR /opt/traccar

ENTRYPOINT ["java", "-Djava.net.preferIPv4Stack=true", "-Xms512m", "-jar", "tracker-server.jar", "conf/traccar.xml"]