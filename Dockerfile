FROM ubuntu:xenial
ARG VNC_PASSWORD=secret
ENV VNC_PASSWORD=${VNC_PASSWORD} \
    DEBIAN_FRONTEND=noninteractive

WORKDIR /root

RUN apt-get update && apt-get install -y wget unzip \
        supervisor \
        openssh-server \
        dbus-x11 x11-utils x11vnc xvfb \
        dwm suckless-tools dmenu stterm \
 && wget https://github.com/missionpinball/mpf-debian-installer/archive/dev.zip \
 && unzip /root/dev.zip \
 && cd mpf-debian-installer-dev \
 && chmod +x install \
 && ./install \
 && cd /root \
 && rm /root/dev.zip \
 && rm -rf /root/mpf-debian-installer-dev \
 && mkdir -p /etc/supervisor/conf.d \
 && x11vnc -storepasswd $VNC_PASSWORD /etc/vncsecret \
 && chmod 444 /etc/vncsecret

COPY supervisord.conf /etc/supervisor/conf.d
EXPOSE 5900
CMD ["/usr/bin/supervisord","-c","/etc/supervisor/conf.d/supervisord.conf"]

