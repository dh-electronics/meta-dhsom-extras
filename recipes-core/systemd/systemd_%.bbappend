FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRC_URI:append:dh-dhsom = " \
	file://0001-udev-Handle-AMBA-bus-the-same-way-as-generic-platfor.patch \
	"
