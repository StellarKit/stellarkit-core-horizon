FROM debian:stretch

ENV STELLAR_CORE_VERSION 9.0.1-487-df347396

ADD dependencies /
RUN ["chmod", "+x", "/dependencies"]
RUN /dependencies

ADD install.sh /
RUN ["chmod", "+x", "/install.sh"]
RUN /install.sh

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
