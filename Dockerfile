FROM centos:8.3.2011
ENV container=docker

RUN set -ex \
 && dnf update -y \
 && dnf install -y vim wget net-tools iproute procps iputils unzip \
 && echo "TZ='Asia/Hong_Kong'; export TZ" >> /etc/profile \
 && ln -sf /usr/share/zoneinfo/Asia/Hong_Kong /etc/localtime \
 && mkdir /overture/bin -p \
 && mkdir /overture/data -p \
 && wget https://github.com/shawn1m/overture/releases/download/v1.7/overture-linux-amd64.zip -O /overture/overture-linux-amd64.zip \
 && unzip -d /overture/data -o /overture/overture-linux-amd64.zip \
 && mv /overture/data/overture-linux-amd64 /overture/bin \
 && dnf clean all \
 && chmod +x /overture/bin/overture-linux-amd64

WORKDIR /overture/data

ENV PATH=/overture/bin/:$PATH

CMD ["/overture/bin/overture-linux-amd64"]
