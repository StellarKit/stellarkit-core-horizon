FROM debian:stretch

ENV HORIZON_VERSION 0.11.1

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

EXPOSE 8000

ENTRYPOINT ["/entry" ]
