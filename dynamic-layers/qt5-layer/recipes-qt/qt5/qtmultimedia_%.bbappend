PACKAGECONFIG_APPEND_DH_STM32MP1 = " gstreamer ${@'examples' if (d.getVar('LAYERSERIES_CORENAMES') not in ["zeus"]) else ''}"
PACKAGECONFIG_append_dh-stm32mp1-dhcom-pdk2 = " ${PACKAGECONFIG_APPEND_DH_STM32MP1} "
PACKAGECONFIG_append_dh-stm32mp1-dhcor-avenger96 = " ${PACKAGECONFIG_APPEND_DH_STM32MP1} "
