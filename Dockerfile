FROM alpine:3.4

VOLUME /data

EXPOSE 6800

ADD files/ /conf-copy/
ADD files/start.sh /conf/
RUN chmod +x /conf/start.sh

ENTRYPOINT [ "/conf/start.sh" ]
CMD aria2c --conf-path=/conf/aria2.conf

RUN apk add --update --no-cache aria2 && rm -rf /var/cache/apk/*