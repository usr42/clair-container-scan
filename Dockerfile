FROM alpine:latest
ADD ./bin /bin
RUN chmod a+x /bin/* \
    && apk --no-cache --update add \
        docker \
        jq
CMD scan_all_local_images.sh
