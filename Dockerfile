FROM ubuntu:16.04

RUN apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get -y install strongswan iptables uuid-runtime ndppd openssl

ADD ./etc/* /etc/
ADD ./bin/* /usr/bin/

VOLUME /etc

# http://blogs.technet.com/b/rrasblog/archive/2006/06/14/which-ports-to-unblock-for-vpn-traffic-to-pass-through.aspx
EXPOSE 500/udp 4500/udp

CMD /usr/bin/start-vpn
