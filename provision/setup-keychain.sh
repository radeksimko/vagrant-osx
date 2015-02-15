if [[ `security list-keychains | grep default | wc -l` -eq 0 ]]; then
  echo "Setting up keychain..."

  security create-keychain -p vagrant default
  security default-keychain -d user -s default
fi

security unlock-keychain -p vagrant
