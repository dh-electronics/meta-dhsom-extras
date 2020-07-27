FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI_append_dh-stm32mp1-dhsom = " file://nc.cfg "
