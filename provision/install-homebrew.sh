if [ ! -d /usr/local/.git ]; then
  echo "Installing Homebrew ..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  brew doctor
else
  echo "Homebrew is already installed"
fi

cd /vagrant/homebrew-cask

if [ ! -d /usr/local/Library/Taps/caskroom/homebrew-cask ]; then
  echo "Installing Brewcask ..."
  brew install caskroom/cask/brew-cask
else
  echo "Brewcask is already installed"
fi

if [[ -e "./production_rubylib" ]]; then
  echo "Brewcask is already in DEV mode"
else
  echo "Turning Homebrew Cask into DEV mode ..."
  ./developer/bin/develop_brew_cask
fi
