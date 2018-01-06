FROM stellar/base:latest

ENV STELLAR_CORE_VERSION 9.0.0-473-59482f9d
ENV HORIZON_VERSION 0.11.1

ADD dependencies /
RUN ["chmod", "+x", "/dependencies"]
RUN /dependencies

ADD install /
RUN ["chmod", "+x", "/install"]
RUN /install

RUN ["mkdir", "-p", "/opt/stellar"]

ADD build-config /
RUN ["chmod", "+x", "/build-config"]

ADD start-core /
RUN ["chmod", "+x", "/start-core"]

ADD start-horizion /
RUN ["chmod", "+x", "/start-horizion"]

ADD configs /
RUN /build-config /configs/stellar.cfg > /opt/stellar/stellar.cfg
RUN /build-config /configs/horizon.env > /opt/stellar/horizon.env

RUN /build-config /configs/stellar-testnet.cfg > /opt/stellar/stellar-testnet.cfg
RUN /build-config /configs/horizon-testnet.env > /opt/stellar/horizon-testnet.env

ADD start /
RUN ["chmod", "+x", "/start"]

EXPOSE 5432
EXPOSE 8000
EXPOSE 11625
EXPOSE 11626

ENTRYPOINT ["/start" ]
