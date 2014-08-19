################################################################################
#
# weston
#
################################################################################

#WESTON_VERSION = 1.5.0
#WESTON_SITE = http://wayland.freedesktop.org/releases
#WESTON_SOURCE = weston-$(WESTON_VERSION).tar.xz

WESTON_VERSION = HEAD
WESTON_SITE = git://anongit.freedesktop.org/wayland/weston

WESTON_LICENSE = MIT
WESTON_LICENSE_FILES = COPYING
WESTON_AUTORECONF = YES

WESTON_DEPENDENCIES = host-pkgconf wayland libxkbcommon pixman libpng \
	jpeg mtdev udev cairo

WESTON_CONF_OPT = \
	--with-dtddir=$(STAGING_DIR)/usr/share/wayland \
	--disable-xwayland \
	--disable-x11-compositor \
	--disable-headless-compositor \
	--disable-setuid-install \
	--disable-colord

ifeq ($(BR2_PACKAGE_LIBINPUT),y)
WESTON_DEPENDENCIES += libinput
WESTON_CONF_OPT += --enable-libinput-backend
else
WESTON_CONF_OPT += --disable-libinput-backend
endif

ifeq ($(BR2_PACKAGE_LIBUNWIND),y)
WESTON_DEPENDENCIES += libunwind
else
WESTON_CONF_OPT += --disable-libunwind
endif

ifeq ($(BR2_PACKAGE_WESTON_FBDEV),y)
WESTON_CONF_OPT += --enable-fbdev-compositor
else
WESTON_CONF_OPT += --disable-fbdev-compositor
endif

ifeq ($(BR2_PACKAGE_WESTON_DRM),y)
WESTON_CONF_OPT += --enable-drm-compositor \
	--enable-libdrm-tegra \
	--enable-egl \
	--enable-simple-egl-clients
else
WESTON_CONF_OPT += --disable-drm-compositor \
	--disable-egl \
	--disable-simple-egl-clients
endif

ifeq ($(BR2_PACKAGE_WESTON_RPI),y)
WESTON_DEPENDENCIES += rpi-userland
WESTON_CONF_OPT += --enable-rpi-compositor \
	--disable-resize-optimization \
	--disable-setuid-install \
	--disable-xwayland-test \
	--disable-simple-egl-clients \
	WESTON_NATIVE_BACKEND=rpi-backend.so
else
WESTON_CONF_OPT += --disable-rpi-compositor
endif # BR2_PACKAGE_WESTON_RPI

$(eval $(autotools-package))
