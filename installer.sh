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
    MTL_DIR="$HOME/.mtldev"
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
echo "      Mittel Install Config         "
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
if [ -d "$MTL_DIR" ]; then
  echo "Mittel is already installed."
  cd $MTL_DIR
  git pull origin $MTL_BRANCH
  cd -
  exit 0
fi
git clone -b $MTL_BRANCH https://github.com/kqnade/mittel.git $MTL_DIR
echo "Configuring Mittel..."
if [ -f "$MTL_CONF" ]; then
  rm $MTL_CONF
fi
touch $MTL_CONF
echo "MTL_DIR=$MTL_DIR" >> $MTL_CONF
echo "MTL_BRANCH=$MTL_BRANCH" >> $MTL_CONF
echo "MTL_DEV=$MTL_DEV" >> $MTL_CONF


echo "Installing Mittel..."
shellname=$(basename $SHELL)
pathconf="\$PATH:$MTL_DIR/bin"
if [ "$shellname" == "zsh" ]; then
  shellrc="$HOME/.zshrc"
elif [ "$shellname" == "bash" ]; then
  shellrc="$HOME/.bashrc"
elif [ "$shellname" == "fish" ]; then
  shellrc="$HOME/.config/fish/config.fish"
else
  echo "We can't detect your shell."
  read -p "Please enter your shell's config file name (default: .bashrc): " shellrc
  if [ -z "$shellrc" ]; then
    shellrc="$HOME/.bashrc"
  fi
fi

chmod +x $MTL_DIR/bin/mtl

# dup path check
if grep -q "$pathconf" "$shellrc"; then
  echo "Mittel is already installed."
else
  echo "export PATH=$pathconf" >> $shellrc
  echo "Mittel is installed."
fi

# --------- Finish ---------

echo "-----------------------------------------"
echo "        Mittel Install Complete          "
echo "-----------------------------------------"
echo "  Mittel is installed at $MTL_DIR        "
echo "  Mittel's config file is at $MTL_CONF   "
echo "-----------------------------------------"
echo "For more info, visit: https://mtl.k4na.de"
echo "-----------------------------------------"
echo ""
echo "-----------------------------------------"
echo "  Developed by k47de with <3 and coffee  "
echo "-----------------------------------------"
echo ""
echo "-----------------------------------------"
echo "  If you like Mittel, consider starring  "
echo "  the project on GitHub. Thank you!      "
echo "-----------------------------------------"
echo ""

exec $SHELL