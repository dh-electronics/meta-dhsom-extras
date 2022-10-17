require recipes-core/images/dh-image-demo.bb

IMAGE_INSTALL:remove:mx8mp-nxp-bsp = " \
	mesa libegl-mesa libgles1-mesa libgles2-mesa \
	mesa-megadriver \
	"
