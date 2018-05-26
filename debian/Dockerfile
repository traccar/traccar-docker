FROM openjdk:8-jre

ENV TRACCAR_VERSION 3.17

WORKDIR /opt/traccar

RUN set -ex && \
    curl -LSso /tmp/traccar.zip https://github.com/tananaev/traccar/releases/download/v$TRACCAR_VERSION/traccar-other-$TRACCAR_VERSION.zip && \
    unzip -qo /tmp/traccar.zip -d /opt/traccar && \
    rm /tmp/traccar.zip

EXPOSE 8082

ENTRYPOINT ["java"]

CMD ["-Djava.net.preferIPv4Stack=true", "-Xms512m", "-Xmx512m", "-jar", "tracker-server.jar", "conf/traccar.xml"]
