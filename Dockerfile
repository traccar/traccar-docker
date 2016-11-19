FROM java:8-alpine

MAINTAINER Maxim Zalysin <zalysin.m@gmail.com>

LABEL pro.magnaz.docker.traccar.version="{\"container\": \"16.11.19\", \"traccar\": \"3.8\"}"

ADD https://github.com/tananaev/traccar/releases/download/v3.8/traccar-other-3.8.zip /tmp/

RUN mkdir -p /opt/traccar && unzip -o /tmp/traccar-other-3.8.zip -d /opt/traccar && rm /tmp/traccar-other-3.8.zip

EXPOSE 8082 5000-5150 5000-5150/udp

WORKDIR /opt/traccar

ENTRYPOINT ["java", "-Djava.net.preferIPv4Stack=true", "-Xms512m", "-jar", "tracker-server.jar", "conf/traccar.xml"]
