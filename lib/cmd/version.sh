version(){
  if [[ $1 == "help" ]]; then
    echo "Mittel Command: version"
    echo "Usage: mtl version"
    echo ""
    echo "Options:"
    echo "  none"
    echo ""
    echo "Description:"
    echo "  Show mtl version"
    echo ""
    echo "Version: $MTL_VERSION"
    echo ""
  fi 
  if [[ $1 == "" ]]; then
    echo "Mittel version $MTL_VERSION"
  fi
}