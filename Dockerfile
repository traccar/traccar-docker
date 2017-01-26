FROM java:8-alpine

MAINTAINER Maxim Zalysin <zalysin.m@gmail.com>

ENV TRACCAR_VERSION 3.8

LABEL pro.magnaz.docker.traccar.version="{\"container\": \"16.11.19\", \"traccar\": \"${TRACCAR_VERSION}\"}"

RUN cd /tmp && \
	apk --no-cache add wget && \
	wget https://github.com/tananaev/traccar/releases/download/v${TRACCAR_VERSION}/traccar-other-${TRACCAR_VERSION}.zip && \
	mkdir -p /opt/traccar && \
	unzip -o /tmp/traccar-other-${TRACCAR_VERSION}.zip -d /opt/traccar && \
	rm /tmp/traccar-other-${TRACCAR_VERSION}.zip

EXPOSE 8082 5000-5150 5000-5150/udp

WORKDIR /opt/traccar

ENTRYPOINT ["java", "-Djava.net.preferIPv4Stack=true", "-Xms512m", "-jar", "tracker-server.jar", "conf/traccar.xml"]
