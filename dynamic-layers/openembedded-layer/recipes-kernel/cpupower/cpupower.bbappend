# Remove this when OE kirkstone support is removed in April 2026
# nooelint: oelint.vars.pathhardcode.libdir, oelint.vars.pathhardcode.nonarch_base_libdir
do_install:append:dh-dhsom() {
	# The cpupower tool always assumes that every system already
	# has merged /usr directory. For OE kirkstone, this is still
	# optional and by default disabled. Cater for this special
	# case and move the service file into plain /lib/systemd .
	if [ "${LAYERSERIES_CORENAMES}" = "kirkstone" -a ${@bb.utils.contains('DISTRO_FEATURES', 'usrmerge', 'True', 'False', d)} = False -a -d ${D}/usr/lib/systemd ]; then
		mkdir -p ${D}/lib/
		mv ${D}/usr/lib/systemd ${D}/lib/
	fi
}

FILES:${PN}:append:dh-dhsom = " ${systemd_system_unitdir}/cpupower.service"
