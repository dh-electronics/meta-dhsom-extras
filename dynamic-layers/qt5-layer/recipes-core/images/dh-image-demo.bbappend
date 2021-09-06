inherit populate_sdk_qt5

IMAGE_INSTALL:append:dh-dhsom = " \
	qt5-extra-config \
	qtwebengine-minimal qtwebengine-examples qtbase-examples \
	qtmultimedia-examples qtwayland \
	"
