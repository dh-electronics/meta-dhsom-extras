FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRC_URI:append:dh-dhsom = " \
	file://80-rtc-dhsom.rules \
	file://80-ethsom0.link \
	${@bb.utils.contains("IMAGE_FEATURES", "debug-tweaks", \
	  " file://80-etnaviv-devcoredump.rules file://etnaviv-devcoredump ", "",d)} \
	"

SRC_URI:append:dh-stm32mp1-dhsom = " \
	file://80-ethsom1.link \
	"

SRC_URI:append:dh-stm32mp1-dhcom-drc02 = " \
	file://80-ethusb0.link \
	"

do_install:append:dh-dhsom() {
	install -D -m0644 ${WORKDIR}/80-rtc-dhsom.rules \
			  ${D}${sysconfdir}/udev/rules.d/80-rtc-dhsom.rules
	install -D -m0644 ${WORKDIR}/80-ethsom0.link \
			  ${D}${systemd_unitdir}/network/80-ethsom0.link
	if ${@bb.utils.contains('IMAGE_FEATURES', 'debug-tweaks', 'true', 'false', d )} ; then
		install -D -m0644 ${WORKDIR}/80-etnaviv-devcoredump.rules \
			  ${D}${sysconfdir}/udev/rules.d/80-etnaviv-devcoredump.rules
		install -D -m0755 ${WORKDIR}/etnaviv-devcoredump \
			  ${D}${bindir}/etnaviv-devcoredump
	fi
}

do_install:append:dh-stm32mp1-dhsom() {
	install -D -m0644 ${WORKDIR}/80-ethsom1.link \
			  ${D}${systemd_unitdir}/network/80-ethsom1.link
}

do_install:append:dh-stm32mp1-dhcom-drc02() {
	install -D -m0644 ${WORKDIR}/80-ethusb0.link \
			  ${D}${systemd_unitdir}/network/80-ethusb0.link
}

FILES:${PN}:append:dh-dhsom = " \
	*/udev/rules.d/*.rules \
	*/*/udev/rules.d/*.rules \
	${@bb.utils.contains("IMAGE_FEATURES", "debug-tweaks", \
	  " ${bindir}/etnaviv-devcoredump ", "",d)} \
	"

SRC_URI:append:dh-stm32mp1-dhcor-avenger96 = " file://logind-powerkey.conf "

do_install:append:dh-stm32mp1-dhcor-avenger96() {
	install -D -m0644 ${WORKDIR}/logind-powerkey.conf \
			  ${D}${systemd_unitdir}/logind.conf.d/01-${PN}.conf
}
