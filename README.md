# Jacktrip for Docker

![Docker](https://github.com/noahbailey/jacktrip-docker/workflows/Docker/badge.svg)

This is an experimental build of JackTrip for use in containerized environments. 

Introduction to JackTrip: https://ccrma.stanford.edu/groups/soundwire/software/jacktrip/index.html

Documentation and examples:  https://ccrma.stanford.edu/docs/common/IETF.html

Code repository on GitHub: https://github.com/jacktrip/jacktrip

To run correctly, the `linux-generic` kernel should be used if running in AWS. The skinny default kernel does not include `snd-aloop` and `soundcore` modules.

Also make sure the system is capable of using the realtime scheduling features of the linux kernel. For more info, see: https://docs.docker.com/config/containers/resource_constraints/#configure-the-realtime-scheduler

## Preperation

    sudo modprobe snd-aloop

## Startup

    docker-compose build
    docker-compose up

## Testing

To launch the containers from the command line the realtime features must be passed through: 

    docker run -it --cap-add=sys_nice --ulimit rtprio=80 jacktrip-docker_jackd

    docker run -it --cap-add=sys_nice --ulimit rtprio=80 jacktrip-docker_jacktrip

