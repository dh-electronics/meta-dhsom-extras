FILESEXTRAPATHS:prepend:dh-dhsom := "${THISDIR}/${PN}:"

SRC_URI:append:dh-dhsom = " ${@'' if (d.getVar('LAYERSERIES_CORENAMES') in ['scarthgap']) else 'file://0943a54.patch'}"

PACKAGECONFIG:append:dh-dhsom = " ${@'examples' if (bb.utils.vercmp_string_op(d.getVar('QT_VERSION'), '6.11.0', '<')) else ''}"
