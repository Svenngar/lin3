#!/bin/bash
## Titre : firewallscript.sh
## Description : Ce script installe et configure le firewall du serveur SSH
## Date : 27.11.2020
## Auteurs : Chassot Richard, Karoui Mehdi, Angeloz Roderick
## Teste sur : debian 10
## Execute as root

apt install ufw -y

## Modification  des regles relatives aux ICMP de maniere a ne plus y repondre
sed -i '/ufw-before-input.*icmp/s/ACCEPT/DROP/g' /etc/ufw/before.rules

## Configuration initiale pour autoriser le trafic sortant uniquement
systemctl start ufw
systemctl enable ufw
ufw default allow outgoing
ufw default deny incoming

## Mise en place des exceptions SSH et NTP en entree et sortie car les clients
## viendront se synchroniser dessus et nous aurons besoin d'un tunnel SSH pour
## atteindre les clients
ufw allow ssh
ufw allow proto udp from 10.0.X.0/24 to any port 123
ufw --force enable
