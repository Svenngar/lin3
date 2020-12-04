#!/bin/bash
## Titre : story2centosntp.sh
## Description : Ce script installe et configure le client ntp vers un serveur specifie
## Date : 27.11.2020
## Auteurs : Chassot Richard, Karoui Mehdi, Angeloz Roderick
## Teste sur : centos 8
## Execute as root

##Installation du daemon chronyd client ntp
dnf install chronyd
systemctl enable chronyd


##Remplacement de la ligne de configuration indiquant le serveur ntp
sed -i 's/pool 2.centos.pool.ntp.org iburst/server 10.0.X.0/g' /etc/chrony.conf
systemctl restart chronyd

sleep 2

echo -e "\e[31mNTP Server list : \e[0m"
chronyc sources
