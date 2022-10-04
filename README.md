Traccar in Docker
---

**Traccar GPS Tracking System in Docker image.**

Official website: <https://www.traccar.org>  
DockerHub image: <https://hub.docker.com/r/traccar/traccar> ![](https://img.shields.io/docker/stars/traccar/traccar) ![](https://img.shields.io/docker/pulls/traccar/traccar)  
Maintainer: [Maxim Zalysin](https://github.com/magna-z)

## Available tags:
#### 5.X
- **5.4-alpine**, **5-alpine**, **alpine**, **5.4**, **5**, **latest** ![](https://img.shields.io/docker/image-size/traccar/traccar/5.4-alpine)
- **5.4-debian**, **5-debian**, **debian** ![](https://img.shields.io/docker/image-size/traccar/traccar/5.4-debian)
- **5.4-ubuntu**, **5-ubuntu**, **ubuntu** ![](https://img.shields.io/docker/image-size/traccar/traccar/5.4-ubuntu)
- **5.3-alpine**, **5.3**
- **5.3-debian**
- **5.3-ubuntu**
- **5.2-alpine**, **5.2**
- **5.2-debian**
- **5.2-ubuntu**
- **5.1-alpine**, **5.1**
- **5.1-debian**
- **5.1-ubuntu**
- **5.0-alpine**, **5.0**
- **5.0-debian**
- **5.0-ubuntu**
#### 4.X
- **4.15-alpine**, **4.15**
- **4.15-debian**
- **4.15-ubuntu**
- ...
- **4.0-alpine**, **4.0**
- **4.0-debian**
#### 3.X
- **3.17-alpine**, **3.17**
- **3.17-debian**
- **3.16-alpine**, **3.16**
- **3.16-debian**

## Available multi-platform images:
**Alpine based**: linux/amd64  
**Debian based**: linux/amd64, linux/arm64/v8  
**Ubuntu based**: linux/amd64, linux/arm/v7, linux/arm64/v8

## Container create example:
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
    traccar/traccar:latest
    ```

## Database
The default when executing the above `docker run` command is an internal H2 database but this should only be for basic use.  
The `docker run` command also doesn't create a mount point on the host for the data folder which will cause the database to be lost when the container is recreated. This point can be mitigated by adding the line `-v /var/docker/traccar/data:/opt/traccar/data:rw \` after `-v /var/docker/traccar/traccar.xml:/opt/traccar/conf/traccar.xml:ro \` but it will still be using the H2 database.  
The **recommended solution** for production use is to link to an external MySQL database and update the configuration `.xml`-file according to the [Traccar MySQL documentation](https://www.traccar.org/mysql/) and using the `docker run` command as-is.

## Default JVM options:
- `-Xms1g`
- `-Xmx1g`
- `-Djava.net.preferIPv4Stack=true`
