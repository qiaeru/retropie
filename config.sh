#!/bin/bash

echo "==> Configuration de la langue, du clavier et du fuseau horaire..."

# Langue et locale
sed -i 's/^# fr_FR.UTF-8 UTF-8/fr_FR.UTF-8 UTF-8/' /etc/locale.gen
locale-gen
update-locale LANG=fr_FR.UTF-8

# Clavier AZERTY français
cat > /etc/default/keyboard <<EOF
XKBMODEL="pc105"
XKBLAYOUT="fr"
XKBVARIANT=""
XKBOPTIONS=""
BACKSPACE="guess"
EOF

# Fuseau horaire Europe/Paris
timedatectl set-timezone Europe/Paris

# Pays Wi-Fi : France
cat > /etc/wpa_supplicant/wpa_supplicant.conf <<EOF
ctrl_interface=DIR=/var/run/wpa_supplicant GROUP=netdev
update_config=1
country=FR
EOF
cp /etc/wpa_supplicant/wpa_supplicant.conf /boot

# Réappliquer le layout clavier
setupcon

echo "==> Paramètres régionaux appliqués."
