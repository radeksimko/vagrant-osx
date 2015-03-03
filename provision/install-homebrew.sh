if [ ! -d /usr/local/.git ]; then
  echo "Installing Homebrew ..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  brew doctor
else
  echo "Homebrew is already installed"
fi