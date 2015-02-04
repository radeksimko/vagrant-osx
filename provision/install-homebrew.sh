if [ ! -d /usr/local/.git ]; then
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  brew doctor
else
  echo "Homebrew is already installed"
fi