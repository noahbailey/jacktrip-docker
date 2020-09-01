FROM ubuntu:focal 

# => Stage 1: System prereqs
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive \
    TZ=etc/UTC \
    apt-get install -y \
        alsa-base alsa-utils \
        jackd2 && \
    echo "@audio  -  rtprio  99" | tee -a /etc/security/limits.conf

# => Run stage: 
ENTRYPOINT exec jackd --verbose -d dummy 
