FILESEXTRAPATHS:prepend:dh-dhsom := "${THISDIR}/${PN}/${LAYERSERIES_CORENAMES}:"

DH_SRC_URI_KIRKSTONE = " \
	file://0001-kmssink-Add-NXP-i.MX8M-Plus-LCDIFv3-auto-detection.patch \
	file://0002-kmssink-Add-ST-STM32-LTDC-auto-detection.patch \
	"

SRC_URI:append:dh-dhsom = " \
	${@d.getVar('DH_SRC_URI_KIRKSTONE') if (d.getVar('LAYERSERIES_CORENAMES') in ["dunfell", "kirkstone"]) else ''} \
	"
