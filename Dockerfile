# syntax=docker/dockerfile:1

FROM ghcr.io/linuxserver/baseimage-selkies:ubuntunoble

# set version label
ARG BUILD_DATE
ARG VERSION
LABEL build_version="Linuxserver.io version:- ${VERSION} Build-date:- ${BUILD_DATE}"
LABEL maintainer="thelamer"
COPY setup.sh setup.sh
# title
ENV TITLE=Dolphin

RUN \
    apt-get update && \
    apt-get install -y software-properties-common && \
    rm -rf /var/lib/apt/lists/*
RUN \
  echo "**** add icon ****" && \
  curl -o \
    /usr/share/selkies/www/icon.png \
    https://raw.githubusercontent.com/linuxserver/docker-templates/master/linuxserver.io/img/dolphin-logo.png && \
  echo "**** install packages ****" && \
  apt-get update && \
  apt-get install -y --no-install-recommends \
  cmake \
  pkg-config \
  git \
  libao-dev \
  libasound2-dev \
  libavcodec-dev \
  libavformat-dev \
  libbluetooth-dev \
  libenet-dev \
  libgtk2.0-dev \
  liblzo2-dev \
  libminiupnpc-dev \
  libopenal-dev \
  libpulse-dev \
  libreadline-dev \
  libsfml-dev \
  libsoil-dev \
  libsoundtouch-dev \
  libswscale-dev \
  libusb-1.0-0-dev \
  libwxgtk3.2-dev \
  libxext-dev \
  libxrandr-dev \
  portaudio19-dev \
  zlib1g-dev \
  libudev-dev \
  libevdev-dev \
  libmbedtls-dev \
  libcurl4-openssl-dev \
  libegl1-mesa-dev \
  libpng-dev \
  qtbase5-private-dev \
  libxxf86vm-dev \
  x11proto-xinerama-dev \
  build-essential \
  git \ 
  cmake \
  ffmpeg \
  libavcodec-dev \
  libavformat-dev \
  libavutil-dev \
  libswscale-dev \
  libevdev-dev \
  libusb-1.0-0-dev \
  libxrandr-dev \
  libxi-dev \
  libpangocairo-1.0-0 \
  qt6-base-private-dev \
  libqt6svg6-dev \
  libbluetooth-dev \
  libasound2-dev \
  libpulse-dev \
  libgl1-mesa-dev \
  libcurl4-openssl-dev && \
  echo "**** starting FM-Slippi install (NO NETPLAY) ****" && \
  sh ./setup.sh && \
  echo "**** cleanup ****" && \
  printf \
    "Linuxserver.io version: ${VERSION}\nBuild-date: ${BUILD_DATE}" \
    > /build_version && \
  apt-get autoclean && \
  rm -rf \
    /config/.cache \
    /var/lib/apt/lists/* \
    /var/tmp/* \
    /tmp/*
    
RUN ls
# add local files
COPY /root /

# ports and volumes
EXPOSE 3001

VOLUME /config
