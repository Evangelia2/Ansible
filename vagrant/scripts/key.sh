#!/bin/bash

# Δημιουργία του id_rsa αν δεν υπάρχει
if [ ! -f "/home/vagrant/.ssh/id_rsa" ]; then
    ssh-keygen -t rsa -N "" -f /home/vagrant/.ssh/id_rsa
fi

# Αντιγραφή του public key στο shared folder για να το πάρουν τα άλλα VMs
cp /home/vagrant/.ssh/id_rsa.pub /vagrant/control.pub

# Προσθήκη ssh config για να αποφεύγεις τα prompts
cat <<SSHEOF > /home/vagrant/.ssh/config
Host *
  StrictHostKeyChecking no
  UserKnownHostsFile=/dev/null
SSHEOF

# Εξασφάλιση σωστών permissions
chown -R vagrant:vagrant /home/vagrant/.ssh/
chmod 600 /home/vagrant/.ssh/id_rsa
chmod 644 /home/vagrant/.ssh/id_rsa.pub
chmod 600 /home/vagrant/.ssh/config
