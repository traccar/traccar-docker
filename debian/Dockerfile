FROM openjdk:8-jre

WORKDIR /opt/traccar

RUN set -ex && \
    TRACCAR_DOWNLOAD_LINK=$(curl --silent https://api.github.com/repos/traccar/traccar/releases/latest | grep '"browser_download_url":' | sed -E 's/.*"([^"]+)".*/\1/' | grep 'other') && \
    curl -LSso /tmp/traccar.zip $TRACCAR_DOWNLOAD_LINK && \
    unzip -qo /tmp/traccar.zip -d /opt/traccar && \
    rm /tmp/traccar.zip

EXPOSE 8082

ENTRYPOINT ["java"]

CMD ["-Djava.net.preferIPv4Stack=true", "-Xms512m", "-Xmx512m", "-jar", "tracker-server.jar", "conf/traccar.xml"]
