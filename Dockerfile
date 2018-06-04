FROM alpine:latest
RUN chmod a+x /bin/* \
    && apk --no-cache --update add \
        docker \
        jq
ADD ./bin /bin
ENTRYPOINT ["entrypoint.sh"]
