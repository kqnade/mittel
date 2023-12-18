help() {
  if [[ "$1" == "" ]]; then
    echo "Usage: mtl [options] [command]"
    echo ""
    echo "Options:"
    echo "  -h, --help    Show help message"
    echo "  -v, --version    Show version"
    echo "Commands:"
    echo "  help, -h, --help    Show this help message"
    echo "  version, -v, --version    Show version"
    echo "  init    Initialize mtl"
    echo "  add [name]    Add a new package"
    echo "  list    List all packages"
    echo "  remove [name]    Remove a package"
    echo "  update [name]    Update a package"
    echo "  search [name]    Search for a package"
    echo ""
    echo "Version: $MTL_VERSION"
    echo ""
  fi
  # has $1 arg, check $MTL_CMD_DIR/$1.sh file exists
  if [[ -f "$MTL_CMD_DIR/$1.sh" ]]; then
    # run $1 command help
    $1 help
  else
    # show error
    echo "Error: command '$1' not found"
    echo ""
    echo "Usage: mtl [options] [command]"
    echo ""
    echo "Options:"
    echo "  -h, --help    Show help message"
    echo "  -v, --version    Show version"
    echo "Commands:"
    echo "  help, -h, --help    Show this help message"
    echo "  version, -v, --version    Show version"
    echo "  init    Initialize mtl"
    echo "  add [name]    Add a new package"
    echo "  list    List all packages"
    echo "  remove [name]    Remove a package"
    echo "  update [name]    Update a package"
    echo "  search [name]    Search for a package"
    echo ""
    echo "Version: $MTL_VERSION"
    echo ""
  fi

}
