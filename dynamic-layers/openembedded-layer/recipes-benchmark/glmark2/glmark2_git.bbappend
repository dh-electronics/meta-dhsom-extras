PACKAGECONFIG:dh-stm32mp1-dhsom = "${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'wayland-gles2', '', d)} drm-gles2"
