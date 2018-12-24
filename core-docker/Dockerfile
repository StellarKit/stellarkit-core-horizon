FROM debian:latest as builder

ENV STELLAR_CORE_VERSION 10.1.0
ENV STELLAR_CORE_TAG v10.1.0
ENV BUILD_FROM_SRC 1

ADD apt-build /
RUN ["chmod", "+x", "/apt-build"]
RUN /apt-build

ADD install.sh /
RUN chmod +x /install.sh
RUN /install.sh

# -----------------------
FROM debian:latest

COPY --from=builder /usr/local/bin/stellar-core /usr/local/bin/stellar-core

ADD dependencies /
RUN ["chmod", "+x", "/dependencies"]
RUN /dependencies

RUN ["mkdir", "-p", "/opt/stellar"]

ADD build-config /usr/bin/build-config
RUN ["chmod", "+x", "/usr/bin/build-config"]

ADD launch.sh /
RUN ["chmod", "+x", "/launch.sh"]

ADD configs /configs

ADD entry.sh /
RUN ["chmod", "+x", "/entry.sh"]

EXPOSE 11625
EXPOSE 11626

ENTRYPOINT ["/entry.sh" ]
