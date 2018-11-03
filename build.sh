#!/bin/bash

working_dir=`pwd`

cp files/default inventory/default

# load required Azure environment variables + any TF vars
source ~/.azure/azure_rc.sh

# ARM env vars should now be in env
ansible-galaxy install -r ./roles/requirements.yml -p ./roles/ --force

# get terraform if not already available
ansible-playbook terraform_install.yml \
                                        --extra-vars "terraform_path=${PWD}/" \
                                        --extra-vars "terraform_tmp=${PWD}/tmp" "$@"

# create terraform workspace
${PWD}/terraform workspace new AZURE ${PWD}/terraform_files/azure/

# init terraform
#cd ${PWD}/terraform_files/azure/
#echo ${PWD}
#${working_dir}/terraform init -input=false ${working_dir}/terraform_files/azure/
#cd ${working_dir}
#echo ${PWD}

# validate
#${PWD}/terraform validate ${PWD}/terraform_files/azure/

ansible-playbook terraform.yml \
                                --extra-vars "terraform_state=present" \
                                --extra-vars "terraform_cloud_provider=azure" \
                                --extra-vars "terraform_ssh_key_data=./files/azure.pub" \
                                --extra-vars "terraform_workspace=AZURE" "$@"

ansible-playbook test-connection.yml
