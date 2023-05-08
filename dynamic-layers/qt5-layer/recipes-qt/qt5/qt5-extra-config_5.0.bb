DESCRIPTION = "Extra configuration files for qt5"
LICENSE = "LGPLv2.1"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/LGPL-2.1${@'' if (d.getVar('LAYERSERIES_CORENAMES') in ["dunfell"]) else '-only'};md5=1a6d268fd218675ffea8be556788b780"

inherit allarch

PACKAGE_ARCH = "${MACHINE_ARCH}"
EXCLUDE_FROM_SHLIBS = "1"
INHIBIT_DEFAULT_DEPS = "1"
INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
INHIBIT_PACKAGE_STRIP = "1"

S = "${WORKDIR}"

SRC_URI:append = " file://qt5-eglfs.sh"

SRC_URI:dh-stm32mp1-dhsom:append = " file://qt5-eglfs-kms.json"

SRC_URI:dh-imx6-dhsom:append = " file://qt5-eglfs-kms.json"

SRC_URI:dh-imx6ull-dhsom:append = " file://qt5-eglfs-kms.json"

SRC_URI:dh-imx8mp-dhsom:append = " \
	file://qt5-eglfs-kms-dsi.json \
	file://qt5-eglfs-kms-hdmi.json \
	file://qt5-eglfs-kms-lvds.json \
	"

do_install () {
	install -d ${D}${sysconfdir}/default/
	install -m 0644 ${WORKDIR}/qt5-eglfs-kms*.json ${D}${sysconfdir}/default/

	install -d ${D}${sysconfdir}/profile.d/
	install -m 0755 ${WORKDIR}/qt5-eglfs.sh ${D}${sysconfdir}/profile.d/
}
