FROM ruby:2.6.5-alpine

ENV LANG C.UTF-8
RUN apk add --no-cache libstdc++ libuv
RUN apk add --update build-base git nodejs


LABEL "repository"="https://github.com/revans/erb-action"
LABEL "version"="0.0.1"

COPY index.rb /action/index.rb
COPY README.md LICENSE entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh"]
