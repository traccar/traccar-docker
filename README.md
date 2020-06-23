Traccar in Docker
---

Traccar GPS Tracking System in Docker image.

Official website: <https://www.traccar.org>


[![](https://images.microbadger.com/badges/version/traccar/traccar:4.8.svg)](https://microbadger.com/images/traccar/traccar:4.8)
[![](https://images.microbadger.com/badges/image/traccar/traccar:4.8.svg)](https://microbadger.com/images/traccar/traccar:4.8)

### Available tags:
- **4.8-alpine**, **4-alpine**, **4.8**, **alpine**, **latest**
- **4.8-debian**, **4-debian**, **debian**
- **4.7-alpine**, **4.7**
- **4.7-debian**
- **4.6-alpine**, **4.6**
- **4.6-debian**
- **4.5-alpine**, **4.5**
- **4.5-debian**
- **4.4-alpine**, **4.4**
- **4.4-debian**
- **4.3-alpine**, **4.3**
- **4.3-debian**
- **4.2-alpine**, **4.2**
- **4.2-debian**
- **4.1-alpine**, **4.1**
- **4.1-debian**
- **4.0-alpine**, **4.0**
- **4.0-debian**
- **3.17-alpine**, **3.17**
- **3.17-debian**
- **3.16-alpine**, **3.16**
- **3.16-debian**

### Container create example:
1. **Create work directories:**
    ```bash
    mkdir -p /var/docker/traccar/logs
    ```

1. **Get default traccar.xml:**
    ```bash
    docker run \
    --rm \
    --entrypoint cat \
    traccar/traccar:latest \
    /opt/traccar/conf/traccar.xml > /var/docker/traccar/traccar.xml
    ```

1. **Edit traccar.xml:** <https://www.traccar.org/configuration-file/>

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
    -v /var/docker/traccar/data:/opt/traccar/data:rw \
    traccar/traccar:latest
    ```

### Default JVM options:
- -Xms512m
- -Xmx512m
- -Djava.net.preferIPv4Stack=true
