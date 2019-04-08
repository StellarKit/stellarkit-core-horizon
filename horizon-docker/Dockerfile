FROM golang:stretch as builder

ENV HORIZON_VERSION 0.17.4
ENV HORIZON_TAG horizon-v0.17.4

ENV BUILD_FROM_SRC 0

ADD install.sh /
RUN chmod +x /install.sh
RUN /install.sh

# -----------------------
FROM debian:latest

COPY --from=builder /usr/local/bin/horizon /usr/local/bin/

ADD apt-server /apt-server
RUN chmod +x /apt-server
RUN /apt-server

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
