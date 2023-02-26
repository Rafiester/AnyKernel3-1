cmdl_add() {
    local fh=$split_img/header
    local fhmod=$split_img/header.mod
    if ! grep "$1" ; then
        cat $fh | sed -E "s/cmdline=(.*)/cmdline=\1 $1/" > $fhmod
        mv $fhmod $fh
    fi
}

cmdl_rm() {
    local fh=$split_img/header
    local fhmod=$split_img/header.mod
    if grep "$1" $fh; then
        cat $fh | sed -E "s/ $1//" $fh > $fhmod
        mv $fhmod $fh
    fi
}

patch_mi() {
    # cleanup it first
    cmdl_rm msm_dsi.phyd_multiplier=10

    local vi=$(file_getprop /system/build.prop ro.system.build.version.incremental)
    if contains "$ZIPFILE" "miui.zip" || contains "$vi" "V13." || contains "$vi" "V14." ; then
        ui_print "MIUI is detected: $vi";
        ui_print "Setting up panel compatibility...";
        cmdl_add msm_dsi.phyd_multiplier=10
    fi
}

patch_mi
