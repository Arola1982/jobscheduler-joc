#!/bin/bash

# Update joc_install.xml

cd ${TMP_INSTALL_DIR}/joc*

echo "Setting install path"
sed -ri "s%\[\:choose absolute installation path of JOC\:\]%${INSTALL_PATH}%" joc_install.xml

echo "Setting jetty port"
sed -ri "s%<entry key=\"jettyPort\" value=\"4446\"/>%<entry key=\"jettyPort\" value=\"${JETTY_PORT}\"/>%" joc_install.xml

echo "Setting minimum memory"
sed -ri "s%<entry key=\"jettyOptionXms\" value=\"128\"/>%<entry key=\"jettyOptionXms\" value=\"${MEM_MIN}\"/>%" joc_install.xml

echo "Setting maximum memory"
sed -ri "s%<entry key=\"jettyOptionXmx\" value=\"512\"/>%<entry key=\"jettyOptionXmx\" value=\"${MEM_MAX}\"/>%" joc_install.xml

echo "Setting thread stack size"
sed -ri "s%<entry key=\"jettyOptionXss\" value=\"4000\"/>%<entry key=\"jettyOptionXss\" value=\"${THREAD_STACK_SIZE}\"/>%" joc_install.xml

echo "Setting reporting database host"
sed -ri "s%<entry key=\"reporting.databaseHost\" value=\"\"/>%<entry key=\"reporting.databaseHost\" value=\"${DB_HOST}\"/>%" joc_install.xml

echo "Setting reporting database port"
sed -ri "s%<entry key=\"reporting.databasePort\" value=\"\"/>%<entry key=\"reporting.databasePort\" value=\"${DB_PORT}\"/>%" joc_install.xml

echo "Setting reporting database schema"
sed -ri "s%<entry key=\"reporting.databaseSchema\" value=\"\"/>%<entry key=\"reporting.databaseSchema\" value=\"${DB_SCHEMA}\"/>%" joc_install.xml

echo "Setting reporting database user"
sed -ri "s%<entry key=\"reporting.databaseUser\" value=\"\"/>%<entry key=\"reporting.databaseUser\" value=\"${DB_USER}\"/>%" joc_install.xml

echo "Setting reporting database password"
sed -ri "s%<entry key=\"reporting.databasePassword\" value=\"\"/>%<entry key=\"reporting.databasePassword\" value=\"${DB_PASSWORD}\"/>%" joc_install.xml

echo "Stop joc from starting after installation"
sed -ri "s%<entry key=\"launchJetty\" value=\"yes\"/>%<entry key=\"launchJetty\" value=\"no\"/>%" joc_install.xml
