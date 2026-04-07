#!/bin/bash
lazygit_VERSION=$1
BUILD_VERSION=$2

declare -a distros=("jammy" "noble" "questing")

declare -A ARCH_TO_TARBALL=(
  ["amd64"]="linux_x86_64"
  ["arm64"]="linux_arm64"
  ["i386"]="linux_32-bit"
  ["armel"]="linux_armv6"
  ["armhf"]="linux_armv6"
)

for ARCH in "${!ARCH_TO_TARBALL[@]}"; do
  TARBALL_SUFFIX="${ARCH_TO_TARBALL[$ARCH]}"
  TARBALL="lazygit_${lazygit_VERSION}_${TARBALL_SUFFIX}.tar.gz"

  wget "https://github.com/jesseduffield/lazygit/releases/download/v${lazygit_VERSION}/${TARBALL}"
  tar -xf "${TARBALL}" lazygit
  rm -f "${TARBALL}"

  for UBUNTU_DIST in "${distros[@]}"; do
    FULL_VERSION="${lazygit_VERSION}-${BUILD_VERSION}+${UBUNTU_DIST}_${ARCH}_ubu"

    docker build . -f Dockerfile.ubu \
      -t lazygit-ubuntu-${UBUNTU_DIST}-${ARCH} \
      --build-arg UBUNTU_DIST=$UBUNTU_DIST \
      --build-arg lazygit_VERSION=$lazygit_VERSION \
      --build-arg BUILD_VERSION=$BUILD_VERSION \
      --build-arg FULL_VERSION=$FULL_VERSION \
      --build-arg ARCH=$ARCH

    id="$(docker create lazygit-ubuntu-${UBUNTU_DIST}-${ARCH})"
    docker cp $id:/lazygit_$FULL_VERSION.deb - > ./lazygit_$FULL_VERSION.deb
    tar -xf ./lazygit_$FULL_VERSION.deb
  done

  rm -f lazygit
done
