#!/bin/sh
set -e

DEFAULT_LINTER_RULES="/action/lib/.automation"
ERB_LINTER_FILE_NAME=".erb-lint.yml"
ERB_LINTER_RULES="$DEFAULT_LINTER_RULES/$ERB_LINTER_FILE_NAME"

command="erblint --config ${ERB_LINTER_RULES} --lint-all"

sh -c "cp '$GITHUB_WORKSPACE/$LINTER_RULES_PATH/$FILE_NAME' '$ERB_LINTER_RULES' 2>&1"
sh -c "gem install erb_lint"
sh -c $command
