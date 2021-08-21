IMAGE_INSTALL:append:dh-dhsom = " ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'chromium-ozone-wayland', '', d)} "
