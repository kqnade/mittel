load_configfile() {
  # config file
  config_file=$1
  # load config file loop
  while read line; do
    # if line is not empty
    if [[ ! -z "$line" ]]; then
      # if line is not a comment
      if [[ ! "$line" =~ ^#.* ]]; then
        # split line by =
        IFS='=' read -ra config <<< "$line"
        # config key
        config_key=${config[0]}
        # config value
        config_value=${config[1]}
        # set config
        eval "$config_key='$config_value'"
      fi
    fi
  done < $config_file
}

reset_config() {
  # reset config
  MTL_DIR=""
  MTL_CONFIG_FILE=""
  MTL_LIB_DIR=""
  MTL_CMD_DIR=""
  MTL_UTILS_DIR=""
  MTL_DEV=""
}

load_config() {
  reset_config
  # config file
  config_file=$1
  # if config file exists
  if [[ -f "$config_file" ]]; then
    # load config file
    load_configfile $config_file
  fi
}