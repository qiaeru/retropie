# Configuration personnelle de RetroPie

Ce dépôt héberge ma configuration personnelle pour optimiser RetroPie installé sur Raspberry Pi 400 et projeté sur un téléviseur ultra haute définition.

Il contient plusieurs étapes pour :

- Configurer la langue, le clavier, le fuseau horaire et la région Wi-Fi pour la France ;
- Optimiser les performances de RetroPie ;
- Améliorer la compatibilité avec les téléviseurs ultra haute définition en forçant le 1080p ;
- Réduire la latence d'affichage et d'entrée pour un confort de jeu optimal.

## Installation de RetroPie

Téléchargez et installez RetroPie sur le Raspberry Pi 400 par l'intermédiaire d'une carte micro-SD (64 Go de stockage recommandés) en suivant [les étapes de première installation du site officiel](https://retropie.org.uk/docs/First-Installation/).

## Configuration de RetroPie

1. Téléchargez [l'archive de ce dépôt](https://github.com/qiaeru/retropie/archive/refs/heads/main.zip) et décompressez le contenu à la racine de la carte micro-SD.

2. Démarrez le système jusqu'au chargement de la page d'accueil d'_EmulationStation_ qui propose de configurer une manette.

3. Pressez la touche `F4` pour accéder à la console de RetroPie.

4. Exécutez les commandes suivantes (attention, le clavier est à ce stade en QWERTY et non en AZERTY) pour lancer le premier script qui va configurer la langue, le clavier, le fuseau horaire et la région Wi-Fi pour la France :

    ```bash
    sudo chmod +x /boot/scripts/configuration-retropie.sh
    ```

    ```bash
    sudo /boot/scripts/configuration-retropie.sh
    ```

5. Une fois le script terminé, exécutez la commande suivante pour lancer le script de configuration de RetroPie :

    ```bash
    sudo $HOME/RetroPie-Setup/retropie_setup.sh
    ```

    Sélectionnez l'option `C Configuration / tools`, l'option `236 wifi - Configure WiFi` puis l'option `1 Connect to WiFi network`. Sléectionnez le réseau correspondant puis saisissez sont mot de passe pour vous connecter au réseau Wi-Fi.

6. Revenez sur la page d'accueil du script de configuration de RetroPie.

    Sélectionnez l'option `U Update` pour mettre à jour entièrement le système.

7. Une fois les mises à jours terminées, quittez le script de configuration de RetroPie pour revenir à la console.

    Exécutez les commandes suivantes pour lancer le second script qui va appliquer des réglages HDMI optimisés (1080p à 60 Hz), overclocker modéremment le Raspberry Pi 400 pour de meilleures performances, optimiser la latence, la vidéo, l'audio et l'interface de RetroArch :

    ```bash
    sudo chmod +x /boot/scripts/optimisation-retropie.sh
    ```

    ```bash
    sudo /boot/scripts/optimisation-retropie.sh
    ```

8. Une fois le script terminé, exécutez la commande suivante pour redémarrer le Raspberry Pi 400 :

    ```bash
    sudo reboot
    ```

## Installation des BIOS et des ROMS

1. Copiez les BIOS dans un répertoire `BIOS/` et les ROMS dans un répertoire `roms/` à la racine d'une clé USB.

2. Exécutez la commande suivante pour déplacer les BIOS dans le répertoire adéquat :

    ```bash
    sudo mv /media/usb/BIOS/* /opt/retropie/BIOS/
    ```

3. Exécutez la commande suivante pour déplacer les ROMS dans le répertoire adéquat :

    ```bash
    sudo mv /media/usb/roms/* /home/pi/RetroPie/roms/
    ```
