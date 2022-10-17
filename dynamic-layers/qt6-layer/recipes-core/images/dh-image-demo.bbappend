inherit populate_sdk_qt6_base

IMAGE_INSTALL:append:dh-dhsom = " \
	packagegroup-qt6-addons \
	packagegroup-qt6-essentials \
	packagegroup-qt6-modules \
	qtbase-examples qtmultimedia-examples qtwebengine-examples \
	"
