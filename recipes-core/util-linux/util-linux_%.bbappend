FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}/${LAYERSERIES_CORENAMES}:"

DH_SRC_URI_KIRKSTONE = " \
	file://0001-hwclock-increase-indent-in-help-text.patch \
	file://0002-hwclock-add-param-get-option.patch \
	file://0003-hwclock-add-param-set-option.patch \
	file://0004-hwclock-fix-return-value-on-successful-param-get.patch \
	"

SRC_URI:append:dh-dhsom = " \
	${@d.getVar('DH_SRC_URI_KIRKSTONE') if (d.getVar('LAYERSERIES_CORENAMES') in ["kirkstone"]) else ''} \
	"

do_configure:prepend:dh-dhsom() {
	# util-linux 2.39.4 and older in OE scarthgap passes pointer to
	# pointer into ul_strtou64(), instead of pointer to memory. Adjust
	# the code to pass pass pointer to memory. The fix might be part
	# of util-linux 2.39.5 if it is ever released, at which point this
	# sed invocation will have no effect on the source code and could
	# be removed.
	if [ "${LAYERSERIES_CORENAMES}" = "scarthgap" ] ; then
		sed -i '/return ul_strtou64(str, (uint64_t .) .num, base);/ s,&,,' ${S}/sys-utils/hwclock-rtc.c
	fi
}
