#!/bin/bash

podman create \
	-d \
	-p 10.192.122.1:53:53/tcp \
	-p 10.192.122.1:53:53/udp \
	-p 10.192.122.1:67:67/udp \
	-p 127.0.0.1:1081:80/tcp \
	--volume pihole_data:/etc/pihole/ \
	--volume pihole_dnsmasq:/etc/dnsmasq.d/ \
	--env DNS1=1.1.1.1 \
	--env DNS2=1.0.0.1 \
	--env WEBPASSWORD="" \
	--dns 127.0.0.1 \
	--name pihole \
	docker.io/pihole/pihole:v5.0
