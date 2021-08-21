PACKAGECONFIG:dh-dhsom = "${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'wayland-gles2', '', d)} drm-gles2"
