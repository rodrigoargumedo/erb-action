#!/bin/sh
set -e


# Default Vars
DEFAULT_RULES_LOCATION="/action/lib/.automation"
LINTER_RULES_PATH="${LINTER_RULES_PATH:-.github/linters}"

# Linter Vars
FILE_NAME=".erb-lint.yml"
FILE_LOCATION="$DEFAULT_RULES_LOCATION/$FILE_NAME"

echo "Checking for Rules File..."

if [ -f "$GITHUB_WORKSPACE/$LINTER_RULES_PATH/$FILE_NAME" ]; then
  echo "----------------------------------------------"
  echo "User provided file:[$FILE_NAME], setting rules file..."
  ####################################
  # Copy users into default location #
  ####################################
  cp "$GITHUB_WORKSPACE/$LINTER_RULES_PATH/$FILE_NAME" "$FILE_LOCATION" 2>&1
else
  echo "  -> Codebase does NOT have file:[$LINTER_RULES_PATH/$FILE_NAME], using Default rules at:[$FILE_LOCATION]"
fi

sh -c "gem install erb_lint"

command="erblint --config ${FILE_LOCATION} --lint-all"
cd "$GITHUB_WORKSPACE"
sh -c $command
