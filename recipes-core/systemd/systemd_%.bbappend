FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}/${LAYERSERIES_CORENAMES}:"

DH_SRC_URI_KIRKSTONE = " \
	file://0001-udev-Handle-AMBA-bus-the-same-way-as-generic-platfor.patch \
	"

SRC_URI:append:dh-dhsom = " \
	${@d.getVar('DH_SRC_URI_KIRKSTONE') if (d.getVar('LAYERSERIES_CORENAMES') in ["kirkstone"]) else ''} \
	"
