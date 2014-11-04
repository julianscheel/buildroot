################################################################################
#
# kmscube
#
################################################################################

KMSCUBE_VERSION = HEAD
KMSCUBE_SITE = git://gitorious.org/thierryreding/kmscube.git
KMSCUBE_SITE_METHOD = git
# configure not shipped
KMSCUBE_AUTORECONF = YES

define KMSCUBE_CREATE_M4_DIR
	mkdir -p $(@D)/m4
endef

KMSCUBE_POST_PATCH_HOOKS += KMSCUBE_CREATE_M4_DIR

$(eval $(autotools-package))
