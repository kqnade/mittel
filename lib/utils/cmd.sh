run_command() {
  local cmd=$1
  local args=$2
  local cmd_path=$MTL_CMD_DIR/$cmd.sh
  if [[ -f $cmd_path ]]; then
    source $cmd_path
    $cmd $args
  else
    echo "Command not found: $cmd"
    exit 1
  fi
  return $?
  # shellcheck disable=SC2181
  if [[ $? -ne 0 ]]; then
    echo "Command failed: $cmd"
    exit 1
  fi
  return 0
}