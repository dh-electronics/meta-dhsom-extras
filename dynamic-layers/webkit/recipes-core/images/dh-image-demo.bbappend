IMAGE_INSTALL:append:dh-dhsom = " ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'wpebackend-fdo wpewebkit cog', '', d)} "
