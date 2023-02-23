sudo tee /home/ansible/1-keygen.sh <<EOF
HOSTNAME=`hostname` ssh-keygen -b 4096 -t rsa -C "$HOSTNAME" -f "/home/ansible/.ssh/id_rsa" -P "" && cat ~/.ssh/id_rsa.pub

EOF