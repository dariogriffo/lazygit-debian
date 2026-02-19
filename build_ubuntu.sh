lazygit_VERSION=$1
BUILD_VERSION=$2

wget https://github.com/jesseduffield/lazygit/releases/download/v${lazygit_VERSION}/lazygit_${lazygit_VERSION}_Linux_x86_64.tar.gz && tar -xf lazygit_${lazygit_VERSION}_Linux_x86_64.tar.gz && rm -f lazygit_${lazygit_VERSION}_Linux_x86_64.tar.gz && rm -fRd LICENSE README.md

declare -a arr=("jammy" "noble" "questing")
for i in "${arr[@]}"
do
  UBUNTU_DIST=$i
  FULL_VERSION=$lazygit_VERSION-${BUILD_VERSION}+${UBUNTU_DIST}_amd64_ubu
  docker build . -f Dockerfile.ubu -t lazygit-ubuntu-$UBUNTU_DIST --build-arg UBUNTU_DIST=$UBUNTU_DIST --build-arg lazygit_VERSION=$lazygit_VERSION --build-arg BUILD_VERSION=$BUILD_VERSION --build-arg FULL_VERSION=$FULL_VERSION
  id="$(docker create lazygit-ubuntu-$UBUNTU_DIST)"
  docker cp $id:/lazygit_$FULL_VERSION.deb - > ./lazygit_$FULL_VERSION.deb
  tar -xf ./lazygit_$FULL_VERSION.deb
done

rm -fRd lazygit
