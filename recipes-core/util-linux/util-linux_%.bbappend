FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}/${LAYERSERIES_CORENAMES}:"

SRC_URI:append:dh-dhsom = " \
	file://0001-hwclock-increase-indent-in-help-text.patch \
	file://0002-hwclock-add-param-get-option.patch \
	file://0003-hwclock-add-param-set-option.patch \
	file://0004-hwclock-fix-return-value-on-successful-param-get.patch \
	${@'file://0005-include-c-add-USAGE_ARGUMENT.patch' if (d.getVar('LAYERSERIES_CORENAMES') in ["dunfell"]) else ''} \
	${@'file://0006-docs-improve-size-arguments-description-in-help-outp.patch' if (d.getVar('LAYERSERIES_CORENAMES') in ["dunfell"]) else ''} \
	"
