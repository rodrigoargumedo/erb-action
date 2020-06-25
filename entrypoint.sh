#!/bin/sh
set -e

DEFAULT_WORKSPACE="${DEFAULT_WORKSPACE:-/tmp/lint}"
GITHUB_WORKSPACE="$DEFAULT_WORKSPACE"

# Default Vars
DEFAULT_LINTER_RULES="/action/lib/.automation"
LINTER_RULES_PATH="${LINTER_RULES_PATH:-.github/linters}"

# Linter Vars
ERB_LINTER_FILE_NAME=".erb-lint.yml"
ERB_LINTER_RULES="$DEFAULT_LINTER_RULES/$ERB_LINTER_FILE_NAME"

if [ -f "$GITHUB_WORKSPACE/$LINTER_RULES_PATH/$ERB_LINTER_FILE_NAME" ]; then
  echo "----------------------------------------------"
  echo "User provided file:[$ERB_LINTER_FILE_NAME], setting rules file..."
  ####################################
  # Copy users into default location #
  ####################################
  cp "$GITHUB_WORKSPACE/$LINTER_RULES_PATH/$ERB_LINTER_FILE_NAME" "$ERB_LINTER_RULES" 2>&1
else
  echo "  -> Codebase does NOT have file:[$LINTER_RULES_PATH/$ERB_LINTER_FILE_NAME], using Default rules at:[$ERB_LINTER_RULES]"
fi

sh -c "gem install erb_lint"

command="erblint --config ${ERB_LINTER_RULES} --lint-all"
cd "$GITHUB_WORKSPACE"
sh -c $command
