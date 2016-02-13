#!/bin/bash

cd /vagrant
bench init bench --frappe-branch develop --apps_path https://raw.githubusercontent.com/frappe/bench/master/install_scripts/erpnext-apps.json

cd /vagrant/bench
bench new-site erpnext.dev --mariadb-root-password password --admin-password password
bench install-app erpnext
