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
