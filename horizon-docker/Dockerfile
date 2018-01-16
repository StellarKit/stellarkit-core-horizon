FROM golang:alpine as builder

ENV HORIZON_VERSION 0.11.1

ADD apk-build /apk-build
RUN chmod +x /apk-build
RUN /apk-build

ADD install.sh /
RUN chmod +x /install.sh
RUN /install.sh

FROM alpine:latest

COPY --from=builder /go/bin/horizon /usr/local/bin/horizon

ADD apk-server /apk-server
RUN chmod +x /apk-server
RUN /apk-server

RUN ["mkdir", "-p", "/opt/stellar"]

ADD build-config /usr/bin/build-config
RUN ["chmod", "+x", "/usr/bin/build-config"]

ADD launch.sh /
RUN ["chmod", "+x", "/launch.sh"]

ADD configs /configs

ADD entry.sh /
RUN ["chmod", "+x", "/entry.sh"]

EXPOSE 8000

ENTRYPOINT ["/entry.sh" ]
