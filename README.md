# Configuration personnelle de RetroPie

Il s'agit de ma configuration personnelle pour paramétrer semi-automatiquement RetroPie sur Raspberry Pi 400.

## Installation de RetroPie

Depuis un ordinateur, téléchargez et installez RetroPie sur le Raspberry Pi 400 par l'intermédiaire d'une carte micro-SD en suivant [les étapes de première installation du site officiel](https://retropie.org.uk/docs/First-Installation/).

## Configuration de RetroPie

1. Depuis un ordinateur, téléchargez [l'archive de ce dépôt](https://github.com/qiaeru/retropie/archive/refs/heads/main.zip) et décompressez le contenu à la racine de la carte micro-SD.

2. Insérez la carte micro-SD dans le Raspberry Pi 400 et démarrez-le jusqu'au chargement de la page d'accueil d'_EmulationStation_ proposant de configurer une manette.

3. Pressez la touche `F4` du Raspberry Pi 400 pour accéder au terminal de RetroPie.

4. Exécutez la commande suivante pour lancer le premier script qui va configurer certains paramètres régionaux :

    ```bash
    sudo /boot/scripts/configuration.sh
    ```

    Attention, il est important de noter qu'à ce stade, **le clavier est en QWERTY et non en AZERTY** ! L'exécution du script permettra de passer automatiquement la disposition du clavier en AZERTY.

5. Une fois le script terminé, exécutez la commande suivante pour redémarrer le Raspberry Pi 400 :

    ```bash
    sudo reboot
    ```

6. Après avoir redémarré, pressez la touche `F4` du Raspberry Pi 400 pour accéder à nouveau au terminal de RetroPie. Exécutez la commande suivante pour lancer le script de configuration de RetroPie :

    ```bash
    sudo /home/pi/RetroPie-Setup/retropie_setup.sh
    ```

    Validez l'ensemble des messages qui apparaissent. Depuis l'interface, sélectionnez l'option `C Configuration / tools`, l'option `236 wifi - Configure WiFi` puis l'option `1 Connect to WiFi network`. Sélectionnez votre réseau puis saisissez son mot de passe pour vous connecter à internet.

7. Revenez sur la page d'accueil du script de configuration de RetroPie.

    Sélectionnez l'option `U Update` pour mettre à jour entièrement le système en validant l'ensemble des messages qui apparaissent.

8. Une fois les mises à jours terminées, quittez le script de configuration de RetroPie pour revenir au terminal. Exécutez la commande suivante pour lancer le second script qui va optimiser la latence, la vidéo, l'audio et l'interface de RetroArch :

    ```bash
    sudo /boot/scripts/optimisation.sh
    ```

9. Une fois le script terminé, exécutez la commande suivante pour redémarrer une dernière fois le Raspberry Pi 400 :

    ```bash
    sudo reboot
    ```

## Configuration des BIOS

### Installation des BIOS

1. Copiez les BIOS dans un répertoire `BIOS/` à la racine d'une clé USB.

2. Depuis le terminal du Raspberry Pi 400, exécutez la commande suivante pour déplacer les BIOS dans le répertoire adéquat :

    ```bash
    sudo mv /media/usb/BIOS/* /home/pi/RetroPie/BIOS /
    ```

### Arborescence des BIOS personnels

```bash
BIOS/
  dc/
    dc_boot.bin
    dc_flash.bin
scph7001.bin
scph5501.bin
scph1001.bin
scph101.bin
psxonpsp660.bin
```

## Configuration des ROMS

### Installation des ROMS

1. Copiez les ROMS dans un répertoire `roms/` à la racine d'une clé USB.

2. Depuis le terminal du Raspberry Pi 400, exécutez la commande suivante pour déplacer les ROMS dans le répertoire adéquat :

    ```bash
    sudo mv /media/usb/roms/* /home/pi/RetroPie/roms/
    ```

### Arborescence des ROMS personnelles

```bash
roms/
  dreamcast/
    Shenmue/
  gba/
    Advance Wars.gba
    Advance Wars 2 - Black Hole Rising.gba
    Astro Boy - Omega Factor.gba
    Boktai - The Sun Is in Your Hand.gba
    Boktai 2 - Solar Boy Django.gba
    Castlevania.gba
    Castlevania - Aria of Sorrow.gba
    Castlevania - Harmony of Dissonance.gba
    Final Fantasy I & II - Dawn of Souls.gba
    Final Fantasy IV Advance.gba
    Final Fantasy V Advance.gba
    Final Fantasy VI Advance.gba
    Final Fantasy Tactics Advance.gba
    Fire Emblem.gba
    Fire Emblem - The Sacred Stones.gba
    F-Zero - GP Legend.gba
    Golden Sun.gba
    Golden Sun - L'Age Perdu.gba
    Kirby - Nightmare in Dream Land.gba
    Mario & Luigi - Superstar Saga.gba
    Mario Golf - Advance Tour.gba
    Mario Kart - Super Circuit.gba
    Mario Power Tennis.gba
    Megaman Zero.gba
    Megaman Zero 2.gba
    Megaman Zero 3.gba
    Megaman Zero 4.gba
    Metroid - Zero Mission.gba
    Metroid Fusion.gba
    Mother 3.gba
    Pokemon - Emeraude.gba
    Pokemon - Rouge Feu.gba
    Pokemon - Rubis.gba
    Pokemon - Saphir.gba
    Pokemon - Vert Feuille.gba
    Sonic Advance.gba
    Sonic Advance 2.gba
    Sonic Advance 3.gba
    Sword of Mana.gba
    The Legend of Zelda - A Link to the Past & Four Swords.gba
    The Legend of Zelda - The Minish Cap.gba
    Wario Land 4.gba
    WarioWare, Inc. - Minigame Mania.gba
  psx/
    Final Fantasy VII/
  snes/
    Chrono Trigger.sfc
    Donkey Kong Country.sfc
    Donkey Kong Country 2 - Diddy's Kong Quest.sfc
    Donkey Kong Country 3 - Dixie Kong's Double Trouble!.sfc
    EarthBound.sfc
    F-Zero.sfc
    Mega Man X.sfc
    Mega Man X2.sfc
    Mega Man X3.sfc
    Secret of Mana.sfc
    Star Fox.sfc
    Street Fighter II Turbo.sfc
    Super Castlevania IV.sfc
    Super Mario Kart.sfc
    Super Mario World.sfc
    Super Mario World 2 - Yoshi's Island.sfc
    Super Metroid.sfc
```

## Résolution de problèmes rencontrés

1. Dans le cas où le réseau Wi-Fi n'apparaît pas, retournez au terminal du Raspberry Pi 400 et exécutez la commande suivante pour ouvrir sa configuration :

    ```bash
    sudo raspi-config
    ```

    Sélectionnez l'option `5 Localisation Options`, l'option `L4 WLAN Country` puis l'option `FR France`.

    Relancez à présent le script de configuration de RetroPie et retentez de vous connecter au réseau Wi-Fi :

     ```bash
    sudo /home/pi/RetroPie-Setup/retropie_setup.sh
    ```
