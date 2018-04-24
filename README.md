Traccar in Docker
---
Traccar GPS Tracking System in Docker image.

Official website: <https://www.traccar.org>  
Current version: **3.16**

### Current tags:

- **3.16-alpine**, **3.16**, **alpine** or **latest** ([alpine/Dockerfile](https://github.com/traccar/traccar-docker/blob/master/alpine/Dockerfile)) [![](https://images.microbadger.com/badges/image/traccar/traccar:alpine.svg)](https://microbadger.com/images/traccar/traccar:alpine)
- **3.16-debian**, **debian** ([debian/Dockerfile](https://github.com/traccar/traccar-docker/blob/master/debian/Dockerfile)) [![](https://images.microbadger.com/badges/image/traccar/traccar:debian.svg)](https://microbadger.com/images/traccar/traccar:debian)

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
    traccar/traccar \
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
    traccar/traccar
    ```
