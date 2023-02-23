#Modification pw users
echo "root:devops" | sudo chpasswd
echo "vagrant:devops" | sudo chpasswd
#creation user sudoers (ansible)+pw
sudo useradd ansible
echo "ansible ALL=(ALL) NOPASSWD: ALL" | sudo tee /etc/sudoers.d/ansible
echo "ansible:devops" | sudo chpasswd

#######Installation des paquets+ansible#######
#yum update pour être à jour
sudo dnf update -y
sudo yum install sshpass -y

############################################################################
#Modifications IP
sudo tee /etc/sysconfig/network-scripts/ifcfg-enp0s8 <<EOF
NM_CONTROLLED=yes
BOOTPROTO=none
ONBOOT=yes
IPADDR=192.168.50.100
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