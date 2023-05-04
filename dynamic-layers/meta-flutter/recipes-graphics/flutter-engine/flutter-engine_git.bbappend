do_install:prepend:dh-dhsom() {
    if [ "${TARGET_ARCH}" = "arm" ] ; then
        FLUTTER_RUNTIME_MODES="${@bb.utils.filter('PACKAGECONFIG', 'debug profile release jit_release', d)}"
        for MODE in $FLUTTER_RUNTIME_MODES; do
            BUILD_DIR="$(echo ${TMP_OUT_DIR} | sed "s/_RUNTIME_/${MODE}/g")"
            touch ${S}/${BUILD_DIR}/clang_x64/exe.unstripped/analyze_snapshot
            touch ${S}/${BUILD_DIR}/clang_x64/exe.unstripped/dart
        done
    fi
}
