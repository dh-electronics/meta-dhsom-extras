inherit populate_sdk_qt6_base

IMAGE_INSTALL:append:dh-dhsom = " \
	packagegroup-qt6-addons \
	packagegroup-qt6-essentials \
	packagegroup-qt6-modules \
	qtbase-examples qtmultimedia-examples \
	${@'' if (d.getVar('LAYERSERIES_CORENAMES') in ["dunfell"]) else 'qtwebengine-examples'} \
	"
