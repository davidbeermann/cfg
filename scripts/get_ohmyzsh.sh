echo "Install Oh My ZSH!"
echo "More info: https://ohmyz.sh/"
echo "----------------------------"

# https://stackoverflow.com/a/26759734
if ! [ -x "$(command -v curl)" ]; then
  echo 'Error: curl is not installed.' >&2
  exit 1
fi

echo "1. Installing Z shell"
sudo apt update --quiet && sudo apt install --assume-yes --fix-broken zsh
BINARY=$(which zsh)
VERSION=$(zsh ---version)
echo "Installed binary: $BINARY ($VERSION)"

echo "2. Make Zsh the default shell"
chsh -s $(which zsh)

echo "3. Installing Oh My ZSH!"
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# https://denysdovhan.com/spaceship-prompt/
# https://github.com/denysdovhan/spaceship-prompt#oh-my-zsh
echo "4. Install Zsh spaceship prompt"
# 
ZSH_CUSTOM="~/.oh-my-zsh"
git clone https://github.com/denysdovhan/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt"
ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"

echo "Update .zshrc manually and add:"
echo "ZSH_THEME=\"spaceship\""
echo ""
echo "Then log out and back in"
echo ""

exit 0
