FROM java:7

MAINTAINER Lumir Mrkva <lumir.mrkva@topmonks.com>

ENV H2_SRC http://www.h2database.com/h2-2016-01-21.zip
ENV DATA_DIR /opt/h2-data

RUN curl ${H2_SRC} -o h2.zip \
    && unzip h2.zip -d /opt/ \
    && rm h2.zip \
    && mkdir -p ${DATA_DIR}

EXPOSE 81 1521

CMD java -cp /opt/h2/bin/h2*.jar org.h2.tools.Server \
 	-web -webAllowOthers -webPort 81 \
 	-tcp -tcpAllowOthers -tcpPort 1521 \
 	-baseDir ${DATA_DIR}
