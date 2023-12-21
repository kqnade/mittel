health_check() {
  # check if $MTL_DIR exists
  if [[ ! -n "$MTL_DIR" ]]; then
    Pather
  fi
  # check if $MTL_CONFIG_FILE exists
  if [[ ! -f "$MTL_CONFIG_FILE" ]]; then
    touch $MTL_CONFIG_FILE
  fi
  if [[ $MTL_DEV == true ]]; then
      echo "MTL_DEV is true"
      echo "MTL_DIR: $MTL_DIR"
      echo "MTL_CONFIG_FILE: $MTL_CONFIG_FILE"
      echo "MTL_LIB_DIR: $MTL_LIB_DIR"
      echo "MTL_CMD_DIR: $MTL_CMD_DIR"
      echo "MTL_UTILS_DIR: $MTL_UTILS_DIR"
  fi
}