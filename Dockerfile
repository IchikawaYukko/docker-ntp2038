FROM	alpine:3.21

ENV	TZ UTC

COPY	chrony.conf /etc/chrony/chrony.conf
COPY	*.sh /

RUN	apk add chrony && chmod +x /*.sh

ENTRYPOINT	["/entrypoint.sh"]

CMD	["chronyd", "-dx"]

