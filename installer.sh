echo "----------------------------------------"
echo "     Welcome to Mittel Installer!       "
echo "----------------------------------------"
echo ""
echo "This script will install Mittel on your system."
echo ""
echo "Press ENTER to continue or Ctrl-C to abort."
read
echo ""
echo "Installing..."

# --------- Version Selection ---------
# select version
echo "Select a version to install:"
echo "  1) Stable (main branch)"
echo "  2) Beta (beta branch)"
echo "  3) Dev (not recommended / dev branch)"
echo ""
read -p "Version: " -n 1 -r
echo ""
if [[ $REPLY =~ ^[1-3]$ ]]; then
  if [[ $REPLY == 1 ]]; then
    MTL_BRANCH="main"
  fi
  if [[ $REPLY == 2 ]]; then
    MTL_BRANCH="beta"
  fi
  if [[ $REPLY == 3 ]]; then
    MTL_BRANCH="dev"
  fi
else
  echo "Error: invalid version"
  exit 1
fi

# --------- Download ---------
# download
echo "Downloading Mittel..."
echo ""
git clone -b $MTL_BRANCH https://github.com/kqnade/mittel.git $HOME/.mtl


# --------- Config ---------
# add path to .bashrc or .zshrc or something
read -p "Do you want to add Mittel to your PATH? (y/n) " -n 1 -r
echo ""
if [[ $REPLY =~ ^[Yy]$ ]]; then
  echo "Adding Mittel to PATH..."
  if [[ -f "$HOME/.bashrc" ]]; then
    echo "export PATH=\$PATH:$HOME/.mtl/bin" >> $HOME/.bashrc
  fi
  if [[ -f "$HOME/.zshrc" ]]; then
    echo "export PATH=\$PATH:$HOME/.mtl/bin" >> $HOME/.zshrc
  fi
  echo "Mittel added to PATH!"
fi

echo "----------------------------------------"
echo "     Mittel Installer Finished!         "
echo "----------------------------------------"
echo ""
echo "Mittel is now installed on your system."
echo ""
echo "To get started, type 'mtl' in your terminal."
echo ""
echo "For more information, visit the Mittel website:"
echo "  https://mtl.k4na.de"
echo ""
echo "Thank you for installing Mittel!"
echo ""
