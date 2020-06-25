#!/bin/sh
set -e


# Default Vars
LINTER_RULES_PATH="${LINTER_RULES_PATH:-.github/linters}"

# Linter Vars
ERB_LINTER_FILE_NAME=".erb-lint.yml"
LINTER_PATH="$GITHUB_WORKSPACE/$LINTER_RULES_PATH/$ERB_LINTER_FILE_NAME"

sh -c "gem install erb_lint"

command="erblint --config ${LINTER_PATH} --lint-all"
cd "$GITHUB_WORKSPACE"
sh -c $command
