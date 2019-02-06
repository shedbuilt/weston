#!/bin/bash
# Configure
./configure --prefix=/usr \
            --disable-xwayland \
            --disable-x11-compositor \
            --disable-weston-launch \
            --enable-demo-clients-install &&
# Build
make -j $SHED_NUM_JOBS &&
# Install
make DESTDIR="$SHED_FAKE_ROOT" install &&
# Install Default Configs
install -v -Dm755 "${SHED_PKG_CONTRIB_DIR}/wayland.sh" "${SHED_FAKE_ROOT}${SHED_PKG_DEFAULTS_INSTALL_DIR}/etc/profile.d/wayland.sh"
