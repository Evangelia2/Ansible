# PetApp DevOps Project

> **VMs:**

- `appserver` → φιλοξενεί το backend application  
- `dbserver` → φιλοξενεί τη βάση PostgreSQL  
- `jenkinsserver` → φιλοξενεί το Jenkins για CI/CD και εκτέλεση Ansible playbooks  
- `dockerserver` → VM για Docker-specific deployments  

---
- vagrant up {name of vm}  
- Το jenkinsserver χρειάζεται χειροκίνητη εγκατάσταση των απαραίτητων packages.  
- Για να επιτρέψουμε στο Jenkins να συνδέεται μέσω SSH σε άλλα VMs (πρέπει να είμαστε μέσα στον φάκελο που περιέχει το vagrantfile) : cat .vagrant/machines/{name of the vm}/virtualbox/private_key  
- vagrant ssh jenkinsserver  
- Σύνδεση ως χρήστης jenkins με: sudo su - jenkins  
- Δημιουργία φακέλου: mkdir -p ~/.keys  
- Δημιουργία αρχείου για κάθε key(μέσα στον φάκελο ~/.keys): touch {name of the vm}.key  
- Ρύθμιση δικαιωμάτων: chmod 600 {name of the vm}.key  
- Δημιουργία αρχείου config: mkdir -p ~/.ssh  
- Μέσα στο config βάζω:   
        Host {name of the vm}  
            HostName  {IP of the vm}  
            User vagrant  
            IdentityFile /var/lib/jenkins/.keys/{name of the vm}.key  
            StrictHostKeyChecking no  
            UserKnownHostsFile /dev/null  
            LogLevel FATAL  
- Ανοίγμα browser http://<jenkinsserver_ip>:8080 (http://192.168.56.120:8080/)  
- Έυρεση password: sudo cat /var/lib/jenkins/secrets/initialAdminPassword  
- Δημιουργία pipeline job στο ansible.Jenkinsfile ή στο ansible-compose.Jenkinsfile και εκτέλεση  
- Άνοιγμα browser http://192.168.56.103/ 
