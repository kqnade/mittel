echo "----------------------------------------"
echo "     Welcome to Mittel Installer!       "
echo "----------------------------------------"
echo ""
echo "This script will install Mittel on your system."
echo ""
echo "Press ENTER to continue or Ctrl-C to abort."
read -p ""
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
if [[ -d $HOME/.mtl ]]; then
  echo "Mittel already installed!"
  echo "Updating..."
  cd $HOME/.mtl
  git pull
  cd $HOME
  echo "Mittel updated!"
  exit 1
fi
git clone -b $MTL_BRANCH https://github.com/kqnade/mittel.git $HOME/.mtl


# --------- Config ---------
# add path to .bashrc or .zshrc or something
read -p "Do you want to add Mittel to your PATH? (y/n) " -n 1 -r
echo ""
SHELLNAME=$(basename $SHELL)
if [[ $REPLY =~ ^[Yy]$ ]]; then
  echo "Adding Mittel to PATH..."
  if [[ $SHELLNAME == "bash" ]]; then
    duppath=$(grep -c "export PATH=\$PATH:$HOME/.mtl/bin" $HOME/.bashrc)
    if [[ $duppath -gt 0 ]]; then
      echo "Mittel already added to PATH!"
      echo "Mittel not added to PATH."
      echo "You can add it manually by adding the following line to your .bashrc or .zshrc:"
      echo "  export PATH=\$PATH:$HOME/.mtl/bin"
    else
      echo "export PATH=\$PATH:$HOME/.mtl/bin" >> $HOME/.bashrc
      source $HOME/.bashrc
    fi
  fi
  if [[ $SHELLNAME == "zsh" ]]; then
    duppath=$(grep -c "export PATH=\$PATH:$HOME/.mtl/bin" $HOME/.zshrc)
    if [[ $duppath -gt 0 ]]; then
      echo "Mittel already added to PATH!"
      echo "Mittel not added to PATH."
      echo "You can add it manually by adding the following line to your .bashrc or .zshrc:"
      echo "  export PATH=\$PATH:$HOME/.mtl/bin"
    else
      echo "export PATH=\$PATH:$HOME/.mtl/bin" >> $HOME/.zshrc
      source $HOME/.zshrc
    fi
  fi
  if [[ $SHELLNAME == "fish" ]]; then
    duppath=$(grep -c "export PATH=\$PATH:$HOME/.mtl/bin" $HOME/.config/fish/config.fish)
    if [[ $duppath -gt 0 ]]; then
      echo "Mittel already added to PATH!"
      echo "Mittel not added to PATH."
      echo "You can add it manually by adding the following line to your .bashrc or .zshrc:"
      echo "  export PATH=\$PATH:$HOME/.mtl/bin"
    else
      echo "set -U fish_user_paths $HOME/.mtl/bin \$fish_user_paths" >> $HOME/.config/fish/config.fish
      source $HOME/.config/fish/config.fish
    fi
  else
    echo "Can't set PATH automatically."
    echo "Maybe you use a shell that is not bash, zsh or fish."
    echo "Look like you use $SHELLNAME."
    read -p "Setup custom path? (y/n) " -n 1 -r
    echo ""
    if [[ $REPLY =~ ^[Yy]$ ]]; then
      echo "Enter the path to your shell's config file:"
      read -p "Path: " -r
      echo ""
      if [[ ! -f $REPLY ]]; then
        echo "Error: file not found"
        exit 1
      fi
      if [[ ! -w $REPLY ]]; then
        echo "Error: file not writable"
        exit 1
      fi
      if [[ $(grep -c "export PATH=\$PATH:$HOME/.mtl/bin" $REPLY) -gt 0 ]]; then
        echo "Mittel already added to PATH!"
        echo "Mittel not added to PATH."
        echo "You can add it manually by adding the following line to your shell's config file:"
        echo "  export PATH=\$PATH:$HOME/.mtl/bin"
        exit 1
      fi
      echo "export PATH=\$PATH:$HOME/.mtl/bin" >> $REPLY
      echo "Mittel added to PATH!"
    else
      echo "Mittel not added to PATH."
      echo "You can add it manually by adding the following line to your shell's config file:"
      echo "  export PATH=\$PATH:$HOME/.mtl/bin"
    fi
  fi
  echo "Mittel added to PATH!"
else
  echo "Mittel not added to PATH."
  echo "You can add it manually by adding the following line to your .bashrc or .zshrc:"
  echo "  export PATH=\$PATH:$HOME/.mtl/bin"
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
