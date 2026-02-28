EXTRA_OEMESON:append:dh-dhsom = " ${@'-Dlegacy-wayland=bind-wayland-display' if bb.utils.vercmp_string_op(d.getVar('PV').strip('%'), '25.2', '>') else ''}"
