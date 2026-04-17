PACKAGECONFIG:append:dh-dhsom = " ${@'egl glesv2' if (d.getVar('LAYERSERIES_CORENAMES') in ["kirkstone"]) else ''}"
PACKAGECONFIG:remove:dh-dhsom = "opengl"
