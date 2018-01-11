FROM alpine:3.6
WORKDIR /root
ENV lavender production

RUN set -x \
  && apk upgrade --no-cache \
  && apk --update add tzdata \
  && cp /usr/share/zoneinfo/Asia/Tokyo /etc/localtime \
  && apk del tzdata \
  && rm -rf /var/cache/apk/*


ADD ./cmd/main .
ADD ./view ./view


EXPOSE 8080

# Run it
ENTRYPOINT ["./main"]