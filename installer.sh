#! /usr/bin/env bash

# --------- Config ---------
read -p "Turn on Developer Mode? (y/n) " MTL_DEV
if [ "$MTL_DEV" == "y" ]; then
    MTL_DEV="true"
else
    MTL_DEV="false"
fi
if [ "$MTL_DEV" == "true" ]; then
  read -p "Where do you want to install Mittel (default: $HOME/.mittel)? " MTL_DIR
  read -p "Where do you want to install Mittel's config file (default: $HOME/.mtlrc)? " MTL_CONF
  read -p "Select branch (default: dev): " MTL_BRANCH
  if [ -z "$MTL_DIR" ]; then
    MTL_DIR="$HOME/.mittel"
  fi
  if [ -z "$MTL_CONF" ]; then
    MTL_CONF="$HOME/.mtlrc"
  fi
  if [ -z "$MTL_BRANCH" ]; then
    MTL_BRANCH="dev"
  fi
else
  MTL_DIR="$HOME/.mtl"
  MTL_CONF="$HOME/.mtlrc"
  MTL_BRANCH="main"
fi

echo "------------------------------------"
echo "     Mittel Install Config          "
echo "------------------------------------"
echo " MTL_DIR: $MTL_DIR"
echo " MTL_CONF: $MTL_CONF"
echo " MTL_BRANCH: $MTL_BRANCH"
echo " MTL_DEV: $MTL_DEV"
echo "------------------------------------"

read -p "Is this correct? (y/n) " -r
if [[ ! $REPLY =~ ^[Yy]$ ]]
then
  exit 1
fi

# --------- Install ---------
echo "Installing Mittel..."
echo "Cloning Mittel..."
git clone -b $MTL_BRANCH https://github.com/kqnade/mittel.git $MTL_DIR
echo "Configuring Mittel..."
touch $MTL_CONF
echo "export MTL_DIR=$MTL_DIR" >> $MTL_CONF
echo "export MTL_CONF=$MTL_CONF" >> $MTL_CONF
echo "export MTL_DEV=$MTL_DEV" >> $MTL_CONF
echo "export MTL_BRANCH=$MTL_BRANCH" >> $MTL_CONF

echo "Installing Mittel..."
shellname=$(basename $SHELL)
pathconf="\$PATH:$MTL_DIR/bin"
if [ "$shellname" == "zsh" ]; then
  shellrc=".zshrc"
elif [ "$shellname" == "bash" ]; then
  shellrc=".bashrc"
elif [ "$shellname" == "fish" ]; then
  shellrc=".config/fish/config.fish"
else
  echo "We can't detect your shell."
  read -p "Please enter your shell's config file name (default: .bashrc): " shellrc
  if [ -z "$shellrc" ]; then
    shellrc=".bashrc"
  fi
fi
if [! grep -q "$pathconf" "$HOME/$shellrc" ]; then
  echo "$pathconf" >> "$HOME/$shellrc"
fi

# --------- Finish ---------

echo "------------------------------------"
echo "     Mittel Install Complete        "
echo "------------------------------------"
echo " Mittel is installed at $MTL_DIR"
echo " Mittel's config file is at $MTL_CONF"
echo "------------------------------------"
echo " To run Mittel, run 'mtl'"
echo "------------------------------------"
echo " To uninstall Mittel, run 'mtl uninstall'"
echo "-------------------------------------"
echo " Thank you for installing Mittel!"
echo "-------------------------------------"
echo " Please report any issues at https://github.com/kqnade/mittel/issues"
echo "-------------------------------------"
echo " Mittel is licensed under the MIT License."
echo "-------------------------------------"
echo " Made with ❤️ by k47de"
echo "-------------------------------------"

