#!/bin/bash

./terraform workspace list | grep 'AZURE' &> /dev/null
if [ $? == 0 ]; then
    ./terraform workspace select default
    ./terraform workspace delete AZURE
fi

rm -rf terraform_files/
rm -rf terraform.tfstate.d
rm -rf ./.terraform
rm -f inventory/default

mkdir -p terraform_files/azure

cp files/azure/* terraform_files/azure