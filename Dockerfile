FROM ubuntu:16.04
LABEL maintainer="Loy B. <lonord.b@gmail.com>"
COPY script/start.sh /start.sh
COPY script/stop.sh /stop.sh
COPY soft-router-scripts /soft-router-scripts
COPY bin /tmp_bin
RUN chmod +x /start.sh && chmod +x /stop.sh \
	&& /soft-router-scripts/install.sh && rm -rf /soft-router-scripts \
	&& cp /tmp_bin/$(arch)/docker-init /docker-init && rm -rf /tmp_bin \
	&& apt-get update \
	&& apt-get install -y dnsmasq bridge-utils iptables hostapd net-tools \
	&& rm -rf /var/lib/apt/lists/*
CMD [ "/docker-init", "/start.sh", "/stop.sh" ]