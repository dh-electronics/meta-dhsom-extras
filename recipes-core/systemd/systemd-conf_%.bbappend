FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI_append_dh-stm32mp1-dhcor-avenger96 = " file://logind-powerkey.conf "

do_install_append_dh-stm32mp1-dhcor-avenger96() {
	install -D -m0644 ${WORKDIR}/logind-powerkey.conf \
			  ${D}${systemd_unitdir}/logind.conf.d/01-${PN}.conf
}
