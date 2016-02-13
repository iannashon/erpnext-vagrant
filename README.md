# Vagrant Box for ERPNext development

A preconfigured Vagrant Box focussed on ERPNext development.

## Requirements

1. [Vagrant](https://www.vagrantup.com)
2. [VirtualBox](https://www.virtualbox.org)
3. [NPM](https://nodejs.org/)

## Installation

1. Clone this repository: `git clone git://github.com/semilimes/erpnext-vagrant.git ERPNext`
2. Install Gulp: `npm install`
3. Run: `vagrant up`

## Usage

1. Run `vagrant up` to start Vagrant
2. Run `bash run.sh` to start Frappe Bench
3. Run `gulp watch` to automatically restart, if a `.py` file changes
4. Go to `http://192.168.33.20:8000/`

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
