FROM golang:alpine as builder

apk update
apk add curl git wget mercurial make gcc musl-dev linux-headers

# build horizon
RUN mkdir -p /go/src/github.com/stellar/ \
    && git clone --depth 1 --branch master https://github.com/stellar/go.git /go/src/github.com/stellar/go \
    && cd /go/src/github.com/stellar/go \
    && curl https://glide.sh/get | sh \
    && glide install \
    && go install github.com/stellar/go/services/horizon

# ------------------------------------

FROM debian:stretch

COPY --from=builder /go/bin/horizon /usr/local/bin/horizon

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

EXPOSE 8000

ENTRYPOINT ["/entry.sh" ]
