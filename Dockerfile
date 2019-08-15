# common base
FROM python:3.6-alpine3.9 as base

# temporary image
FROM base as builder

# install packages
RUN apk add --no-cache --update \
gcc \
libffi-dev \
libxml2-dev \
musl-dev \
openssl-dev \
python3-dev \
&& rm -rf /var/cache/apk/*

RUN mkdir /builder
COPY requirements.txt /
RUN PYTHONUSERBASE=/builder pip install --user --no-cache-dir -r /requirements.txt

# final image
FROM base as riko

# metadata
LABEL maintainer="Stefan Fischer <sfischer13@ymail.com>"

# install packages
RUN apk add --no-cache --update \
bash \
shadow \
&& rm -rf /var/cache/apk/*

# copy files from previous stage
COPY --from=builder /builder /usr/local

# add non-root user
RUN groupadd docker \
&& useradd -g docker -m docker

# default command
COPY docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["runpipe", "--help"]

# default working directory
WORKDIR /home/docker/

# default user
USER docker
