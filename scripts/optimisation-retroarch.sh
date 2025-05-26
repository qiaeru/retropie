#!/bin/bash

# Chemin du fichier
RETROARCH_CFG="/opt/retropie/configs/all/retroarch.cfg"

echo "==> Sauvegarde du fichier existant"
cp "$RETROARCH_CFG" "${RETROARCH_CFG}.bak"

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
