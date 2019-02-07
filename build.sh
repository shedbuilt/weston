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
make DESTDIR="$SHED_FAKE_ROOT" install
