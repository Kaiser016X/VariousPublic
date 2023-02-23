# Prérequis

+ Installer Virtualbox (https://www.virtualbox.org/wiki/Downloads) / VirtualBox x.x.x platform packages
+ Installer les extensions Virtualbox (https://www.virtualbox.org/wiki/Downloads) / VirtualBox x.x.x Oracle VM VirtualBox Extension Pack
+ Installer Vagrant (https://developer.hashicorp.com/vagrant/downloads)

# GLOSSAIRE :

+ Vagrant = logiciel pour déployer nos VM's

+ box = image par défaut créée avec packer pour créer nos VM's avec le vagrantfile (donc avec vagrant) (ici on importera des box déja prete sur
https://app.vagrantup.com/boxes/search?provider=virtualbox


# Utilisation vagrant :
+ Configurer vos vagrantfile à votre guise (voir exemple fournis)
+ vagrant up ou up `lenomdevotreautrevm` (si plusieurs box dans le vagrant file / config.vm.define "`lenomdevotreautrevm`") 
pour lancer son Vagrantfile en entier ou seulement une des vm au choix



# Commandes :
| Option | Description |
| ------| -----------|
|vagrant box list | liste des box importés
|vagrant up | démarrer tout le vagrantfile
|vagrant up `lenomdevotreautrevm` | démarre seulement la vm souhaité ( config.vm.define "XXX")
|vagrant halt ou halt `lenomdevotreautrevm` | stop les Vm's
|vagrant destroy ou destroy `lenomdevotreautrevm` | stop et delete les Vm's
|vagrant ssh `lenomdevotreautrevm` | cible la Vm pour se connecter en SSH
|vagrant provision ou provision `lenomdevotreautrevm` | force le provisionning



# VboxManage issue
```
En cas d'erreur type VboxManage.exe => just remove the .vagrant.d and .virtualbox directories under user directory...
```