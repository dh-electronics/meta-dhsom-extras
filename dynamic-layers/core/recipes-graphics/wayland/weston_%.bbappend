# Kiosk shell
python __anonymous() {
    if ("dh-stm32mp1-dhsom" in d.getVar("MACHINEOVERRIDES", True).split(":")):
        d.setVarFlag('PACKAGECONFIG', "shell-kiosk", "-Dshell-kiosk=true,-Dshell-kiosk=false")
}

PACKAGECONFIG_append_dh-stm32mp1-dhsom = " shell-kiosk "
