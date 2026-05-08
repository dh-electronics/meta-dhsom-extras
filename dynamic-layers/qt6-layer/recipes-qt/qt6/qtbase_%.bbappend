PACKAGECONFIG:append:dh-dhsom = " \
	eglfs linuxfb gles2 kms gbm fontconfig accessibility \
	xkbcommon libinput \
	${@'examples' if (bb.utils.vercmp_string_op(d.getVar('QT_VERSION'), '6.11.0', '<')) else ''} \
	"
PACKAGECONFIG:remove:dh-dhsom = "gl"
