FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRC_URI:append:dh-stm32mp1-dhsom = " \
           file://weston.service \
           file://weston.socket \
           file://weston-autologin \
	   "

do_install:append:dh-stm32mp1-dhsom() {
	rm ${D}${systemd_system_unitdir}/weston@.service
	rm ${D}${sysconfdir}/udev/rules.d/71-weston-drm.rules
	rmdir ${D}${sysconfdir}/udev/rules.d
	rmdir ${D}${sysconfdir}/udev
	rm ${D}${bindir}/weston-start
	rmdir ${D}${bindir}
	rmdir ${D}/usr

	# Install Weston systemd service and accompanying udev rule
	install -D -p -m0644 ${WORKDIR}/weston.service ${D}${systemd_system_unitdir}/weston.service
	install -D -p -m0644 ${WORKDIR}/weston.socket ${D}${systemd_system_unitdir}/weston.socket
        if [ "${@bb.utils.filter('DISTRO_FEATURES', 'pam', d)}" ]; then
		install -D -p -m0644 ${WORKDIR}/weston-autologin ${D}${sysconfdir}/pam.d/weston-autologin
        fi
	sed -i -e s:/etc:${sysconfdir}:g \
		-e s:/usr/bin:${bindir}:g \
		-e s:/var:${localstatedir}:g \
		${D}${systemd_unitdir}/system/weston.service

	install -dm 755 -o weston -g weston ${D}/home/weston
}

inherit ${@'useradd' if ("dh-stm32mp1-dhsom" in d.getVar("MACHINEOVERRIDES", True).split(":")) else ' '}

USERADD_PACKAGES:dh-stm32mp1-dhsom = "${PN}"

FILES:${PN}:dh-stm32mp1-dhsom = "\
    ${sysconfdir}/xdg/weston/weston.ini \
    ${systemd_system_unitdir}/weston.service \
    ${systemd_system_unitdir}/weston.socket \
    ${sysconfdir}/default/weston \
    ${sysconfdir}/pam.d/ \
    /home/weston \
    "

SYSTEMD_SERVICE:${PN}:dh-stm32mp1-dhsom = "weston.service weston.socket"
USERADD_PARAM:${PN}:dh-stm32mp1-dhsom = "--home /home/weston --shell /bin/sh --user-group -G video,input weston"
GROUPADD_PARAM:${PN}:dh-stm32mp1-dhsom = "-r wayland"
