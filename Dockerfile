FROM stellar/base:latest

ENV STELLAR_CORE_VERSION 9.0.0-473-59482f9d
ENV HORIZON_VERSION 0.11.1

EXPOSE 5432
EXPOSE 8000
EXPOSE 11625
EXPOSE 11626

ADD dependencies /
RUN ["chmod", "+x", "dependencies"]
RUN /dependencies

ADD install /
RUN ["chmod", "+x", "install"]
RUN /install

RUN ["mkdir", "-p", "/opt/stellar"]
RUN ["touch", "/opt/stellar/.docker-ephemeral"]

RUN [ "adduser", \
  "--disabled-password", \
  "--gecos", "\"\"", \
  "--uid", "10011001", \
  "stellar"]

RUN ["ln", "-s", "/opt/stellar", "/stellar"]
RUN ["ln", "-s", "/opt/stellar/core/etc/stellar-core.cfg", "/stellar-core.cfg"]
RUN ["ln", "-s", "/opt/stellar/horizon/etc/horizon.env", "/horizon.env"]
ADD common /opt/stellar-default/common
ADD pubnet /opt/stellar-default/pubnet
ADD testnet /opt/stellar-default/testnet

RUN ["chmod", "+x", "/opt/stellar-default/common/core/bin/start"]
RUN ["chmod", "+x", "/opt/stellar-default/common/horizon/bin/start"]
RUN ["chmod", "+x", "/opt/stellar-default/common/horizon/bin/horizon"]
 
ADD start /
RUN ["chmod", "+x", "start"]

ENTRYPOINT ["/init", "--", "/start" ]
