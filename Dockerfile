FROM alpine

RUN apk add --update openssh \
    && rm  -rf /tmp/* /var/cache/apk/* \
    && mkdir /var/run/sshd \
    && sed -i "s/.*PasswordAuthentication.*/PasswordAuthentication no/g" /etc/ssh/sshd_config \
    && sed -i "s/.*#AllowTcpForwarding.*/AllowTcpForwarding yes/g" /etc/ssh/sshd_config \
    && sed -i "s/.*#GatewayPorts.*/GatewayPorts yes/g" /etc/ssh/sshd_config \
    && sed -i "s/.*#TCPKeepAlive.*/TCPKeepAlive yes/g" /etc/ssh/sshd_config

ADD run.sh /
ENV AUTHORIZED_KEYS **None**
VOLUME /user

CMD ["sh", "-c", "/run.sh && /usr/sbin/sshd -D"]
