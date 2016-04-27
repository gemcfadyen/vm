#!/bin/bash -eux

if [[ $PACKER_BUILDER_TYPE =~ vmware ]]; then
  echo "==> Installing VMware Tools"
  mkdir -p /mnt/cdrom
  mount -o loop /home/${SSH_USERNAME}/VMWareTools.iso /mnt/cdrom

  VMWARE_TOOLS_PATH=$(ls /mnt/cdrom/VMwareTools-*.tar.gz)
  VMWARE_TOOLS_VERSION=$(echo "${VMWARE_TOOLS_PATH}" | cut -f2 -d'-')
  VMWARE_TOOLS_BUILD=$(echo "${VMWARE_TOOLS_PATH}" | cut -f3 -d'-')
  VMWARE_TOOLS_BUILD=$(basename ${VMWARE_TOOLS_BUILD} .tar.gz)
  echo "==> VMware Tools Path: ${VMWARE_TOOLS_PATH}"
  echo "==> VMWare Tools Version: ${VMWARE_TOOLS_VERSION}"
  echo "==> VMware Tools Build: ${VMWARE_TOOLS_BUILD}"

  tar xzf /mnt/cdrom/VMwareTools-*.tar.gz -C /tmp/
  VMWARE_TOOLS_MAJOR_VERSION=$(echo ${VMWARE_TOOLS_VERSION} | cut -d '.' -f 1)
  if [ "${VMWARE_TOOLS_MAJOR_VERSION}" -lt "10" ]; then
    /tmp/vmware-tools-distrib/vmware-install.pl -d
  else
    /tmp/vmware-tools-distrib/vmware-install.pl -f
  fi
  umount /mnt/cdrom
  rmdir /mnt/cdrom

  VMWARE_TOOLBOX_CMD_VERSION=$(vmware-toolbox-cmd -v)
  echo "==> Installed VMware Tools ${VMWARE_TOOLBOX_CMD_VERSION}"
fi
