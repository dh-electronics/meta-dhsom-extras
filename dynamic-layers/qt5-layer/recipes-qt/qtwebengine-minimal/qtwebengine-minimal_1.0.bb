SUMMARY = "QtWebEngine minimal example"
DESCRIPTION = "QtWebEngine widget without chrome."
LICENSE = "GPL-2.0-only"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0-only;md5=801f80980d171dd6425610833a22dbe6"
DEPENDS = "qtwebengine"

SRC_URI = " \
	file://main.cpp \
	file://main.qml \
	file://qml.qrc \
	file://minimal.pro \
	file://qtwebengine-minimal.service \
	"

S = "${WORKDIR}"
B = "${WORKDIR}/${BPN}-${PV}"

inherit qmake5 systemd

EXTRA_QMAKEVARS_PRE += "target.path=${libdir}/${P}"

do_install:append() {
	install -d ${D}${bindir}
	install -m 0755 ${B}/minimal ${D}${bindir}/qtwebengine-minimal
}

# Add package to automatically start the web browser
PACKAGES =+ "${PN}-auto"

FILES:${PN} += "${libdir}/${P}"
FILES:${PN} += "${systemd_unitdir}/system/qtwebengine-minimal.service"

FILES:${PN}-dbg += "${libdir}/${P}/.debug"

RDEPENDS:${PN} += "\
	qtdeclarative-qmlplugins \
	ttf-dejavu-sans \
	ttf-dejavu-sans-condensed \
	ttf-dejavu-sans-mono \
	ttf-dejavu-serif \
	ttf-dejavu-serif-condensed \
	"

do_install:append() {
	install -d ${D}${systemd_unitdir}/system
	install -m 0644 ${WORKDIR}/qtwebengine-minimal.service ${D}${systemd_unitdir}/system/
}

SYSTEMD_PACKAGES = "${PN}"
SYSTEMD_AUTO_ENABLE = "disable"
SYSTEMD_SERVICE:${PN} = "qtwebengine-minimal.service"
