FROM ubuntu:20.04

RUN dpkg --add-architecture i386 && \
    apt-get update -y && \
    apt-get install -y curl wget file tar bzip2 gzip unzip bsdmainutils python3 util-linux ca-certificates binutils bc jq tmux netcat lib32gcc1 lib32stdc++6 libsdl2-2.0-0:i386 cpio distro-info nano && \
    echo steam steam/question select "I AGREE" | debconf-set-selections && \
    echo steam steam/license note '' | debconf-set-selections && \
    apt-get install -y steamcmd

RUN adduser acserver

WORKDIR /tmp/acserver/

COPY acserver ./
COPY lgsm/ ./lgsm/
COPY .local/ .local/
COPY .steam/ .steam/

COPY entrypoint.sh /opt/
COPY serverfiles/ ./serverfiles/

EXPOSE 9600/tcp
EXPOSE 8081/tcp
EXPOSE 9600/udp

USER acserver
# CMD tail -f /dev/null

WORKDIR /home/acserver
# ENTRYPOINT []
CMD ["/opt/entrypoint.sh"]
