FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRC_URI:append:dh-dhsom = " file://nc.cfg "
