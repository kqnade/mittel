load_pkgupdate() {
  # version checker
  source $MTL_UTILS_DIR/version.sh
  # update checker
  source $MTL_UTILS_DIR/update.sh
  # update
  update
}