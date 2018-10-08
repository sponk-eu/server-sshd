FROM alpine

RUN apt-get update && \
    apt-get upgrade -y \
    apt-get install -y openssh-server && \
    mkdir /var/run/sshd

ADD run.sh /
ENV AUTHORIZED_KEYS **None**
VOLUME /user

CMD ["sh", "-c", "/run.sh && /usr/sbin/sshd -D"]
