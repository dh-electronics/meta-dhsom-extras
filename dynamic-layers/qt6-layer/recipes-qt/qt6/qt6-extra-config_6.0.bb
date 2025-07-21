SUMMARY = "Extra configuration files for qt6"
LICENSE = "LGPL-2.1-only"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/LGPL-2.1-only;md5=1a6d268fd218675ffea8be556788b780"

EXCLUDE_FROM_SHLIBS = "1"
INHIBIT_DEFAULT_DEPS = "1"
INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
INHIBIT_PACKAGE_STRIP = "1"

SRC_URI:append = " file://qt6-eglfs.sh"

SRC_URI:dh-stm32mp-dhsom:append = " file://qt6-eglfs-kms.json"

SRC_URI:dh-imx6-dhsom:append = " file://qt6-eglfs-kms.json"

SRC_URI:dh-imx6ull-dhsom:append = " file://qt6-eglfs-kms.json"

SRC_URI:dh-imx8mp-dhsom:append = " \
	file://qt6-eglfs-kms-dsi.json \
	file://qt6-eglfs-kms-hdmi.json \
	file://qt6-eglfs-kms-lvds.json \
	"

S = "${WORKDIR}"

inherit allarch

PACKAGE_ARCH = "${MACHINE_ARCH}"

do_install () {
	install -d ${D}${sysconfdir}/default/
	install -m 0644 ${WORKDIR}/qt6-eglfs-kms*.json ${D}${sysconfdir}/default/

	install -d ${D}${sysconfdir}/profile.d/
	install -m 0755 ${WORKDIR}/qt6-eglfs.sh ${D}${sysconfdir}/profile.d/
}
