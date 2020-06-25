FROM ruby:2.6.5-alpine

ENV LANG C.UTF-8
RUN apk add --no-cache libstdc++ libuv
RUN apk add --update build-base git nodejs


LABEL "com.github.actions.name"="Erb Linter"
LABEL "com.github.actions.description"="Run an Erb Linter on your Rails application"
LABEL "com.github.actions.icon"="filter"
LABEL "com.github.actions.color"="red"
LABEL "repository"="https://github.com/revans/erb-action"
LABEL "version"="v0.0.4"

COPY index.rb /action/index.rb
COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
