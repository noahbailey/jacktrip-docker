FROM ubuntu:focal 

# => Stage 1: System prereqs
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive \
    TZ=etc/UTC \
    apt-get install -y \
    build-essential git meson ninja-build \
	qt5-qmake libjack-dev libjack0 pkg-config uuid-dev \
	qtdeclarative5-dev \
	librtaudio-dev \
    jackd 

# => Stage 2: prepare sources
RUN git clone --depth 1 --branch v1.2.1 https://github.com/jacktrip/jacktrip.git

# => Stage 3: Build
RUN cd jacktrip && \
    mkdir -p builddir && \
    meson builddir && \
    ninja -C builddir && \
    ninja -C builddir install

# => Stage 4: Cleanup build prereqs
RUN apt-get remove -y \
    build-essential git \
    meson ninja-build \
    qt5-qmake qtdeclarative5-dev \
    pkg-config uuid-dev && \
    apt-get autoremove -y && \
    apt-get autoclean -y

# => Run stage: 
ENTRYPOINT exec jacktrip -S
