#!/bin/bash

# Prepare joc_install.xml
./prep-config.sh

# Install jobscheduler

cd ${TMP_INSTALL_DIR}/joc*

./setup.sh joc_install.xml
