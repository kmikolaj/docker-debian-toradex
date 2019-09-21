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
    && repo init -u http://git.toradex.com/toradex-bsp-platform.git -b LinuxImageV2.8 \
    && repo sync

# Create build directories
RUN echo "\n# source open-embedded environment\ncd $HOME/oe-core && . export" >> /home/bob/.bashrc

# Mark volume
VOLUME /home/bob/oe-core

ENTRYPOINT ["/bin/bash"]

# EOF

# vim:sw=4:ts=4:et:
