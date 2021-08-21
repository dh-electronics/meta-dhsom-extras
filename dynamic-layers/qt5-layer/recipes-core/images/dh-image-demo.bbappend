inherit populate_sdk_qt5

IMAGE_INSTALL:append:dh-dhsom = " \
	qtwebengine-minimal qtwebengine-examples qtbase-examples \
	qtmultimedia-examples qtwayland \
	"
