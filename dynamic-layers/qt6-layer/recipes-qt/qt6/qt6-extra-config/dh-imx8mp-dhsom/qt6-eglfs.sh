#!/bin/sh

export ETNA_MESA_DEBUG=nir
export QT_QPA_PLATFORM=eglfs
export QT_QPA_EGLFS_ALWAYS_SET_MODE=1

# Qt5 EGLFS KMS backend supports only one card, pick the correct one here:
# qt6-eglfs-kms-dsi.json
# qt6-eglfs-kms-hdmi.json
# qt6-eglfs-kms-lvds.json
export QT_QPA_EGLFS_KMS_CONFIG=/etc/default/qt6-eglfs-kms-hdmi.json
