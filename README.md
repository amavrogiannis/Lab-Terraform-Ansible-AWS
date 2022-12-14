# CloudHubble-IaaC-Guild-Terraform-Ansible
This is the Terraform Ansible Infrastructure Demo, which is presented on the IaaC Guild at Cloud Hubble. This infrastructure is set to a basic AWS VPC, Subnets, EC2 Instances that are provisioned and configured using Terraform and Ansible that structured in best practices. 

You can clone this repository and get started, also feel free to contribute in the project, if you think any part needs to be improved. 

Check the prerequisite, before you initiate the infrastructure on your AWS Account. 

### Prerequisites:
- Terraform 1.3.0
- Ansible core 2.13.4

## Getting started
The project plan is as follows: 
- Provision infrastructure using Terraform
    - VPC
    - 3 Subnets (1 Public and 2 Private)
    - Security groups
    - Route Tables
    - Internet Gateway
    - 2 EC2 Instances
- Instance configuration using Ansible: 
    - Server A: Webserver that will host Apache (port **80**) and internal Docker container running Nginx using port **8080**. 
    - Server B: Private server, which will simply have a number of packages installed inside it for the developer to use in a private environment. 

The infrastructure is also visually shown to the below diagram: 
<br/>
<img src="docs/Diagram - Ansible demo.jpg" width="500px" height="500px">

## Directory structure
The below directory structure, is set to a basic terraform and ansible best practice. You can also set the terraform, so as the ansible to different environments, in using a new top directory with the environment's name. 

References: 
- Terraform - https://getbetterdevops.io/terraform-create-infrastructure-in-multiple-environments/
- Ansible - https://devops4solutions.medium.com/manage-ansible-playbook-for-multiple-environments-a7d142dea2c7


```
Ansible-Project-Repo
|
│   README.md
│   backend.tf 
│   main.tf
│   providers.tf
│   variables.tf     
│
└───ansible
│   │   ansible.cfg
│   │   playbook.yml
│   │   ***my-key.pem*** (hidden)
│   │
│   └───group_vars
│       │   all.yml
│       │   ...
│   └───inventory
│       │   aws_ec2.yml
│       │   ...
│   └───roles
│       └───apache
│           └───handlers
│               │   main.yml
│               │   ...
│           └───site_html
│               │   index.html
│               │   ...
│           └───tasks
│               │   main.yml
│               │   ...
│           └───templates
│               │   instance.conf
│               │   ...
│       └───applications
│           └───handlers
│               │   main.yml
│               │   ...
│           └───tasks
│               │   main.yml
│               │   ...
│       └───container
│           └───handlers
│               │   main.yml
│               │   ...
│           └───tasks
│               │   main.yml
│               │   ...
│   
|   └───modules
│       └───backend
│           │   main.tf
│       └───instances
│           │   data.tf
│           │   main.tf
│           │   outputs.tf
│           │   variables.tf
│       └───network
│           │   data.tf
│           │   main.tf
│           │   outputs.tf
│           │   variables.tf
│           │   igw.tf
│           │   security.tf
│           │   subnet.tf
```


## Integrate with your tools

- [ ] [Set up project integrations](https://gitlab.com/ANDigital/cloud-hubble/cloudhubble-iaac-guild-terraform-ansible/-/settings/integrations)

## Collaborate with your team

- [ ] [Invite team members and collaborators](https://docs.gitlab.com/ee/user/project/members/)
- [ ] [Create a new merge request](https://docs.gitlab.com/ee/user/project/merge_requests/creating_merge_requests.html)
- [ ] [Automatically close issues from merge requests](https://docs.gitlab.com/ee/user/project/issues/managing_issues.html#closing-issues-automatically)
- [ ] [Enable merge request approvals](https://docs.gitlab.com/ee/user/project/merge_requests/approvals/)
- [ ] [Automatically merge when pipeline succeeds](https://docs.gitlab.com/ee/user/project/merge_requests/merge_when_pipeline_succeeds.html)

## Test and Deploy

Use the built-in continuous integration in GitLab.

- [ ] [Get started with GitLab CI/CD](https://docs.gitlab.com/ee/ci/quick_start/index.html)
- [ ] [Analyze your code for known vulnerabilities with Static Application Security Testing(SAST)](https://docs.gitlab.com/ee/user/application_security/sast/)
- [ ] [Deploy to Kubernetes, Amazon EC2, or Amazon ECS using Auto Deploy](https://docs.gitlab.com/ee/topics/autodevops/requirements.html)
- [ ] [Use pull-based deployments for improved Kubernetes management](https://docs.gitlab.com/ee/user/clusters/agent/)
- [ ] [Set up protected environments](https://docs.gitlab.com/ee/ci/environments/protected_environments.html)

***

# Editing this README

When you're ready to make this README your own, just edit this file and use the handy template below (or feel free to structure it however you want - this is just a starting point!). Thank you to [makeareadme.com](https://www.makeareadme.com/) for this template.

## Suggestions for a good README
Every project is different, so consider which of these sections apply to yours. The sections used in the template are suggestions for most open source projects. Also keep in mind that while a README can be too long and detailed, too long is better than too short. If you think your README is too long, consider utilizing another form of documentation rather than cutting out information.

## Name
Choose a self-explaining name for your project.

## Description
Let people know what your project can do specifically. Provide context and add a link to any reference visitors might be unfamiliar with. A list of Features or a Background subsection can also be added here. If there are alternatives to your project, this is a good place to list differentiating factors.

## Badges
On some READMEs, you may see small images that convey metadata, such as whether or not all the tests are passing for the project. You can use Shields to add some to your README. Many services also have instructions for adding a badge.

## Visuals
Depending on what you are making, it can be a good idea to include screenshots or even a video (you'll frequently see GIFs rather than actual videos). Tools like ttygif can help, but check out Asciinema for a more sophisticated method.

## Installation
Within a particular ecosystem, there may be a common way of installing things, such as using Yarn, NuGet, or Homebrew. However, consider the possibility that whoever is reading your README is a novice and would like more guidance. Listing specific steps helps remove ambiguity and gets people to using your project as quickly as possible. If it only runs in a specific context like a particular programming language version or operating system or has dependencies that have to be installed manually, also add a Requirements subsection.

## Usage
Use examples liberally, and show the expected output if you can. It's helpful to have inline the smallest example of usage that you can demonstrate, while providing links to more sophisticated examples if they are too long to reasonably include in the README.

## Support
Tell people where they can go to for help. It can be any combination of an issue tracker, a chat room, an email address, etc.

## Roadmap
If you have ideas for releases in the future, it is a good idea to list them in the README.

## Contributing
State if you are open to contributions and what your requirements are for accepting them.

For people who want to make changes to your project, it's helpful to have some documentation on how to get started. Perhaps there is a script that they should run or some environment variables that they need to set. Make these steps explicit. These instructions could also be useful to your future self.

You can also document commands to lint the code or run tests. These steps help to ensure high code quality and reduce the likelihood that the changes inadvertently break something. Having instructions for running tests is especially helpful if it requires external setup, such as starting a Selenium server for testing in a browser.

## Authors and acknowledgment
Show your appreciation to those who have contributed to the project.

## License
For open source projects, say how it is licensed.

## Project status
If you have run out of energy or time for your project, put a note at the top of the README saying that development has slowed down or stopped completely. Someone may choose to fork your project or volunteer to step in as a maintainer or owner, allowing your project to keep going. You can also make an explicit request for maintainers.
