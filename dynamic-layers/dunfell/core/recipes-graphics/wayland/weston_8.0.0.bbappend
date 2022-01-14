FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRC_URI:append:dh-dhsom = " \
	file://0001-kiosk-shell-Introduce-kiosk-fullscreen-shell-for-des.patch \
	file://0002-kiosk-shell-Keep-track-of-seats-created-and-destroy-.patch \
	file://0003-kiosk-shell-Give-keyboard-focus-when-mapping-the-sur.patch \
	file://0007-kiosk-shell-Embed-keyboard-focus-activation-code.patch \
	"
