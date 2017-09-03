Traccar server on Alpine Linux
====
Free and Open Source GPS Tracking Platform

[![](https://images.microbadger.com/badges/image/magnaz/traccar.svg)](http://microbadger.com/images/magnaz/traccar "Get your own image badge on microbadger.com") [![](https://images.microbadger.com/badges/version/magnaz/traccar.svg)](http://microbadger.com/images/magnaz/traccar "Get your own version badge on microbadger.com")

Current version: **3.14**

Official website: https://www.traccar.org

### Create container example:

1. **Create work directories:**
    ```bash
    mkdir -p /var/docker/traccar/logs
    ```

1. **Get default traccar.xml:**
    ```bash
    docker run \
    --rm \
    --entrypoint cat \
    magnaz/traccar:3.14 \
    /opt/traccar/conf/traccar.xml > /var/docker/traccar/traccar.xml
    ```

1. **Edit traccar.xml: <https://www.traccar.org/configuration-file/>**

1. **Create container:**
    ```bash
    docker run \
    -d --restart always \
    --name traccar \
    --hostname traccar \
    -p 80:8082 \
    -p 5000-5150:5000-5150 \
    -p 5000-5150:5000-5150/udp \
    -v /etc/timezone:/etc/timezone:ro \
    -v /etc/localtime:/etc/localtime:ro \
    -v /var/docker/traccar/logs:/opt/traccar/logs:rw \
    -v /var/docker/traccar/traccar.xml:/opt/traccar/conf/traccar.xml:ro \
    image: magnaz/traccar:3.14
    ```
