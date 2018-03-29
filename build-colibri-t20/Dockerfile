FROM kmikolaj/build-toradex
MAINTAINER Jakub Mikołajczyk <kmikolaj@gmail.com>

# Run as user
USER bob

# Add global user config to git
RUN git config --global user.email "bob@construction.site" \
    && git config --global user.name "Bob the Builder"

# Prepare repo
RUN mkdir -p /home/bob/oe-core \
    && cd /home/bob/oe-core \
    && repo init -u http://git.toradex.com/toradex-bsp-platform.git -b LinuxImageV2.3 \
    && sed -i '/d3d14d3fcca7fcde362cf0b31411dc4eea6d20aa/a\  <project name="meta-qt5/meta-qt5.git" path="stuff/meta-qt5" remote="gith" revision="23405d3a66c308e0b2ea64308b834285850c5c9f" upstream="daisy"/>' /home/bob/oe-core/.repo/manifest.xml \
    && repo sync

# Create build directories
RUN sed -i '/meta-multimedia/a\  \${TOPDIR}\/..\/stuff\/meta-openembedded\/meta-ruby \\' /home/bob/oe-core/stuff/meta-toradex/buildconf/bblayers.conf \
    && sed -i '/meta-browser/a\  ${TOPDIR}/../stuff/meta-qt5 \\' /home/bob/oe-core/stuff/meta-toradex/buildconf/bblayers.conf \
    && echo "\n# source open-embedded environment\ncd $HOME/oe-core && . export" >> /home/bob/.bashrc

# Fix some ugly stuff
RUN cd /home/bob/oe-core \
    && wget https://www.khronos.org/registry/omxil/api/1.1.2/OpenMAX_IL_1_1_2_Header.zip -O stuff/meta-toradex/recipes/trdx-nv-binaries/files/OpenMAX_IL_1_1_2_Header.zip \
    && sed -i 's/https:\/\/www\.khronos\.org\/registry\/omxil\/api\/1\.1\.2/file:\//' stuff/meta-toradex/recipes/trdx-nv-binaries/trdx-nv-binaries.bb \
    && sed -i "s/f8ac8d7272abdbe1980eeac8d03338e8/$(md5sum stuff/meta-toradex/recipes/trdx-nv-binaries/files/OpenMAX_IL_1_1_2_Header.zip | cut -b -32)/" stuff/meta-toradex/recipes/trdx-nv-binaries/trdx-nv-binaries.bb \
    && sed -i "s/9e8aee85f37946202ff15a52836233f983e90a751c0816ba341ba0c1ffedf99e/$(sha256sum stuff/meta-toradex/recipes/trdx-nv-binaries/files/OpenMAX_IL_1_1_2_Header.zip | cut -b -64)/" stuff/meta-toradex/recipes/trdx-nv-binaries/trdx-nv-binaries.bb

# Fix 404 errors
RUN cd /home/bob/oe-core \
    && sed -i 's/http:\/\/linuxbrit\.co\.uk\/downloads/https:\/\/src\.fedoraproject\.org\/repo\/pkgs\/scrot\/scrot-\${PV}\.tar\.gz\/ccae904d225609571bdd3b03445c1e88/' stuff/meta-toradex/recipes-graphics/scrot/scrot_0.8.bb

# Mark volume
VOLUME /home/bob/oe-core

ENTRYPOINT ["/bin/bash"]

# EOF

# vim:sw=4:ts=4:et:
