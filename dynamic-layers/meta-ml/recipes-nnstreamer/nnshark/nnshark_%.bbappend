NNSHARK_SRC:use-nxp-bsp = "gitsm://source.codeaurora.org/external/imx/nnshark.git;protocol=https"

do_configure:prepend:use-nxp-bsp() {
    sed -i "/git submodule/ d" ${S}/autogen.sh
}
