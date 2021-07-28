!/bin/bash
# adjust permissions
sudo chmod 777 /etc/hosts

# post server1 name in /etc/hosts file after localhost

echo '192.168.100.10    server2' | sudo tee -a /etc/hosts
#readjust permissions
sudo chmod 644 /etc/hosts

#copy server2 publickey to server1 known hosts and rsa_key
sudo sed 's/#\?\(PubkeyAuthentication\s*\).*$/\1 yes/' /etc/ssh/sshd_config
sudo service sshd restart

sudo ssh-keyscan -H 192.168.100.10 >> ~/.ssh/known_hosts

sudo ssh-keyscan -H 192.168.100.10 >>/home/vagrant/.ssh/id_rsa

sudo ssh-copy-id -i ~/.ssh/id_rsa server2

ssh server1
