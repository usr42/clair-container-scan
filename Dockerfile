FROM alpine:latest
ADD ./bin /bin
RUN chmod a+x /bin/* \
    && apk --no-cache --update add \
        docker \
        jq
ENTRYPOINT ["entrypoint.sh"]
