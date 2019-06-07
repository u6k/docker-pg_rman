FROM alpine:latest
LABEL maintainer "mecab <mecab@misosi.ru>"

ARG RMAN_VER=1.3.8
ENV PACKAGE_URL https://github.com/ossc-db/pg_rman/archive/V${RMAN_VER}.tar.gz

ENV PGDATA /pg_data
ENV BACKUP_PATH /backup
VOLUME ["/pg_data", "/backup"]

WORKDIR /build

RUN apk --no-cache add postgresql-libs postgresql-dev linux-pam-dev \
                       libedit-dev zlib-dev \
    && apk add --no-cache --virtual build-dependencies \
                                    curl build-base \
    && echo ${PACKAGE_URL} \
    && curl -SL ${PACKAGE_URL} | \
       tar -zxv --strip-components=1 \
    && make \
    && make install \
    && cd / \
    && rm -rf /build \
    && apk del build-dependencies --purge

WORKDIR /
COPY ./entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
