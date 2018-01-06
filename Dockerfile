FROM debian:jessie

ENV STELLAR_CORE_VERSION 9.0.0-473-59482f9d
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

ADD start-core /
RUN ["chmod", "+x", "/start-core"]

ADD start-horizon /
RUN ["chmod", "+x", "/start-horizon"]

ADD configs /configs

ADD start /
RUN ["chmod", "+x", "/start"]

ADD init.sql /docker-entrypoint-initdb.d/

EXPOSE 5432
EXPOSE 8000
EXPOSE 11625
EXPOSE 11626

ENTRYPOINT ["/start" ]
