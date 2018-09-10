Traccar in Docker
---
Traccar GPS Tracking System in Docker image.

Official website: <https://www.traccar.org>  
Current version: **3.17**

### Current tags:

- **3.17-alpine**, **3.17**, **alpine** or **latest** ([alpine/Dockerfile](https://github.com/traccar/traccar-docker/blob/3.17/alpine/Dockerfile)) [![](https://images.microbadger.com/badges/image/traccar/traccar:3.17-alpine.svg)](https://microbadger.com/images/traccar/traccar:3.17-alpine)
- **3.17-debian**, **debian** ([debian/Dockerfile](https://github.com/traccar/traccar-docker/blob/3.17/debian/Dockerfile)) [![](https://images.microbadger.com/badges/image/traccar/traccar:3.17-debian.svg)](https://microbadger.com/images/traccar/traccar:3.17-debian)
- **3.16-alpine**, **3.16** ([alpine/Dockerfile](https://github.com/traccar/traccar-docker/blob/3.16/alpine/Dockerfile)) [![](https://images.microbadger.com/badges/image/traccar/traccar:3.16-alpine.svg)](https://microbadger.com/images/traccar/traccar:3.16-alpine)
- **3.16-debian** ([debian/Dockerfile](https://github.com/traccar/traccar-docker/blob/3.16/debian/Dockerfile)) [![](https://images.microbadger.com/badges/image/traccar/traccar:3.16-debian.svg)](https://microbadger.com/images/traccar/traccar:3.16-debian)

### Container creation example:

1. **Create work directories:**
    ```bash
    mkdir -p /var/docker/traccar/logs
    ```

1. **Get default traccar.xml:**
    ```bash
    docker run \
    --rm \
    --entrypoint cat \
    traccar/traccar:3.17 \
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
    -v /var/docker/traccar/logs:/opt/traccar/logs:rw \
    -v /var/docker/traccar/traccar.xml:/opt/traccar/conf/traccar.xml:ro \
    traccar/traccar:3.17
    ```

### Default JRE options:

- -Xms512m
- -Xmx512m
- -Djava.net.preferIPv4Stack=true
