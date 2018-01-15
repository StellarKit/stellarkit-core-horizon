FROM ubuntu:latest as builder

ADD apt-build /
RUN ["chmod", "+x", "/apt-build"]
RUN /apt-build

# deploy stellar-core binary
RUN mkdir -p /go/src/github.com/stellar/ \
    && git clone --depth 1 --branch master https://github.com/stellar/stellar-core /stellar-core \
    && cd /stellar-core \
    && git submodule init \
    && git submodule update \
    && ./autogen.sh \
    && ./configure \
    && make \
    && make install


FROM ubuntu:latest

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
