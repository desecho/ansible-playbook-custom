#!/bin/bash

if [ $2 = "prod" ]; then
./scripts/moveout_nginx_configs.sh
fi

ansible-playbook ansible/$1_$2.yml --connection=local --vault-password-file ~/.vault_pass.txt

if [ $2 = "prod" ]; then
./scripts/movein_nginx_configs.sh
service nginx restart
fi
