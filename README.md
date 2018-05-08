# undergrid/piwigo-ffmepg

Piwigo is a photo gallery software for the web that comes with powerful features to publish and manage your collection of pictures.

This version is based on linuxserver/piwigo but includes the mediainfo and ffmpeg libraries.

[![piwigo](https://raw.githubusercontent.com/linuxserver/docker-templates/master/linuxserver.io/img/piwigo-banner.png)][appurl]

## Usage

```
docker create \
--name=piwigo \
-v /etc/localtime:/etc/localtime:ro \
-v <path to data>:/config \
-e PGID=<gid> -e PUID=<uid>  \
-e TZ=<timezone> \
-p 80:80 \
linuxserver/piwigo
```

## Parameters

`The parameters are split into two halves, separated by a colon, the left hand side representing the host and the right the container side.
For example with a port -p external:internal - what this shows is the port mapping from internal to external of the container.
So -p 8080:80 would expose port 80 from inside the container to be accessible from the host's IP on port 8080
http://192.168.x.x:8080 would show you what's running INSIDE the container on port 80.`


* `-p 80` - webui port *see note below*
* `-v /etc/localtime` for timesync - *optional*
* `-v /config` - folder to store appdata and config file for piwigo
* `-e PGID` for GroupID - see below for explanation
* `-e PUID` for UserID - see below for explanation
* `-e TZ` for setting timezone information, eg Europe/London

It is based on alpine linux with s6 overlay, for shell access whilst the container is running do `docker exec -it piwigo /bin/bash`.

### User / Group Identifiers

Sometimes when using data volumes (`-v` flags) permissions issues can arise between the host OS and the container. We avoid this issue by allowing you to specify the user `PUID` and group `PGID`. Ensure the data volume directory on the host is owned by the same user you specify and it will "just work" ™.

In this instance `PUID=1001` and `PGID=1001`. To find yours use `id user` as below:

```
  $ id <dockeruser>
    uid=1001(dockeruser) gid=1001(dockergroup) groups=1001(dockergroup)
```

## Setting up the application

You must create a user and database for piwigo to use in a mysql/mariadb server. In the setup page for database, use the ip address rather than hostname....

A basic nginx configuration file can be found in /config/nginx/site-confs , edit the file to enable ssl (port 443 by default), set servername etc..
Self-signed keys are generated the first time you run the container and can be found in /config/keys , if needed, you can replace them with your own.

The easiest way to edit the configuration file is to enable local files editor from the plugins page and use it to configure email settings etc....


