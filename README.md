OpenEmbedded demo extras layer for DH electronics platforms
===========================================================

This layer provides demo extras and examples for
DH electronics platforms.

Dependencies
------------

This layer depends on:

* URI: git://git.yoctoproject.org/poky
  - branch: dunfell
  - layers: meta

Building image
--------------

A good starting point for setting up the build environment is is the official
Yocto Project wiki.

* https://www.yoctoproject.org/docs/3.1/brief-yoctoprojectqs/brief-yoctoprojectqs.html

Before attempting the build, the following metalayer git repositories shall
be cloned into a location accessible to the build system and a branch listed
below shall be checked out. The examples below will use /path/to/OE/ as a
location of the metalayers.

* git://git.yoctoproject.org/poky					(branch: dunfell)
* https://source.denx.de/denx/meta-mainline-common.git			(branch: dunfell-3.1)

Additional optional layers handled by means of dynamic layers:
* https://github.com/dh-electronics/meta-dhsom-imx-bsp.git		(branch: dunfell-3.1)
* https://github.com/dh-electronics/meta-dhsom-stm32-bsp.git		(branch: dunfell-3.1)
* https://github.com/dh-electronics/meta-dhsom-extras.git		(branch: dunfell-3.1)
* https://source.denx.de/denx/meta-mainline-graphics.git		(branch: dunfell-3.1)
* https://github.com/openembedded/meta-openembedded.git			(branch: dunfell)
* git://git.openembedded.org/meta-python2				(branch: dunfell)
* https://github.com/meta-qt5/meta-qt5.git				(branch: master)
* https://github.com/kraj/meta-clang					(branch: dunfell)
* https://github.com/OSSystems/meta-browser.git				(branch: master)
* git://git.yoctoproject.org/meta-security				(branch: dunfell)
* https://github.com/Igalia/meta-webkit.git				(branch: dunfell)
* https://github.com/cazfi/meta-games.git				(branch: master)

With all the source artifacts in place, proceed with setting up the build
using oe-init-build-env as specified in the Yocto Project wiki.

In addition to the content in the wiki, the aforementioned metalayers shall
be referenced in bblayers.conf in this order:

```
BBLAYERS ?= " \
  /path/to/OE/poky/meta \
  /path/to/OE/meta-python2 \
  /path/to/OE/meta-openembedded/meta-oe \
  /path/to/OE/meta-openembedded/meta-networking \
  /path/to/OE/meta-openembedded/meta-perl \
  /path/to/OE/meta-openembedded/meta-python \
  /path/to/OE/meta-openembedded/meta-webserver \
  /path/to/OE/meta-qt5 \
  /path/to/OE/meta-clang \
  /path/to/OE/meta-browser/meta-chromium \
  /path/to/OE/meta-security \
  /path/to/OE/meta-webkit \
  /path/to/OE/meta-games \
  /path/to/OE/meta-mainline-common \
  /path/to/OE/meta-mainline-graphics \
  /path/to/OE/meta-dhsom-imx-bsp \
  /path/to/OE/meta-dhsom-stm32-bsp \
  /path/to/OE/meta-dhsom-extras \
  "
```

The following specifics should be placed into local.conf:

```
MACHINE = "dh-stm32mp1-dhcom-pdk2"
DISTRO = "dhlinux"
```

Note that MACHINE must be either of:

* dh-imx6-dhcom-pdk2		(depends on: meta-dhsom-imx-bsp)
* dh-stm32mp1-dhcom-drc02	(depends on: meta-dhsom-stm32-bsp)
* dh-stm32mp1-dhcom-pdk2	(depends on: meta-dhsom-stm32-bsp)
* dh-stm32mp1-dhcom-picoitx	(depends on: meta-dhsom-stm32-bsp)
* dh-stm32mp1-dhcor-avenger96	(depends on: meta-dhsom-stm32-bsp)

Adapt the suffixes of all the files and names of directories further in
this documentation according to MACHINE.

Both local.conf and bblayers.conf are included verbatim in full at the end
of this readme.

Once the configuration is complete, a full demo system image suitable for
evaluation can be built using:

```
$ bitbake dh-image-demo
```

Once the build completes, the images are available in:

```
tmp/deploy/images/dh-stm32mp1-dhcom-pdk2/
```

The SD card image is specifically in:

```
dh-image-demo-dh-stm32mp1-dhcom-pdk2.wic
```

And shall be written to the SD card using dd:

```
$ dd if=dh-image-demo-dh-stm32mp1-dhcom-pdk2.wic of=/dev/sdX bs=8M
```

Example local.conf
------------------
```
MACHINE = "dh-stm32mp1-dhcom-pdk2"
DL_DIR = "/path/to/OE/downloads"
DISTRO ?= "dhlinux"
PACKAGE_CLASSES ?= "package_rpm"
EXTRA_IMAGE_FEATURES = "debug-tweaks"
USER_CLASSES ?= "buildstats"
PATCHRESOLVE = "noop"
BB_DISKMON_DIRS = "\
    STOPTASKS,${TMPDIR},1G,100K \
    STOPTASKS,${DL_DIR},1G,100K \
    STOPTASKS,${SSTATE_DIR},1G,100K \
    STOPTASKS,/tmp,100M,100K \
    ABORT,${TMPDIR},100M,1K \
    ABORT,${DL_DIR},100M,1K \
    ABORT,${SSTATE_DIR},100M,1K \
    ABORT,/tmp,10M,1K"
PACKAGECONFIG:append:pn-qemu-native = " sdl"
PACKAGECONFIG:append:pn-nativesdk-qemu = " sdl"
CONF_VERSION = "1"
```

Example bblayers.conf
---------------------
```
# LAYER_CONF_VERSION is increased each time build/conf/bblayers.conf
# changes incompatibly
POKY_BBLAYERS_CONF_VERSION = "2"

BBPATH = "${TOPDIR}"
BBFILES ?= ""

BBLAYERS ?= " \
	/path/to/OE/poky/meta \
	/path/to/OE/meta-python2 \
	/path/to/OE/meta-openembedded/meta-oe \
	/path/to/OE/meta-openembedded/meta-networking \
	/path/to/OE/meta-openembedded/meta-perl \
	/path/to/OE/meta-openembedded/meta-python \
	/path/to/OE/meta-openembedded/meta-webserver \
	/path/to/OE/meta-qt5 \
	/path/to/OE/meta-clang \
	/path/to/OE/meta-browser/meta-chromium \
	/path/to/OE/meta-security \
	/path/to/OE/meta-webkit \
	/path/to/OE/meta-games \
	/path/to/OE/meta-mainline-common \
	/path/to/OE/meta-mainline-graphics \
	/path/to/OE/meta-dhsom-imx-bsp \
	/path/to/OE/meta-dhsom-stm32-bsp \
	/path/to/OE/meta-dhsom-extras \
	"
```
