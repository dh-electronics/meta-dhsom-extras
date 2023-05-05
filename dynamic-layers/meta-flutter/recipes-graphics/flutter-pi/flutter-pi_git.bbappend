FILESEXTRAPATHS:prepend:dh-dhsom := "${THISDIR}/${PN}:"
SRC_URI:append:dh-dhsom = " \
	file://0001-pixel_format-Fix-ARGB8888-DRM-format.patch \
	file://0002-gbm-Do-not-override-pixel-format-set-on-command-line.patch \
	file://0003-gbm-Default-to-XRGB8888-framebuffer.patch \
	"
