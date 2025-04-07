python __anonymous() {
    if (d.getVar('LAYERSERIES_CORENAMES') in ["kirkstone", "scarthgap"]):
        d.setVar('S', d.getVar("WORKDIR"))
}
