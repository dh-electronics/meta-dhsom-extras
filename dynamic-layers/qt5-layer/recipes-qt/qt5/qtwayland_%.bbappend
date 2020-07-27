PACKAGECONFIG_dh-stm32mp1-dhsom = " \
	wayland-client \
	wayland-server \
	wayland-egl \
	wayland-drm-egl-server-buffer \
	${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'xcomposite-egl xcomposite-glx', '', d)} \
	"
