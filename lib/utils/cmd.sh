load_commands() {
  # commands dir
  commands_dir="$MTL_CMD_DIR"
  # for each file in commands dir
  for file in $commands_dir/*; do
    # source file
    source $file
  done
}

run_command() {
  # run command
  command=$1
  shift 1
  $command "$@"
}