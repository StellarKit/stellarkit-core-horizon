FROM debian:stretch

ENV STELLAR_CORE_VERSION 9.0.1-478-226ba55a

ADD dependencies /
RUN ["chmod", "+x", "/dependencies"]
RUN /dependencies

ADD install /
RUN ["chmod", "+x", "/install"]
RUN /install

RUN ["mkdir", "-p", "/opt/stellar"]

ADD build-config /usr/bin/build-config
RUN ["chmod", "+x", "/usr/bin/build-config"]

ADD launch /
RUN ["chmod", "+x", "/launch"]

ADD configs /configs

ADD entry /
RUN ["chmod", "+x", "/entry"]

ADD postgres-docker/.pgpass /

EXPOSE 11625
EXPOSE 11626

ENTRYPOINT ["/entry" ]
