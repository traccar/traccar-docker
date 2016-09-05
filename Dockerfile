FROM java:8-alpine

MAINTAINER Maxim Zalysin <zalysin.m@gmail.com>

LABEL container_version="1.0"
LABEL traccar_version="3.6"

ENV _JAVA_OPTIONS -Xms256m -Xmx1024m -Djava.net.preferIPv4Stack=true

ADD https://github.com/tananaev/traccar/releases/download/v3.6/traccar-other-3.6.zip /tmp/
ADD https://raw.githubusercontent.com/tananaev/traccar/v3.6/setup/unix/traccar.xml /opt/traccar/

RUN unzip /tmp/traccar-other-3.6.zip -d /opt/traccar/ && rm /tmp/traccar-other-3.6.zip

EXPOSE 8082 5000-5150 5000-5150/udp

WORKDIR /opt/traccar

ENTRYPOINT ["java", "-jar", "tracker-server.jar", "traccar.xml"]