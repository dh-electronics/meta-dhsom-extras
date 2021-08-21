# Kiosk shell
python __anonymous() {
    if ("dh-dhsom" in d.getVar("MACHINEOVERRIDES", True).split(":")):
        d.setVarFlag('PACKAGECONFIG', "shell-kiosk", "-Dshell-kiosk=true,-Dshell-kiosk=false")
}

PACKAGECONFIG:append:dh-dhsom = " shell-kiosk "
