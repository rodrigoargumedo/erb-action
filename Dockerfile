FROM ruby:2.6.5-alpine

ENV LANG C.UTF-8
RUN apk add --no-cache libstdc++ libuv
RUN apk add --update build-base git nodejs


LABEL "com.github.actions.name"="Erb Linter"
LABEL "com.github.actions.description"="Run an Erb Linter on your Rails application"
LABEL "com.github.actions.icon"="filter"
LABEL "com.github.actions.color"="red"
LABEL "repository"="https://github.com/revans/erb-action"
LABEL "version"="v0.0.3"

# GLOBALS
DEFAULT_RULES_LOCATION='/action/lib/.automation'
ENV LINTER_RULES_PATH='.github/linters'
DEFAULT_RULES_PATH='.erb-lint.yml'
DEFAULT_LINTER_RULES="$DEFAULT_RULES_LOCATION/$DEFAULT_RULES_PATH"

COPY index.rb /action/index.rb
COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
