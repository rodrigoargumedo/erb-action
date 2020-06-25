#!/bin/sh
set -e

# GLOBALS
DEFAULT_RULES_LOCATION='/action/lib/.automation'                    # Default rules files location
LINTER_RULES_PATH="${LINTER_RULES_PATH:-.github/linters}"           # Linter Path Directory
DEFAULT_RULES_PATH='.erb-lint.yml'
DEFAULT_LINTER_RULES="$DEFAULT_RULES_LOCATION/$DEFAULT_RULES_PATH"

gem install erb_lint
ruby /action/index.rb
