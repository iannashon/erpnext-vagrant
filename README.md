# Vagrant Box for ERPNext development

A preconfigured Vagrant Box focussed on ERPNext development.

## Requirements

1. [Vagrant](https://www.vagrantup.com)
2. [VirtualBox](https://www.virtualbox.org)
3. [NPM](https://nodejs.org/)

## Installation

1. Clone this repository:
    - In case of IntelliJ IDEA: or PyCharm
        1. Install "GitHub" plugin
        2. Go to VCS | Checkout from Version Control | GitHub, enter URL and directory names
    - In case of command line: `git clone git://github.com/semilimes/erpnext-vagrant.git ERPNext`
2. Install Gulp (if you are not using Windows, and you are not using PyCharm): `npm install gulp`
3. Run: `vagrant up`

## Usage

1. Run `vagrant up` to start Vagrant
2. Run `bash run.sh` to start Frappe Bench
3. If you installed Gulp then run `gulp watch` to automatically restart, if a `.py` file changes
4. Go to `http://192.168.33.20:8000/`

### Setting PyCharm for Frappe/* development
1. Install the following plugins: Python Remote Interpreter, Remote Hosts Access, SSH Remote Run, Vagrant, .ignore, GitHub, BashSupport
2. Set up Deployment over SSH:
    - Settings | Build, Execution, Deployment | Deployment
    - On Connection Tab:
        - Type: SFTP
        - SFTP Host: 127.0.0.1
        - Port: 2222 (get port value by command "vagrant ssh")
        - Root path: /home/vagrant
        - User name: vagrant
        - Auth type: password
        - Password: vagrant and check the box "Save password"
    - On Mappings tab:
        - Local path: for example, E:\Work\IdeaProjects\Frappe\erpnext-vagrant-ssh
        - Deploymen tpath on server: /
3. Set up Vagrant:
    - Settings | Tools | Vagrant:
        - Instance folder: E:\Work\IdeaProjects\Frappe\erpnext-vagrant, for example
4. Set up MariaDB connection
 - There are two options: you may set up MariaDB permissions, and made some changes in my.cnf config.
Or you may just use SSH connection to virtual machine. Open Database window. Press green plus button | Data Source | MySQL.
 - On General tab:
    - Host: localhost.
    - Database: <database_name>. You may get it from shell: execute "bench mysql", and then "show databases;"
    - User: root
    - Password: password
 - On SSH/SSL tab:
    - check Use SSH tunnel
    - Proxy host: localhost
    - Proxy user: vagrant
    - Auth type: password
5. Set up tmux. tmux is already installed in virtual machine. For automation of configuration tmux windows & panes the script tmux_init.sh developed.
  This script is now started automatically. You need to run it manually.

### Windows Development Workflow
For Linux or Mac OS Host OS all bench files stored in the /vagrant directory of Guest OS which
is synchronized with vagrant directory on Host OS. This directory contains some symlinks (virtualenv
creates symlinks in its virtual environment and some npm packages creates symlinks also). In case of using VirtualBox
& Windows Host OS creating symlinks in shared folder caused errors. So Vagrant provisioning script for Windows all
bench files stored in $HOME directory. So for development it is needed to synchronize these files over SSH between
Guest & Host OS. Such feature is supported in IntelliJ IDEA, and in Sublime Text.

During development after any file at host OS modifcations it need to be synchronized with virtual machine.
It may be done manually (Context menu | Deployment | Upload to ...) or automatically (Tools | Deployment | Automatic Upload).
It is somehow replacement of Gulp.

Working over SSH (besides file synching). Make Tools | "Start SSH session" and chooose "Vagrant at ...". New SSH session
will start in the PyCharm Terminal pane. If you need multiple shells then you may open another SSH sessions. It will appeares
as tabs in Terminal pane. But it is more convenient to start only one SSH session, then execute /vagrant/tmux_init.sh,
and then "tmux a". You will get all necessary windows with all necessary panes. You can easy and quick switch between them.

To see files from virtual machine in tree view it is comfortable to use PyCharm | Remote Host window.

Do not clone repositories like Semilimes/bench, Semilimes/frappe, Semilimes/erpnext for development purposes. When vagrant
created virtual machine, and provision scripts completed, all of these (Semilimes/bench, Semilimes/frappe, Semilimes/erpnext)
will be already in git-folders in virtual machine. You may download some files what you need from virtual machine to Host OS
and then work with them in PyCharm. Commiting to git you may make from virtual machine or from PyCharm from Host OS.
It is easier do not download all files and all .git folder to Host OS, but just commiting to git from virtual machine
from shell over SSH.

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
