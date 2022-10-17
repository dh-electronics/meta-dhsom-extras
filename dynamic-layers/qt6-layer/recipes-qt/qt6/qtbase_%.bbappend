PACKAGECONFIG:append:dh-dhsom = " \
	examples eglfs linuxfb gles2 kms gbm fontconfig freetype accessibility \
	xkbcommon libinput \
	"
PACKAGECONFIG:remove:dh-dhsom = "gl"
