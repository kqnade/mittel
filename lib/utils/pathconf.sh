Pather(){
  if [[ $MTL_DEV == true ]]; then
    MTL_DIR="$PWD"
    MTL_CONFIG_FILE="$MTL_DIR/.conf"
    MTL_LIB_DIR="$MTL_DIR/lib"
    MTL_CMD_DIR="$MTL_LIB_DIR/cmd"
    MTL_UTILS_DIR="$MTL_LIB_DIR/utils"
  else
    MTL_DIR="$HOME/.mtl"
    MTL_CONFIG_FILE="$HOME/.conf"
    MTL_LIB_DIR="$MTL_DIR/lib"
    MTL_CMD_DIR="$MTL_LIB_DIR/cmd"
    MTL_UTILS_DIR="$MTL_LIB_DIR/utils"
  fi
}