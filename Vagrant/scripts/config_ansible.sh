#Modification pw users
echo "root:devops" | sudo chpasswd
echo "vagrant:devops" | sudo chpasswd
#creation user sudoers (ansible)+pw
sudo useradd ansible
echo "ansible ALL=(ALL) NOPASSWD: ALL" | sudo tee /etc/sudoers.d/ansible
echo "ansible:devops" | sudo chpasswd

#######Installation des paquets+ansible#######
#yum update pour être à jour
#yum update pour être à jour
sudo dnf update -y
sudo yum install sshpass -y
#install python 3.9
sudo dnf install python39 -y
#install pip 
sudo pip3 install --upgrade --ignore-installed pip setuptools
#2 manieres d'install ansible :
#install sur /usr/local/bin et donc accessible tout le monde: 
sudo pip3 install ansible 
#ou
#install sur le home directory du user en cours et donc pas en root
#python3 -m pip install ansible --user

############################################################################
#Modifications IP
sudo tee /etc/sysconfig/network-scripts/ifcfg-enp0s8 <<EOF
NM_CONTROLLED=yes
BOOTPROTO=none
ONBOOT=yes
IPADDR=192.168.50.101
# NETMASK=255.255.255.0
# GATEWAY=192.168.10.254
# DNS
# DNS1=192.168.10.200
DNS2=1.1.1.1
# Disable ipv6
IPV6INIT=no
DEVICE=enp0s8
EOF

#relance du service pour prise en compte
sudo systemctl restart NetworkManager


############ config

sudo tee /home/ansible/hosts <<EOF

[groupe1]
ansible

[groupe2]
docker

EOF



sudo tee /etc/hosts <<EOF
192.168.1.100 docker
192.168.1.101 ansible


EOF