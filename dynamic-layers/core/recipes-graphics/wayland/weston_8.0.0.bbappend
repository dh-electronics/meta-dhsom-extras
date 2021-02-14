FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

# Kiosk shell
PACKAGECONFIG[shell-kiosk] = "-Dshell-kiosk=true,-Dshell-kiosk=false"

SRC_URI_append_dh-stm32mp1-dhsom = " \
	file://0001-kiosk-shell-Introduce-kiosk-fullscreen-shell-for-des.patch \
	file://0002-kiosk-shell-Keep-track-of-seats-created-and-destroy-.patch \
	"

PACKAGECONFIG_append_dh-stm32mp1-dhsom = " shell-kiosk "
