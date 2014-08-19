#!/bin/sh

IMAGES="${1}"

echo "Building uImage with FDT in ${IMAGES}"
sed "s/IMAGES/$(echo $IMAGES | sed -e 's/\\/\\\\/g' -e 's/\//\\\//g' -e 's/&/\\\&/g')/g" board/jetson-tk1/kernel_fdt.its.in > /tmp/kernel_fdt.its
mkimage -f /tmp/kernel_fdt.its $IMAGES/uImage
