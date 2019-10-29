# Maintain with Ansible

Ansible is used to install, configure and maintain the entire demo server.

## Install required Roles

Here in local dir `roles` :

```

mkdir roles
ansible-galaxy install --roles-path ./roles -r requirements.yml

```

## Make credentials files

These are not in this repo for obvious reasons... You need to create/populate these locally. 

* vars/vars.yml (see [example](vars/vars.example.yml))
* dockerhub env file in service/dockerhub/docker.env (see [example](../services/dockerhub/dockerhub.example.env))


## Bootstrap

```

# Installs entire system
ansible-playbook -vv bootstrap.yml -i hosts/sta.map5.nl

```


Login.

```

ssh <admin user>@sta.map5.nl

```

## Service

```

# System stademo service
ansible-playbook -vv service.yml  -i hosts/sta.map5.nl  --tags start
ansible-playbook -vv service.yml  -i hosts/sta.map5.nl  --tags stop
ansible-playbook -vv service.yml  -i hosts/sta.map5.nl  --tags status


```

## Deploy

Uses admin user account as configured in `vars/vars.yml`.


```

# Update git and deploy a service
ansible-playbook -vv deploy.yml  -i hosts/sta.map5.nl  --tags update,home
ansible-playbook -vv deploy.yml  -i hosts/sta.map5.nl  --tags update,dockerhub
ansible-playbook -vv deploy.yml  -i hosts/sta.map5.nl  --tags update,stademo
ansible-playbook -vv deploy.yml  -i hosts/sta.map5.nl  --tags update,traefik

# Status
ansible-playbook -vv service.yml  -i hosts/sta.map5.nl  --tags status

```


## Other

```

# Hosts affected 
$ ansible-playbook -vv bootstrap.yml --list-hosts

# Hosts affected via -l param
$ ansible-playbook -vv bootstrap.yml -l ansible2 --list-hosts

# Local hosts file
ansible-playbook -vv bootstrap.yml -i hosts/sta.map5.nl  --list-hosts

```