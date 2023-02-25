# cleanup it first
patch_cmdline msm_dsi.phyd_multiplier=10 ""

build_ver=$(file_getprop /system/build.prop ro.system.build.version.incremental)
if contains "$ZIPFILE" "miui.zip" \
    || contains "$build_ver" "V13." \
    || contains "$build_ver" "V14." ; then
    ui_print "MIUI is detected: $build_ver";
    ui_print "Setting up panel compatibility...";
    patch_cmdline androidboot.hardware=qcom \
        "androidboot.hardware=qcom msm_dsi.phyd_multiplier=10"
fi
