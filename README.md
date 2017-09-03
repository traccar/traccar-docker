Traccar
---
Modern GPS Tracking Platform

Official website: <https://www.traccar.org>  
Current version: **3.14**

### Current tags:

- **3.14-alpine**, **3.14**, **alpine** or **latest** ([alpine/Dockerfile](https://github.com/magna-z/docker-traccar/blob/master/alpine/Dockerfile)) [![](https://images.microbadger.com/badges/image/magnaz/traccar:alpine.svg)](https://microbadger.com/images/magnaz/traccar:alpine)
- **3.14-debian**, **debian** ([debian/Dockerfile](https://github.com/magna-z/docker-traccar/blob/master/debian/Dockerfile)) [![](https://images.microbadger.com/badges/image/magnaz/traccar:debian.svg)](https://microbadger.com/images/magnaz/traccar:debian)

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
    magnaz/traccar \
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
    image: magnaz/traccar
    ```
