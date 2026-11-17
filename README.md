# fileutils

![GitHub tag (latest by date)](https://img.shields.io/github/v/tag/siakhooi/fileutils?logo=github)
![workflow](https://github.com/siakhooi/fileutils/actions/workflows/workflow-build.yml/badge.svg)
![workflow](https://github.com/siakhooi/fileutils/actions/workflows/workflow-release.yml/badge.svg)
![GitHub all releases](https://img.shields.io/github/downloads/siakhooi/fileutils/total?color=33cb56&logo=github)
![GitHub Release Date](https://img.shields.io/github/release-date/siakhooi/fileutils?logo=github)
[![Wise](https://img.shields.io/badge/Funding-Wise-33cb56.svg?logo=wise)](https://wise.com/pay/me/siakn3)
![visitors](https://hit-tztugwlsja-uc.a.run.app/?outputtype=badge&counter=ghmd-fileutils)

scripts with common file utils

## Installation
### Deb
```
$ sudo curl -L https://siakhooi.github.io/apt-linux/siakhooi-apt-linux.list | sudo tee /etc/apt/sources.list.d/siakhooi-apt-linux.list > /dev/null
$ sudo curl -L https://siakhooi.github.io/apt-linux/siakhooi-apt-linux.gpg  | sudo tee /usr/share/keyrings/siakhooi-apt-linux.gpg > /dev/null
$ sudo apt update
$ sudo apt install siakhooi-fileutils
```
### Rpm
```
sudo curl -L https://siakhooi.github.io/rpms/siakhooi-rpms.repo | sudo tee /etc/yum.repos.d/siakhooi-rpms.repo > /dev/null
sudo yum install siakhooi-fileutils
```
### Termux
```
$ curl -L https://siakhooi.github.io/apt-termux/siakhooi-apt-termux.list -o $PREFIX/etc/apt/sources.list.d/siakhooi-apt-termux.list
$ curl -L https://siakhooi.github.io/apt-termux/siakhooi-apt-termux.gpg  -o $PREFIX/etc/apt/trusted.gpg.d/siakhooi-apt-termux.gpg
$ apt update
$ apt install siakhooi-fileutils
```
## Requirements

## Deployments
- https://siakhooi.github.io/apt-linux/
- https://siakhooi.github.io/apt-termux/
- https://siakhooi.github.io/rpms/
