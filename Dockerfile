FROM alpine

RUN apk add --update openssh \
    && rm  -rf /tmp/* /var/cache/apk/* \
    && mkdir /var/run/sshd \
    && sed -i "s/.*PasswordAuthentication.*/PasswordAuthentication no/g" /etc/ssh/sshd_config

ADD run.sh /
ENV AUTHORIZED_KEYS **None**
VOLUME /user

CMD ["sh", "-c", "/run.sh && /usr/sbin/sshd -D"]
