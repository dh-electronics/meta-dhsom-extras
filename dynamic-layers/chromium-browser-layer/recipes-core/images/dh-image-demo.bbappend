IMAGE_INSTALL:append:dh-stm32mp1-dhsom = " ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'chromium-ozone-wayland', '', d)} "
