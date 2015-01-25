# Vagrant setup for OSX

Vagrant environment for testing and experiments inside OSX running via VMWare.

## Prerequisites

1. Download a [fresh copy of OSX installer from AppStore](https://itunes.apple.com/gb/app/os-x-yosemite/id915041082?mt=12).
2. Create a Vagrant OSX box via [`timsutton/osx-vm-templates`](https://github.com/timsutton/osx-vm-templates)
  - Remove Parallels & Virtualbox builders as we only need VMWare box
  - Increase the disk size (default is `20480` MB) as installing large packages from Homebrew and elsewhere may take up 20GB pretty quickly
  - Remove Parallels and Chef scripts as we won't need these
3. Install Homebrew (which implies having _XCode CLI Tools_ installed)
4. Install other tools: `brew install vagrant vmware-fusion`
5. Install Vagrant VMWare plugin: `vagrant plugin install vagrant-vmware-fusion` and add license `vagrant plugin license vagrant-vmware-fusion license.lic`

## Testing environments

### Boxen

```sh
export GH_TOKEN=_FILL_THIS_IN_
vagrant up boxen
```

### Dotfiles

_TODO_

### Homebrew (Cask)

_TODO_
