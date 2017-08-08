FROM java:7-jre
MAINTAINER 2degrees <2degrees-floss@googlegroups.com>

ENV \
    SOLR_VERSION=3.2.0 \
    SOLR_SHA1_CHECKSUM=78caf37494603d69096709ed31455e6e433bff63 \
    SOLR_USER=solr \
    SOLR_HOME_PATH=/etc/opt/solr \
    JETTY_HOME_PATH=/etc/opt/jetty \
    SOLR_DISTRIBUTION_PATH=/opt/solr \
    SOLR_INDICES_DIR_PATH=/var/opt/solr/indices

ARG mirror_url="http://archive.apache.org/dist/lucene/solr/${SOLR_VERSION}"

ADD build.sh /tmp/
RUN /tmp/build.sh "${mirror_url}"

ADD solr /usr/local/bin/
ADD log4j.properties "${JETTY_HOME_PATH}/resources/"

USER ${SOLR_USER}
EXPOSE 8983
CMD ["solr"]
