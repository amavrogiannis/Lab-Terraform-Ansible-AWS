## Roles
### Overview
Roles folder is where you specify all your Ansible tasks. This section of the repository is a good example, showing how you can structure your roles and specify them to your playbook and keep your scripts tidy. 

The example in this demo, has structured the roles by different paths: 
- apache (This role will install Apache on the host)
- applications (This role will install applications and services, which is required in running the instance)
- container (This role will deploy a container in your host and forward the whitelisted port)

### Apache
When building a webserver is listed on your requirements to your project, it is a good idea in using Ansible to setup your Apache service on your host machine. 

### Applications

### Container