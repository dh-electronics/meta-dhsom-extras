SUMMARY = "An image with various examples and demos"

LICENSE = "MIT"

inherit core-image

IMAGE_INSTALL:append:dh-dhsom = " \
	u-boot-default-env libubootenv-bin \
	kernel-modules \
	systemd-conf ca-certificates openssl-engines rng-tools \
	mtd-utils i2c-tools e2fsprogs-resize2fs \
	\
	iw iproute2 ethtool pciutils \
	\
	libdrm libdrm-mainline-tests mesa \
	libegl-mesa libgbm libgles1-mesa libgles2-mesa \
	libglapi mesa-megadriver \
	\
	gstreamer1.0 gstreamer1.0-plugins-base \
	gstreamer1.0-plugins-good gstreamer1.0-plugins-bad \
	gdk-pixbuf-loader-bmp \
	\
	weston weston-init weston-examples kmscube \
	${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'weston-xwayland', '', d)} \
	\
	stress-ng \
	\
	minicom screen \
	"

IMAGE_FEATURES:append:dh-dhsom = " \
	dev-pkgs tools-sdk tools-debug tools-profile debug-tweaks \
	ssh-server-dropbear \
	"

SYSTEMD_DEFAULT_TARGET:dh-dhsom = "graphical.target"
