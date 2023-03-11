# go to git root directory
## @source: http://stackoverflow.com/a/957978/1048479
function groot() {
  cd "$(git rev-parse --show-toplevel)"
}

# base64 encode a file, The result will be copied to the clipboard (macos only)
## @arg file_path: the path to the file you want to base64 encode
## @source: @mathias-bynens comment to  https://superuser.com/a/120815/146376
base64() {
  openssl base64 < $1 | tr -d '\n' | pbcopy
}

# make a directory and cd into it
## @arg directory: the directory to create and cd into
## @source: https://theunixgeek.blogspot.com/2009/02/merging-mkdir-and-cd.html
mcd() { [ -n "$1"  ] && mkdir -p "$1" && cd "$1";  }

# Search Google for terms (macos only)
## @arg search_term: the search term to search for
## @source: https://superuser.com/questions/47192/google-search-from-linux-terminal
google() {
    search=""
    for term in $*; do
        search="$search%20$term"
    done
    $open "http://www.google.com/search?q=$search"
}

# Start an http server in same directory
## @arg port=3000: the port to use when starting the server
serve() {
  if [[ -z "$1" ]]; then
      echo "No port supplied. Using 3000"
      PORT=3000
  else
    PORT="$1"
  fi
  echo "\033[38;5;148m Starting on $PORT, Have Fun!\033[39m"
  npx http-server -p$PORT
}

# cd into whatever is the forefront Finder window.
## @source: paul irish's dotfiles: https://github.com/paulirish/dotfiles/commit/e67d1bc03
cdf() {  # short for cdfinder
  cd "`osascript -e 'tell app "Finder" to POSIX path of (insertion location as alias)'`"
}

# open a Github PR from the base branch
## @arg target_branch=main|master the branch to open a pr against
## @source: @sshropshire
ghpr () {
    local target_branch

    if [ -n "$1" ]; then
        # ^ target branch input by user non-empty
        target_branch="$1"
    elif git rev-parse --verify main 2>/dev/null ; then
        # ^ check if 'main' exists; ignore stderr
        target_branch=main
    else
        # for repos that still need to migrate to main
        target_branch=master
    fi

    local remote_url=$(git config --get remote.origin.url)
    local current_branch=$(git rev-parse --abbrev-ref HEAD)

    local http_remote_url
    if [[ $remote_url == git@* ]]; then
      # convert ssh url to https url
      http_remote_url=$(echo $remote_url | sed -En 's/git@(.*):(.*)/https:\/\/\1\/\2/p')
    else
      http_remote_url=$remote_url
    fi

    # Ref: https://bytefreaks.net/gnulinux/bash/how-to-remove-prefix-and-suffix-from-a-variable-in-bash
    local pr_url="${http_remote_url%.git}/compare/${target_branch}...${current_branch}"

    # push up any local committed changes before attempting to open a PR
    git push -u

    if command -v open ; then
      open $pr_url
    else
      echo "open comamnd not found; go to $pr_url"
    fi
}
