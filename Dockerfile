# syntax=docker/dockerfile:1

FROM ghcr.io/linuxserver/baseimage-selkies:ubuntunoble

# set version label
ARG BUILD_DATE
ARG VERSION
LABEL build_version="Linuxserver.io version:- ${VERSION} Build-date:- ${BUILD_DATE}"
LABEL maintainer="silktail4u"
# title
ENV TITLE=SlippiDolphin

RUN \
    apt-get update && \
    apt-get install -y software-properties-common && \
    rm -rf /var/lib/apt/lists/*
RUN echo "**** installing python ****" && \
    add-apt-repository ppa:deadsnakes/ppa && \
    apt update && \ 
    apt install -y python3.11
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
  libgtk-3-dev \
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
  git clone https://github.com/project-slippi/Ishiiruka
  COPY . .
  WORKDIR Ishiiruka/
  RUN curl https://sh.rustup.rs -sSf | sh -s -- -y && \
    export PATH="/root/.cargo/bin:$PATH"
  RUN git submodule update --init --recursive
  RUN \
  ./build-linux.sh [playback] && \
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

RUN ls
# ports and volumes
EXPOSE 3001

VOLUME /
