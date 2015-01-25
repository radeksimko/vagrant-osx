if [[ `security list-keychains | wc -l` -eq 1 ]]; then
  security create-keychain -p vagrant default
fi

security default-keychain -d user -s default
security unlock-keychain -p vagrant
