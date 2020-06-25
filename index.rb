
command = "erblint"
command += " --config #{ENV['DEFAULT_LINTER_RULES']}"
command += " --lint-all"

# --enable-all-linters Enable all known linters
# --enable-linters Linter[,Linter,....]
# --autocorrect Corrects offenses automatically

puts command

system("#{command}")
