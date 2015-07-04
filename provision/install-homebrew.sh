if [ ! -d /usr/local/.git ]; then
  echo "Installing Homebrew ..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  brew doctor
else
  echo "Homebrew is already installed"
fi

if [ ! -d $(brew --prefix)/Cellar/brew-cask ]; then
  echo "Installing Brewcask ..."
  brew install caskroom/cask/brew-cask
else
  echo "Brewcask is already installed"
fi

if [ -d /vagrant/homebrew-cask ]; then
  cd /vagrant/homebrew-cask

  if [[ -e "./production_rubylib" ]]; then
    echo "Brewcask is already in DEV mode"
  else
    echo "Turning Homebrew Cask into DEV mode ..."
    ./developer/bin/develop_brew_cask
  fi
fi

echo "Linking all Homebrew taps from host ..."
mkdir -p /usr/local/Library/Taps/vagrant
ln -s /vagrant/homebrew-* /usr/local/Library/Taps/vagrant/ 2>/dev/null
