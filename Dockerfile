# Pull base image.
FROM jlesage/baseimage-gui:debian-10

# Add repo source
RUN apt-get update && \
    apt-get install -y wget gnupg2 --no-install-recommends && \
    wget -qO - https://download.opensuse.org/repositories/home:/justdan96/Debian_debbuild_10/Release.key | apt-key add - && \
    echo "deb https://download.opensuse.org/repositories/home:/justdan96/Debian_debbuild_10/  ./" | tee -a /etc/apt/sources.list > /dev/null && \
    rm -rf /var/lib/apt/lists/* && \
    apt-get purge -y --auto-remove wget gnupg2

# Install tsmuxer
# need to create license and readme files or install errors out
RUN mkdir -p /usr/share/doc/tsMuxer && \
    touch /usr/share/doc/tsMuxer/LICENSE /usr/share/doc/tsMuxer/README.md && \
    apt-get update && \
    apt-get install -y tsmuxer --no-install-recommends && \
    rm -rf /var/lib/apt/lists/*

# Copy the start script.
COPY startapp.sh /startapp.sh

# Set the name of the application.
ENV APP_NAME="tsMuxeR"
