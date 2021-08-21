SUMMARY = "An image with various examples and demos"

LICENSE = "MIT"

inherit core-image

IMAGE_INSTALL:append:dh-dhsom = " \
	kernel-modules u-boot-default-env libubootenv-bin mtd-utils \
	ca-certificates iw dropbear iproute2 init-ifupdown \
	i2c-tools canutils systemd-conf openssl-engines rng-tools \
	libdrm mesa \
	libegl-mesa libgbm libgles1-mesa libgles2-mesa \
	libglapi mesa-megadriver devmem2 \
	\
	gstreamer1.0 gstreamer1.0-plugins-base \
	gstreamer1.0-plugins-good gstreamer1.0-plugins-bad \
	\
	weston weston-init weston-examples kmscube \
	${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'weston-xwayland', '', d)} \
	piglit iperf3 stress-ng ethtool \
	\
	nano evtest minicom screen \
	"

IMAGE_FEATURES:append:dh-dhsom = " \
	dev-pkgs tools-sdk tools-debug tools-profile debug-tweaks \
	"
