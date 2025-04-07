UNPACKDIR:dh-imx8mp-dhsom = "${WORKDIR}"

do_install:prepend:dh-imx8mp-dhsom() {
	# meta-tensorflow master branch already expects python 3.13,
	# create a copy of the wheel so the glob in meta-tensorflow
	# tensorflow-lite recipe matches on the copy of the wheel and
	# installs it using pip.
	install -D -m0644 ${S}/tensorflow/lite/tools/pip_package/gen/tflite_pip/python3/dist/tflite_runtime-${PV}*cp312*.whl ${S}/tensorflow/lite/tools/pip_package/gen/tflite_pip/python3/dist/tflite_runtime-${PV}cp313-cp312-cp312-linux_x86_64.whl
}
