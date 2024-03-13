inherit populate_sdk_qt6_base

IMAGE_INSTALL:append:dh-dhsom = " \
	qt6-extra-config \
	packagegroup-qt6-addons \
	packagegroup-qt6-essentials \
	packagegroup-qt6-modules \
	qtbase-examples qtmultimedia-examples \
	qtwebengine-examples \
	"
