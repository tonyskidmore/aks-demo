# AKS Demo

Passing extra-vars outside of the remo`@~/.azure/azure.yaml`

### Requires  

- Private SSH key pair created with `ssh-keygen -t rsa -b 2048` in:  
```
~/.ssh/aks_demo
~/.ssh/aks_demo.pub
```

- Resource file to load in required variables in `~/.azure/azure_rc.sh`   
Example:  
```
# WSL environment variable to avoid world writeable error
export ANSIBLE_CONFIG=ansible.cfg

export ARM_SUBSCRIPTION_ID=26cd7884-a6e5-4b49-8db6-9008588200e0
export ARM_CLIENT_ID=3f6812b7-6a8f-4505-a525-6d0c14ebca84
export ARM_CLIENT_SECRET=1+Gl00000ljsd78329838dhus8JKjsghjljw=
export ARM_TENANT_ID=d6dc7617-3655-4f5a-bccc-b034c3f83e44
```

Versions:  
Tested with Ansible 2.7.1