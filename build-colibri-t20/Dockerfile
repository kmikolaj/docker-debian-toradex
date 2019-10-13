FROM kmikolaj/build-toradex:stretch
MAINTAINER Jakub Mikołajczyk <kmikolaj@gmail.com>

# Run as user
USER bob

# Add global user config to git
RUN git config --global user.email "bob@construction.site" \
    && git config --global user.name "Bob the Builder"

# Prepare repo
RUN mkdir -p /home/bob/oe-core \
    && cd /home/bob/oe-core \
    && repo init -u http://git.toradex.com/toradex-bsp-platform.git -b LinuxImageV2.8 \
    && sed -i '/git.toradex/i\  <remote alias="repo" fetch="https://github.com/kmikolaj" name="githk"/>' /home/bob/oe-core/.repo/manifest.xml \
    && sed -i '/openembedded-core.git/i\  <project name="meta-toradex-extras.git" path="layers/meta-toradex-extras" remote="githk" revision="c79154b89f0a3a094649514b0f412a673501d816" upstream="rocko"/>' /home/bob/oe-core/.repo/manifest.xml \
    && repo sync

# Create build directories
RUN sed -i 's/meta-toradex-demos/meta-toradex-extras/' /home/bob/oe-core/export \
    && echo "\n# source open-embedded environment\ncd $HOME/oe-core && . export" >> /home/bob/.bashrc

# Mark volume
VOLUME /home/bob/oe-core

ENTRYPOINT ["/bin/bash"]

# EOF

# vim:sw=4:ts=4:et:
