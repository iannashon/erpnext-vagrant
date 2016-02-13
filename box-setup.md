# Base Vagrant Box Setup

```
vagrant init ubuntu/trusty32
vagrant ssh
wget https://github.com/frappe/bench/raw/master/install_scripts/setup_frappe.sh
sudo bash setup_frappe.sh --frappe-user vagrant --skip-setup-bench --verbose
rm setup_frappe.sh frappe_passwords.sh frappe_passwords.txt wkhtmltox-0.12.2.1_linux-trusty-amd64.deb
```

```
mysql -u root -p
use mysql;
UPDATE user SET password=PASSWORD("password") WHERE user="root";
exit
sudo service mysql restart
```

```
sudo apt-get clean
sudo dd if=/dev/zero of=/EMPTY bs=1M
sudo rm -f /EMPTY
cat /dev/null > ~/.bash_history && history -c && cat /dev/null > ~/.mysql_history && exit
```

## Fix "Warning: Authentication failure. Retrying..." Error

```
wget https://raw.githubusercontent.com/mitchellh/vagrant/master/keys/vagrant.pub -O .ssh/authorized_keys
chmod 700 .ssh
chmod 600 .ssh/authorized_keys
chown -R vagrant:vagrant .ssh
```
