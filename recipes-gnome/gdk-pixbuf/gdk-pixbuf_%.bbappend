EXTRA_OEMESON:append:dh-dhsom = " ${@'' if (d.getVar('LAYERSERIES_CORENAMES') in ["kirkstone"]) else '-Dothers=enabled'}"
