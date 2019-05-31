FROM openjdk:11-jdk

MAINTAINER Adam Copley <adam.copley@arola.co.uk>

ENV TMP_INSTALL_DIR="/tmp/installation_files" \
  INSTALL_PATH="/opt/joc" \
  JETTY_PORT="4446" \
  MEM_MIN="128" \
  MEM_MAX="512" \
  THREAD_STACK_SIZE="4000" \
  DB_HOST="" \
  DB_PORT="3306" \
  DB_SCHEMA="" \
  DB_USER="" \
  DB_PASSWORD=""

RUN mkdir -p ${TMP_INSTALL_DIR}

COPY installation_files/* ${TMP_INSTALL_DIR}/
RUN chmod +x ${TMP_INSTALL_DIR}/*.sh


WORKDIR ${TMP_INSTALL_DIR}

RUN curl -o joc_linux.1.12.8.tar.gz \
  https://download.sos-berlin.com/JobScheduler.1.12/joc_linux.1.12.8.tar.gz && \
  tar -xvzf joc_linux.1.12.8.tar.gz && \
  rm -f joc_linux.1.12.8.tar.gz

CMD ./install.sh && /opt/joc/jetty/bin/jetty.sh start && sleep infinity
