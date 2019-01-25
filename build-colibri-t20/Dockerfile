FROM kmikolaj/build-toradex:jessie
MAINTAINER Jakub Mikołajczyk <kmikolaj@gmail.com>

# Run as user
USER bob

# Add global user config to git
RUN git config --global user.email "bob@construction.site" \
    && git config --global user.name "Bob the Builder"

COPY files/01-meta-qt5.patch /home/bob/01-meta-qt5.patch
COPY files/01-openembedded-core.patch /home/bob/01-openembedded-core.patch
COPY files/01-meta-linaro.patch /home/bob/01-meta-linaro.patch

# Prepare repo
RUN mkdir -p /home/bob/oe-core \
    && cd /home/bob/oe-core \
    && repo init -u http://git.toradex.com/toradex-bsp-platform.git -b LinuxImageV2.3 \
    && sed -i '/d3d14d3fcca7fcde362cf0b31411dc4eea6d20aa/a\  <project name="meta-qt5/meta-qt5.git" path="stuff/meta-qt5" remote="gith" revision="a8d4dafdfde812e403315d53b2a981d12bd49f04" upstream="jethro-next"/>' /home/bob/oe-core/.repo/manifest.xml \
    && sed -i 's/bc63e777ad2748b8bfa7fa70ffd74700fa21a567/56ca81ca1ea8ec83a34dc8f55cc923a8eb2ccaa1/' /home/bob/oe-core/.repo/manifest.xml \ 
    && sed -i 's/4bd4da1e1433ae64720f59d48188ecd1960dac28/bad46f25ec5d0069d7274e22662b71ba9a9753c4/' /home/bob/oe-core/.repo/manifest.xml \ 
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

# Mark volume
VOLUME /home/bob/oe-core

ENTRYPOINT ["/bin/bash"]

# EOF

# vim:sw=4:ts=4:et:
