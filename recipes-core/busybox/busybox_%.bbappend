FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRC_URI:append:dh-stm32mp1-dhsom = " file://nc.cfg "
