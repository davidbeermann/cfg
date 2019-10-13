echo "Install Node version manager"
echo "More info: https://github.com/nvm-sh/nvm"
echo "----------------------------------------"

# https://stackoverflow.com/a/26759734
if ! [ -x "$(command -v wget)" ]; then
  echo 'Error: wget is not installed.' >&2
  exit 1
fi

echo "1. Fetching latest release tag from GitHub"
# https://gist.github.com/lukechilds/a83e1d7127b78fef38c2914c4ececc3c
# https://stackoverflow.com/a/29457649
TAG=$(wget -O- -q --show-progress --progress=bar:force:noscroll https://api.github.com/repos/nvm-sh/nvm/releases/latest \
  | grep '"tag_name": ".*"' \
  | sed -E 's/.*"([^"]+)".*/\1/')

echo "2. Installing nvm $TAG"
wget -qO- "https://raw.githubusercontent.com/nvm-sh/nvm/$TAG/install.sh" | bash

exit 0
