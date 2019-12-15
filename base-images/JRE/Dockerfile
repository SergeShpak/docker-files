FROM ssh-docker-files/debian:1.0
LABEL maintainer "Serge Shpak <serge.v.shpak@gmail.com>"

RUN mkdir -p /usr/share/man/man1 \
    && apt-get update \
    && apt-get install -y \
        default-jre \
    && rm -rf /var/lib/apt/lists/*