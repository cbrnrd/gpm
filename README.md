<p align="center"><img src="https://github.com/cbrnrd/gpm/raw/master/img/logo-transparent.png" alt="gpm" width="100" height="100"></p>

<h1 align="center">GPM</h1>

<div align="center">
  <strong>:package:The Linux package manager built on GitHub:octopus:</strong>
</div>

<br />

<div align="center">
  <!-- Version -->
  <img src="https://img.shields.io/badge/version-0.1.0-brightgreen.svg?style=flat-square" alt="version">

  <!-- License -->
  <img src="https://img.shields.io/badge/license-MIT-brightgreen.svg?style=flat-square" alt="LICENSE">
  
  <!-- Build Status -->
  <a href="https://travis-ci.org/cbrnrd/gpm">
    <img src="https://img.shields.io/travis/cbrnrd/gpm.svg?style=flat-square" alt="build">
  </a>
  
  <!-- Last Commit -->
  <img src="https://img.shields.io/github/last-commit/cbrnrd/gpm.svg?style=flat-square" alt="last commit">
  <img src="https://img.shields.io/github/languages/code-size/badges/shields.svg?color=bright-green&style=flat-square">
  <a href="https://carterbrainerd.me/donations">
    <img src="https://img.shields.io/badge/donate-%3C3-red.svg?longCache=true&style=flat-square">
  </a>
</div>

<br />

Welcome to `gpm`! `gpm` (**G**ithub **P**ackage **M**anager) is a binary distribution tool built off of GitHub. It uses a familiar apt-like syntax and pulls all binaries straight from GitHub repositories.

# Installation

There are a few ways to install gpm:

#### Using `snapcraft`
```
sudo snap install --edge --devmode github-package-manager
```

#### Building from source: 
```
git clone https://github.com/cbrnrd/gpm && cd gpm && sudo make install
```

#### GitHub Releases
You can get the latest release [here](https://github.com/cbrnrd/gpm/releases)

# Usage

Installing a package is simple, here is the gist of it: `sudo gpm install user/repo`.

If the repository owner has set their package up correctly, you should be able to run the installed binaries.

## Contributing

1. Fork it ( https://github.com/cbrnrd/ezdb/fork )
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create a new Pull Request

## Contributors

- [cbrnrd](https://github.com/cbrnrd) cbrnrd - creator, maintainer


<p align="center">
  <img height="100" width="300" src="https://i.imgur.com/obHmDnX.png">
</p>
