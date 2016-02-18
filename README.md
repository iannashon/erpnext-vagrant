# Vagrant Box for ERPNext development

A preconfigured Vagrant Box focussed on ERPNext development.

## Requirements

1. [Vagrant](https://www.vagrantup.com)
2. [VirtualBox](https://www.virtualbox.org)
3. [NPM](https://nodejs.org/)

## Installation

1. Clone this repository:
    - In case of IntelliJ IDEA:
        1. Install "GitHub" plugin
        2. Go to VCS | Checkout from Version Control | GitHub, enter URL and directory names
    - In case of command line: `git clone git://github.com/semilimes/erpnext-vagrant.git ERPNext`
2. Install Gulp: `npm install`
3. Run: `vagrant up`

## Usage

1. Run `vagrant up` to start Vagrant
2. Run `bash run.sh` to start Frappe Bench
3. Run `gulp watch` to automatically restart, if a `.py` file changes
4. Go to `http://192.168.33.20:8000/`

### Windows usage notes
For Linux or Mac OS Host OS all bench files stored in the /vagrant directory of Guest OS which
is synchronized with vagrant directory on Host OS. This directory contains some symlinks (virtualenv
creates symlinks in its virtual environment and some npm packages creates symlinks also). In case of using VirtualBox
& Windows Host OS creating symlinks in shared folder caused errors. So Vagrant provisioning script for Windows all
bench files stored in $HOME directory. So for development it is needed to synchronize these files over SSH between
Guest & Host OS. Such feature is supported in IntelliJ IDEA, and in Sublime Text.

### Credentials

#### Frappe/ERPNext
* Username: `Administrator`
* Password: `password`

#### MariaDB
* Hostname: `127.0.0.1`
* Username: `root`
* Password: `password`

#### SSH Access
* Hostname: `192.168.33.20`
* Username: `vagrant`
* Password: `vagrant`
