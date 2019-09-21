FROM debian:stretch-slim
MAINTAINER Jakub Mikołajczyk <kmikolaj@gmail.com>

# Install required packages
RUN dpkg --add-architecture i386 && apt-get update && apt-get -y install \
    tig \
    mc \
    vim \
    git \
    mercurial \
    subversion \
    cmake \
    wget \
    unzip \
    build-essential \
    gcc-multilib \
    g++-multilib \
    curl \
    dosfstools \
    gawk \
    texinfo \
    chrpath \
    diffstat \
    cpio \
    locales \
    lib32z1-dev \
    libcrypto++-dev \
    liblzo2-dev \
    lzop \
    libsdl1.2-dev \
    libusb-1.0-0-dev \
    uuid-dev \
    libreadline-dev \
    libncurses5-dev \
    libc6-dev \
    libc6-dev:i386 \
    libstdc++6:i386 \
    && apt-get clean && rm -rf /var/lib/apt/lists/* \
    && localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8

# Create non-root user that will perform the build of the images. Let's call him Bob ("Bob the Builder")
RUN groupadd bob && useradd -s /bin/bash -m -g bob bob

# Download repo script
RUN curl http://commondatastorage.googleapis.com/git-repo-downloads/repo > /usr/local/bin/repo
RUN chmod 755 /usr/local/bin/repo

ENV LANG en_US.utf8

CMD ["/bin/bash"]

# EOF

# vim:sw=4:ts=4:et:
