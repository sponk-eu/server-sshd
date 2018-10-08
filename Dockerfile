FROM alpine

RUN apk add --update openssh \
    && rm  -rf /tmp/* /var/cache/apk/* \
    && mkdir /var/run/sshd \
    && ssh-keygen -f /etc/ssh/ssh_host_rsa_key -N '' -t rsa \
    && ssh-keygen -f /etc/ssh/ssh_host_dsa_key -N '' -t dsa

ADD run.sh /
ENV AUTHORIZED_KEYS **None**
VOLUME /user

CMD ["sh", "-c", "/run.sh && /usr/sbin/sshd -D"]
