#################################################################################
#
# libdvbpsi
#
#################################################################################
LIBDVBPSI_VERSION = 1.1.2
LIBDVBPSI_SOURCE = libdvbpsi-$(LIBDVBPSI_VERSION).tar.bz2
LIBDVBPSI_SITE = http://download.videolan.org/pub/libdvbpsi/$(LIBDVBPSI_VERSION)
LIBDVBPSI_LICENSE = GPLv2
LIBDVBPSI_LICENSE_FILES = COPYING
LIBDVBPSI_INSTALL_STAGING = YES
LIBDVBPSI_INSTALL_TARGET = YES

$(eval $(autotools-package))
