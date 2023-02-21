do_configure:prepend:dh-dhsom() {
	sed -i "/kMainBrowserContentsMinimumWidth/ s@500@480@" ${S}/chrome/browser/ui/views/frame/browser_view_layout.h
}
