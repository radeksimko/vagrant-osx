echo "Setting up keychain..."

if [[ `security list-keychains | grep default | wc -l` -eq 0 ]]; then
  security create-keychain -p vagrant default
  security default-keychain -d user -s default
fi

security unlock-keychain -p vagrant
