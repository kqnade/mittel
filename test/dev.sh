test(){
  #help
  if [[ "$1" == help]]; then
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
  while [[ "$1" != "" ]]; do
    case $1 
      in 
      *)
        echo "Args tester: $1"
        shift 1
        ;;
    esac
  done
}