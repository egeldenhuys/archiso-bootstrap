#!/bin/bash

./set-proxy.sh

echo "We will now clone your personal repo and initialise the system."
echo "github/username/dotfiles/config_dir/init.sh will be executed"

echo "GitHub username: "
read username

echo "Config dir (default: none):"
read config_dir


if [ -d ~/dotfiles ]; then
  echo "Updating dotfiles repo..."
  git -C ~/dotfiles pull
else
  echo "Cloning dotfiles repo..."
  git -C ~ clone https://github.com/$username/dotfiles --depth=1
fi

if [[ -z "$config_dir" ]]; then
    source ~/dotfiles/init.sh
else
    source ~/dotfiles/$config_dir/init.sh
fi
