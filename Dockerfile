ARG DEBIAN_DIST=bookworm
FROM debian:bookworm

ARG DEBIAN_DIST
ARG lazygit_VERSION
ARG BUILD_VERSION
ARG FULL_VERSION

RUN mkdir -p /output/usr/bin
RUN mkdir -p /output/usr/share/doc/lazygit
COPY lazygit /output/usr/bin/
RUN mkdir -p /output/DEBIAN

COPY output/DEBIAN/control /output/DEBIAN/
COPY output/copyright /output/usr/share/doc/lazygit/
COPY output/changelog.Debian /output/usr/share/doc/lazygit/
COPY output/README.md /output/usr/share/doc/lazygit/

RUN sed -i "s/DIST/$DEBIAN_DIST/" /output/usr/share/doc/lazygit/changelog.Debian
RUN sed -i "s/FULL_VERSION/$FULL_VERSION/" /output/usr/share/doc/lazygit/changelog.Debian
RUN sed -i "s/DIST/$DEBIAN_DIST/" /output/DEBIAN/control
RUN sed -i "s/lazygit_VERSION/$lazygit_VERSION/" /output/DEBIAN/control
RUN sed -i "s/BUILD_VERSION/$BUILD_VERSION/" /output/DEBIAN/control

RUN dpkg-deb --build /output /lazygit_${FULL_VERSION}.deb
