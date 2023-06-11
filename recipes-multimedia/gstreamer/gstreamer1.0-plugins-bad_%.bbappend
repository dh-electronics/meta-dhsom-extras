FILESEXTRAPATHS:prepend:dh-dhsom := "${THISDIR}/${PN}/${LAYERSERIES_CORENAMES}:"

SRC_URI:append:dh-dhsom = " \
	file://0001-kmssink-Add-NXP-i.MX8M-Plus-LCDIFv3-auto-detection.patch \
	file://0002-kmssink-Add-ST-STM32-LTDC-auto-detection.patch \
	"
