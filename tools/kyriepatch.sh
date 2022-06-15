micode="$(file_getprop /system/build.prop ro.miui.ui.version.code)"

# cleanup it first
patch_cmdline msm_dsi.phyd_multiplier=10 ""

# begin adding phy dimension multiplier
if [ "$micode" -gt 12 ]; then
    ui_print "MIUI 13 (or newer) is detected, setting up panel compatibility...";
    patch_cmdline androidboot.hardware=qcom \
        "androidboot.hardware=qcom msm_dsi.phyd_multiplier=10"
fi
