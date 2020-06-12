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
    Switched to terraform for initial provisiong and included the code to deploy my home lab to my esxi cluster
    (no vars are included in terraform or ansible files provide your own)

