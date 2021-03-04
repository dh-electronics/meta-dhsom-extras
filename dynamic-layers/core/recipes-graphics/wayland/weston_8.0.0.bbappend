FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

# Kiosk shell
PACKAGECONFIG[shell-kiosk] = "-Dshell-kiosk=true,-Dshell-kiosk=false"

SRC_URI_append_dh-stm32mp1-dhsom = " \
	file://0001-kiosk-shell-Introduce-kiosk-fullscreen-shell-for-des.patch \
	file://0002-kiosk-shell-Keep-track-of-seats-created-and-destroy-.patch \
	file://0003-kiosk-shell-Give-keyboard-focus-when-mapping-the-sur.patch \
	file://0004-desktop-shell-Remove-no-op-de-activation-of-the-xdg-.patch \
	file://0005-desktop-shell-Rename-gain-lose-keyboard-focus-to-pro.patch \
	file://0006-desktop-shell-Embed-keyboard-focus-handle-code-when-.patch \
	file://0007-kiosk-shell-Embed-keyboard-focus-activation-code.patch \
	file://0008-libweston-Rename-weston_view_activate-to-weston_view.patch \
	"

PACKAGECONFIG_append_dh-stm32mp1-dhsom = " shell-kiosk "
