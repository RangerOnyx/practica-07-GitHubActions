#!/bin/bash

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> /home/vagrant/.profile

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

brew install actionlint

brew install gh