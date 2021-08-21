FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

PACKAGECONFIG:append:dh-dhsom = " \
	examples eglfs linuxfb gles2 kms gbm fontconfig freetype accessibility \
	xkbcommon libinput \
	"

SRC_URI:append:dh-dhsom = " \
	file://qt5-eglfs-kms.json \
	file://qt5-eglfs.sh \
	"

do_install:append:dh-dhsom() {
	install -d ${D}${sysconfdir}/default/
	install -m 0644 ${WORKDIR}/qt5-eglfs-kms.json ${D}${sysconfdir}/default/

	install -d ${D}${sysconfdir}/profile.d/
	install -m 0755 ${WORKDIR}/qt5-eglfs.sh ${D}${sysconfdir}/profile.d/
}
