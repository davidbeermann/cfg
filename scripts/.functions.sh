# This function is used to fetch a file
# and write the out to the file system.
# Requires for argument -O ... to be defined!
fetch_file()
{
  wget -q --show-progress --progress=bar:force:noscroll $@
}

# This function is used to fetch an url
# and pipe the output to another command.
fetch_data()
{
  fetch_file -O- $@
}

fetch_github_download_url()
{
  if [ -z "$1" -o -z "$2" ]; then
    echo "Missing arguments!"
    exit 1
  fi

  # https://gist.github.com/lukechilds/a83e1d7127b78fef38c2914c4ececc3c
  # https://stackoverflow.com/a/29457649
  fetch_data "https://api.github.com/repos/$1/releases/latest" \
    | grep "\"browser_download_url\": \"$2\"" \
    | sed -E 's/.*"([^"]+)".*/\1/'
}