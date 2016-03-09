#!/bin/bash

cd $1
bench init bench --frappe-path https://github.com/osya/frappe.git --apps_path https://raw.githubusercontent.com/frappe/bench/master/install_scripts/erpnext-apps.json

cd $1/bench
bench new-site erpnext.dev --mariadb-root-password password --admin-password password
bench install-app erpnext

python /vagrant/add_developer_mode.py $1