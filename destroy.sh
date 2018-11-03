#!/bin/bash

# load required Azure environment variables + any TF vars
source ~/.azure/azure_rc.sh

ansible-playbook terraform.yml \
                                --extra-vars "terraform_state=absent" \
                                --extra-vars "terraform_cloud_provider=azure" \
                                --extra-vars "terraform_workspace=AZURE" "$@"