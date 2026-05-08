PACKAGECONFIG:append:dh-dhsom = " gstreamer ${@'examples' if (bb.utils.vercmp_string_op(d.getVar('QT_VERSION'), '6.11.0', '<')) else ''}"
