sudo tee /home/ansible/2-sshcopyid.sh <<EOF
#!/bin/bash

# définir les variables
ips=("ansible" "docker")
users=("ansible" "ansible")
passwords=("devops" "devops")

# Boucle pour chaque machine distante
for i in ${!ips[@]}; do
ip=${ips[i]}
user=${users[i]}
password=${passwords[i]}

# Récupère le fingerprint de la machine distante
ssh-keyscan $ip >> ~/.ssh/known_hosts

# copie la clé publique sur la machine distante
echo $password | sshpass -p "$password" ssh-copy-id -i ~/.ssh/id_rsa.pub -o StrictHostKeyChecking=yes -o UserKnownHostsFile=~/.ssh/known_hosts -o "StrictHostKeyChecking yes" -o "CheckHostIP no" -o "PasswordAuthentication yes" $user@$ip
# vérifie la connexion
#ssh -o "StrictHostKeyChecking=yes" -o "UserKnownHostsFile=~/.ssh/known_hosts" -o "CheckHostIP=no" -o "PasswordAuthentication=yes" $user@$ip
done


EOF