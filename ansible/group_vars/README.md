## Ansible - Group Variables
### Overview
In this directory, you'll find [all.yml](https://github.com/amavrogiannis/Lab-Terraform-Ansible-AWS/blob/master/ansible/group_vars/all.yml) file. Which you define the variables linking to your Ansible scripts; ensuring to keep your main YAML scripts as [DRY](https://en.wikipedia.org/wiki/Don%27t_repeat_yourself) as possible. 

The block code below, shows how the Ansbible accepts the variables syntax, which links to your main code: 
```
---
var_example: example_variable
document_src: /folder1/folder2/folder3/file1.html
document_path: /folder1/folder2/folder3/file1.html
ansible_ssh_user: ec2-user
ansible_user: ec2-user
ansible_ssh_private_key_file: ../../example-key.pem or ./example-key.pem
```
***Note***: <sup>* *ec2-user can be changed, depending the user profile name of the server. ec2-user profile is the standard from Amazon Linux 2* *</sup>


