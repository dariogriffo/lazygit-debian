lazygit_VERSION=$1
BUILD_VERSION=$2
declare -a arr=("bookworm" "trixie" "forky" "sid")
for i in "${arr[@]}"
do
  DEBIAN_DIST=$i
  FULL_VERSION=$lazygit_VERSION-${BUILD_VERSION}+${DEBIAN_DIST}_amd64
docker build . -t lazygit-$DEBIAN_DIST  --build-arg DEBIAN_DIST=$DEBIAN_DIST --build-arg lazygit_VERSION=$lazygit_VERSION --build-arg BUILD_VERSION=$BUILD_VERSION --build-arg FULL_VERSION=$FULL_VERSION
  id="$(docker create lazygit-$DEBIAN_DIST)"
  docker cp $id:/lazygit_$FULL_VERSION.deb - > ./lazygit_$FULL_VERSION.deb
  tar -xf ./lazygit_$FULL_VERSION.deb
done


