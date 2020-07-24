Traccar in Docker
---

Traccar GPS Tracking System in Docker image.

Official website: <https://www.traccar.org>  
DockerHub image: <https://hub.docker.com/r/traccar/traccar>

[![](https://images.microbadger.com/badges/version/traccar/traccar:4.9.svg)](https://microbadger.com/images/traccar/traccar:4.9)
[![](https://images.microbadger.com/badges/image/traccar/traccar:4.9.svg)](https://microbadger.com/images/traccar/traccar:4.9)

### Available tags:
- **\<branch-name\>-alpine**(for example: master-alpine),
  - all alpine images are multiarch
- **\<branch-name\>-debian**(for example: master-debian)

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
    traccar/traccar:latest
    ```

### Database
The default when executing the above `docker run` command is an internal H2 database but this should only be for basic use. 

The `docker run` command also doesn't create a mount point on the host for the data folder which will cause the database to be lost when the container is recreated. This point can be mitigated by adding the line `-v /var/docker/traccar/data:/opt/traccar/data:rw \` after `-v /var/docker/traccar/traccar.xml:/opt/traccar/conf/traccar.xml:ro \` but it will still be using the H2 database.

The **recommended solution** for production use is to link to an external MySQL database and update the configuration .xml file according to the [Traccar MySQL documentation](https://www.traccar.org/mysql/) and using the `docker run` command as-is.

### Default JVM options:
- -Xms512m
- -Xmx512m
- -Djava.net.preferIPv4Stack=true
