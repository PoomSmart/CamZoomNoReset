GO_EASY_ON_ME = 1

include theos/makefiles/common.mk
export ARCHS = armv7
TWEAK_NAME = CamZoomNoReset
CamZoomNoReset_FILES = CamZoomNoReset.xm

include $(THEOS_MAKE_PATH)/tweak.mk
