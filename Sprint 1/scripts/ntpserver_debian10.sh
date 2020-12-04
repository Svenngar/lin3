#!/bin/bash
## Titre : story2.sh
## Description : Ce script installe et configure le client ntp de la machine courante et modifie le serveur ntp de reference vers un serveur aux us
## Date : 27.11.2020
## Auteurs : Chassot Richard, Karoui Mehdi, Angeloz Roderick
## Teste sur : debian 10
## Execute as root



## Installation de paquets aptitude et  NTP
apt-get install aptitude -y
aptitude install ntp -y

## Modification des serveurs de temps utilises
sed -i 's/pool 0.debian.pool.ntp.org iburst/server 1.north-america.pool.ntp.org/g' /etc/ntp.conf
sed -i 's/pool 1.debian.pool.ntp.org iburst/server 2.north-america.pool.ntp.org/g' /etc/ntp.conf
sed -i 's/pool 2.debian.pool.ntp.org iburst/server 3.north-america.pool.ntp.org/g' /etc/ntp.conf
sed -i 's/pool 3.debian.pool.ntp.org iburst/server 4.north-america.pool.ntp.org/g' /etc/ntp.conf

## Re synchronisation du temps avec les bons parametres
/etc/init.d/ntp stop
ntpd -gq
/etc/init.d/ntp start

## Affichage du serveur utilise pour la synchro
echo -e "\e[31mTime synced with server below : \e[0m"
ntpq -p

## Aide completion US 2
echo -e "\e[31mTo continue with the user story, run command to change time\e[0m"
echo "sudo date --set 1998-11-02"
echo "sudo /etc/init.d/ntp stop"
echo "sudo ntpd -gq"
echo "sudo /etc/init.d/ntp start"
