#!/bin/bash

# Chemins des fichiers
CONFIG_TXT="/boot/config.txt"
RETROARCH_CFG="/opt/retropie/configs/all/retroarch.cfg"

echo "==> Sauvegarde des fichiers existants"
cp "$CONFIG_TXT" "${CONFIG_TXT}.bak"
cp "$RETROARCH_CFG" "${RETROARCH_CFG}.bak"

echo "==> Configuration de /boot/config.txt..."

cat > "$CONFIG_TXT" <<EOF
# Résolution 1080p @ 60Hz pour compatibilité et performance
hdmi_force_hotplug=1
hdmi_group=1
hdmi_mode=16
hdmi_drive=2

# Désactiver l'overscan
disable_overscan=1

# Forcer l'audio HDMI
hdmi_force_edid_audio=1

# Plus de mémoire GPU
gpu_mem=256

# Performances CPU/GPU
arm_freq=2000
gpu_freq=600
over_voltage=2

# Accélération graphique
dtoverlay=vc4-fkms-v3d
max_framebuffers=2

# Améliorer stabilité HDMI
config_hdmi_boost=7

# Supprimer le splash coloré au démarrage
disable_splash=1
EOF

echo "==> Configuration de retroarch.cfg..."

# Fonction pour modifier/ajouter une clé dans retroarch.cfg
set_cfg() {
    local key="$1"
    local value="$2"
    if grep -q "^${key} = " "$RETROARCH_CFG"; then
        sed -i "s|^${key} = .*|${key} = ${value}|" "$RETROARCH_CFG"
    else
        echo "${key} = ${value}" >> "$RETROARCH_CFG"
    fi
}

# Vidéo
set_cfg video_driver '"gl"'
set_cfg video_threaded "false"
set_cfg video_max_swapchain_images "2"
set_cfg video_frame_delay "1"
set_cfg vsync "true"

# Latence
set_cfg run_ahead_enabled "true"
set_cfg run_ahead_frames "1"
set_cfg run_ahead_secondary_instance "true"

# Audio
set_cfg audio_latency "64"
set_cfg audio_sync "true"

# Shaders
set_cfg video_shader_enable "true"
set_cfg video_shader '"/opt/retropie/emulators/retroarch/shaders/shaders_cg/zfast_crt/zfast_crt.cgp"'

# Interface
set_cfg menu_driver '"ozone"'

echo "==> Optimisation terminée."
