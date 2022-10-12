# cleanup it first
patch_cmdline msm_dsi.phyd_multiplier=10 ""

# begin patching
if contains $ZIPFILE "miui.zip"; then
    ui_print "Setting up panel compatibility for MIUI...";
    patch_cmdline androidboot.hardware=qcom \
        "androidboot.hardware=qcom msm_dsi.phyd_multiplier=10"
    ui_print "Done.";
fi
