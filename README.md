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

## Caveats

### Boxen & synced folders
Boxen uses file-locking to ensure it's only running once.
This doesn't work with the [default VMWare file-sync mechanism](https://docs.vagrantup.com/v2/synced-folders/basic_usage.html).

This is why we use NFS, but that has a different caveat - each time you run `vagrant [up|reload]`,
Vagrant will try to modify `/etc/exports` on your host machine, which will by default require your sudo password.

<del>A workaround could be allowing write for all admins on that system:</del>

```
sudo chown root:admin /etc/exports
sudo chmod g+w /etc/exports
```

<del>while [having Vagrant `1.7.0+`](https://github.com/mitchellh/vagrant/commit/aa981cf4ec1492e33fef8dde1eb2d58b202285e6) installed.</del>
This workaround doesn't quite work yet as there's `sed` which tries to create temp files in `/etc` and fails to do so -> asks for sudo anyway:

```
sed: couldn't open temporary file /etc/sedRbDkfP: Permission denied
```

_Pull-request to vagrant is on the way._

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
