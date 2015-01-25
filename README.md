# Vagrant setup for OSX

Vagrant environment for testing and experiments inside OSX running via VMWare.

## Prerequisites

1. Download a [fresh copy of OSX installer from AppStore](https://itunes.apple.com/gb/app/os-x-yosemite/id915041082?mt=12).
2. Create a Vagrant OSX box via [`timsutton/osx-vm-templates`](https://github.com/timsutton/osx-vm-templates)
  - Remove Parallels & Virtualbox builders as we only need VMWare box
  - Increase the disk size (default is `20480` MB) as installing large packages from Homebrew and elsewhere may take up 20GB pretty quickly
  - Remove Parallels and Chef scripts as we won't need these
3. Place the result box in the root of this repo as `mac-osx-10-10.box`
4. Install [Homebrew](http://brew.sh/) (which implies having _XCode CLI Tools_ installed)
5. Install [Brewcask](http://caskroom.io/) `brew install caskroom/cask/brew-cask`
6. Install other tools: `brew cask install vagrant vmware-fusion`
7. Install [Vagrant VMWare plugin](https://www.vagrantup.com/vmware): `vagrant plugin install vagrant-vmware-fusion` and add license `vagrant plugin license vagrant-vmware-fusion license.lic`

## Testing environments

### Just pure OSX

```sh
vagrant up base
```

### Boxen

```sh
export GH_TOKEN=_FILL_THIS_IN_
vagrant up boxen
```

### Dotfiles

_TODO_

### Homebrew (Cask)

_TODO_
