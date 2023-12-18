test(){
  #help
  if [[ "$1" == help]]
    echo "Mittel Command: test"
    echo "Usage: mtl test"
    echo ""
    echo "Options:"
    echo "  none"
    echo ""
    echo "Description:"
    echo "  Test mtl"
    echo ""
    echo "Version: $MTL_VERSION"
    echo ""
  fi
  #run
  if [[ "$1" == "" ]]; then
    echo "Testing mtl..."
    echo ""
    echo "Version: $MTL_VERSION"
    echo ""
  fi
}