# Contents
# No variables are included 

- Homelab Diagram 
    - the homelab.png and the draw.io xml used to create the diagram as well as assets

- Homelab servers
    - individual yaml files for CM of servers 
        - Configure Centos8 & Ubuntu20 with docker
        - Crossbone Vanguard (media harvester / media server[emby included])
        - Containerized Jenkins CI/CD
        - Plex Server (media server)
        - web Server (nginx host)
        - wordpress (blog) 

- IAC 
    - CM
        - configureAll.yml (runs CM playbooks on all homelab servers)
            - Crossbone_Vanguard.yml
            - jenkins.yml 
            - PlexServerConfigCentos8.yml
            - webserver.yml
            - wordpressUbuntu.yml

- Inital setup and Provisioning
    - Ansible
        - (deprecated) function deployment scripts in ansible on esxi 7 or 6.7
            - gold palybooks (base minimum spec images)
            - Server Playbooks (individual playbooks for linux lab servers)
    
    - Terraform
        - deploy.tf (terraform script to deploy 1 to 5 of the home lab VMs)

    
# 6/5/2020 Homelab initial update

IAC of my homelab setup done with ansible

- Initial setup and provisioning
    - gold playbooks
        playbooks for provisioning mimimum requirement VMs
    
    - Server Playbooks
        Playbooks for provisioning servers with ansible from vm templates to the specs required

# Playbooks for CM of homelab servers
- Configuration Management 
    - Servers
        Plex: Centos 8 running plex in docker 
        Webserver: nginx server serving htlm, css, php content
        Wordpress: blog
        Jenkins: CI/CD 
        Crossbone_vanguard: Sonarr, Radarr, Jackett, and transmission
        
# 6/11/2020

- Terraform
    - Switched to terraform for initial provisiong and included the code to deploy my home lab to my esxi cluster
      (no vars are included in terraform or ansible files provide your own)

# 6/13/2020

- Testing
    - Tested terraform deployment and ansible CM - working as intended

# 6/14/2020

- Putting it all together 
    - Created IAC folder and compiled all deployment and configuration scripts 
    - Create and store a needed var files in the directory of choice 
    - Lab is created by running the deploy.tf and the cm-all.yml

# 6/15/2020

- Service change 
    - Switched to Plex from emby and bazarr

# 6/16/2020

- Changes
    - added drive mapping to store torrents away from root fs
    - swapped just ansible for ansible in line docker compose on crossbonevanguard (honestly seems about the same ansible gets it done too)

# 6/17/2020 

- Changes 
    - Added macOS VMs (app dev) to home lab diagram will work on IAC and templates in the future