![GitHub Downloads (all assets, all releases)](https://img.shields.io/github/downloads/dariogriffo/lazygit-debian/total)
![GitHub Downloads (all assets, latest release)](https://img.shields.io/github/downloads/dariogriffo/lazygit-debian/latest/total)
![GitHub Release](https://img.shields.io/github/v/release/dariogriffo/lazygit-debian)
![GitHub Release Date](https://img.shields.io/github/release-date/dariogriffo/lazygit-debian)

<h1>
   <p align="center">
     <a href="https://lazygit.org/"><img src="https://github.com/dariogriffo/lazygit-debian/blob/main/lazygit-logo.png" alt="lazygit Logo" width="128" style="margin-right: 20px"></a>
     <a href="https://www.debian.org/"><img src="https://github.com/dariogriffo/lazygit-debian/blob/main/debian-logo.png" alt="Debian Logo" width="104" style="margin-left: 20px"></a>
     <br>lazygit for Debian
   </p>
</h1>
<p align="center">
 lazygit is a simple terminal UI for git commands.
</p>

# lazygit for Debian

This repository contains build scripts to produce the _unofficial_ Debian packages
(.deb) for [lazygit](https://github.com/jesseduffield/lazygit/) hosted at [debian.griffo.io](https://debian.griffo.io)

Currently supported debian distros are:
- Bookworm
- Trixie
- Sid

This is an unofficial community project to provide a package that's easy to
install on Debian. If you're looking for the lazygit source code, see
[lazygit](https://github.com/jesseduffield/lazygit/).

## Install/Update

### The Debian way

```sh
curl -sS https://debian.griffo.io/EA0F721D231FDD3A0A17B9AC7808B4DD62C41256.asc | gpg --dearmor --yes -o /etc/apt/trusted.gpg.d/debian.griffo.io.gpg
echo "deb https://debian.griffo.io//apt $(lsb_release -sc 2>/dev/null) main" | sudo tee /etc/apt/sources.list.d/debian.griffo.io.list
sudo apt install -y lazygit
```

### Manual Installation

1. Download the .deb package for your Debian version available on
   the [Releases](https://github.com/dariogriffo/lazygit-debian/releases) page.
2. Install the downloaded .deb package.

```sh
sudo dpkg -i <filename>.deb
```
## Updating

To update to a new version, just follow any of the installation methods above. There's no need to uninstall the old version; it will be updated correctly.

## Roadmap

- [x] Produce a .deb package on GitHub Releases
- [x] Set up a debian mirror for easier updates

## Disclaimer

- This repo is not open for issues related to lazygit. This repo is only for _unofficial_ Debian packaging.
