function doIt() {
  rsync --exclude ".git/" \
    --exclude ".DS_Store" \
    --exclude "bootstrap.sh" \
    --exclude "bin/" \
    --exclude "README.md" \
    --exclude "brew.sh" \
    --exclude "LICENSE-MIT.txt" \
    --exclude "iterm-profile.json" \
    --exclude ".editorconfig" \
    --exclude ".dockermachine-config" \
    --exclude ".editorconfig" \
    -avh --no-perms . ~;

  # If .dockermachine-config doesn't exist, copy it
  if [ ! -f ~/.dockermachine-config ]; then
    cp .dockermachine-config ~/.dockermachine-config
  fi
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
  doIt;
else
  read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
  echo "";
  if [[ $REPLY =~ ^[Yy]$ ]]; then
    doIt;
  fi;
fi;
unset doIt;
