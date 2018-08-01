FROM linuxserver/piwigo
MAINTAINER nick+docker@undergrid.org.uk

#install packages
RUN \
  echo "**** install packages ****" && \
  apk add --no-cache mediainfo ffmpeg exiftool

#ports and volumes
EXPOSE 80 443
VOLUME /config
VOLUME /webdav
