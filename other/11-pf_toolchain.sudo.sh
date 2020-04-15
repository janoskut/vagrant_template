#!/bin/bash

# Copyright 2018 MSA as unpublished work
# All Rights Reserved.
# The information contained herein is confidential property of MSA. The use,
# copying, transfer or disclosure of such information is prohibited except
# by express written agreement with MSA.

# Purpose
# This script installs all tools for the pink floys build environment.

USER="vagrant"
USER_HOME="/home/${USER}"
HOST_DIR="${USER_HOME}/host"
TOOLS_DIR="${HOST_DIR}/tools"
SDK_NAME="k64f_sdk_2-4-2"
MCUXPRESSO_DIR="${USER_HOME}/mcuxpresso"
SDK_DIR="${MCUXPRESSO_DIR}/01/SDKPackages/${SDK_NAME}"
SDK_FILE="SDK_2.4.2_FRDM-K64F-linux-all.zip"
MCUXPRESSO_INSTALL="mcuxpressoide-10.2.1_795.x86_64.deb.bin"

echo "==> Installing the toolchain..."

echo " => Adding i386 architecture and updating..."

dpkg --add-architecture i386
apt-get -y update
apt-get -y upgrade

PACKAGES="\
  cmake \
  ccache \
  valgrind \
  gcovr \
  doxygen \
  cppcheck \
  gcc-multilib \
  ninja-build \
  clang \
  clang-format \
  python-pyside \
  python-qt4
"

echo " => Installing PF build system: ${PACKAGES}"
apt-get install -y ${PACKAGES}

# Install MCUXPRESSOIDE
echo " => Installing MCUXPRESSOIDE"
MCUXPRESSOIDE="\
  libusb-1.0-0-dev \
  dfu-util \
  libwebkitgtk-1.0-0 \
"
apt-get install -y libc6:i386 libncurses5:i386 libstdc++6:i386
apt-get install -y ${MCUXPRESSOIDE}

# Install the NXP Kinetis IDE
echo " => Install the NXP Kinetis IDE"
${TOOLS_DIR}/${MCUXPRESSO_INSTALL} --target /tmp/mcuxpressoide --noprogress --noexec
dpkg -i --force-depends /tmp/mcuxpressoide/JLink_Linux_x86_64.deb
dpkg -i --force-depends /tmp/mcuxpressoide/mcuxpressoide-10.2.1_795.x86_64.deb
apt-get -fy install


# Install the NXP Kinetis SDK
echo " => Install the NXP Kinetis SDK"
mkdir -p "${SDK_DIR}"
unzip -qo "${TOOLS_DIR}/${SDK_FILE}" -d "${SDK_DIR}"
chown -R ${USER}:${USER} "${MCUXPRESSO_DIR}"

echo " => Create desktop shortcut for MCUXpresso"
DESKTOP="${USER_HOME}/Desktop"
sudo -u ${USER} mkdir -p ${DESKTOP}
sudo -u ${USER} cat > ${DESKTOP}/MCUXpresso.desktop <<EOL
[Desktop Entry]
Version=1.0
Type=Application
Name=MCUXpresso
Comment=MCUXpresso IDE
Exec=/usr/local/mcuxpressoide/ide/mcuxpressoide
Icon=/usr/local/mcuxpressoide/ide/icon.xpm
Path=
Terminal=false
StartupNotify=false
EOL
chown -R ${USER}:${USER} "${DESKTOP}/MCUXpresso.desktop"
chmod 775 "${DESKTOP}/MCUXpresso.desktop"


echo " => Done."
