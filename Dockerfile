FROM	alpine:3.21

ENV	TZ UTC

COPY	chrony.conf /etc/chrony/chrony.conf
COPY	*.sh /

RUN	apk add chrony && chmod +x /*.sh

ENTRYPOINT	["/entrypoint.sh"]

HEALTHCHECK	--interval=5m --timeout=2m --start-period=30s --retries=3 CMD ["sh", "-c", "ntpd -qddw -p ::1 2>&1|grep 'reply from ::1: offset:+' >> /healthcheck"]

EXPOSE	123/udp 323/udp
CMD	["chronyd", "-dx"]

