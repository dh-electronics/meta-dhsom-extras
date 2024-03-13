FILESEXTRAPATHS:prepend := "${THISDIR}/${BPN}:"

SYSTEMD_AUTO_ENABLE:dh-dhsom = "enable"

SRC_URI:append:dh-dhsom = " file://weston.sh"

do_install:append:dh-dhsom() {
	install -Dm 0644 ${S}/weston.sh ${D}${sysconfdir}/profile.d/weston.sh
}

FILES:${PN}:append:dh-dhsom = " ${sysconfdir}/profile.d/"
