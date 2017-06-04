FROM phusion/baseimage:0.9.19

RUN DEBIAN_FRONTEND=noninteractive apt-get install -y -q software-properties-common

ENV JAVA_VER 8
ENV JAVA_HOME /usr/lib/jvm/java-8-oracle

RUN echo 'deb http://ppa.launchpad.net/webupd8team/java/ubuntu xenial main' >> /etc/apt/sources.list && \
    apt-key adv --keyserver keyserver.ubuntu.com --recv-keys C2518248EEA14886 && \
    apt-get update && \
    echo oracle-java${JAVA_VER}-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections && \
    apt-get install -y --force-yes --no-install-recommends oracle-java${JAVA_VER}-installer oracle-java${JAVA_VER}-set-default sudo nfs-common && \
    apt-get clean && \
    rm -rf /var/cache/oracle-jdk${JAVA_VER}-installer \
           /usr/lib/jvm/java-${JAVA_VER}-oracle/*src.zip \
           /usr/lib/jvm/java-${JAVA_VER}-oracle/lib/missioncontrol \
           /usr/lib/jvm/java-${JAVA_VER}-oracle/lib/visualvm \
           /usr/lib/jvm/java-${JAVA_VER}-oracle/lib/*javafx* \
           /usr/lib/jvm/java-${JAVA_VER}-oracle/jre/plugin \
           /usr/lib/jvm/java-${JAVA_VER}-oracle/jre/bin/javaws \
           /usr/lib/jvm/java-${JAVA_VER}-oracle/jre/bin/unpack200 \
           /usr/lib/jvm/java-${JAVA_VER}-oracle/jre/bin/tnameserv \
           /usr/lib/jvm/java-${JAVA_VER}-oracle/jre/bin/rmiregistry \
           /usr/lib/jvm/java-${JAVA_VER}-oracle/jre/bin/servertool \
           /usr/lib/jvm/java-${JAVA_VER}-oracle/jre/bin/policytool \
           /usr/lib/jvm/java-${JAVA_VER}-oracle/jre/bin/pack200 \
           /usr/lib/jvm/java-${JAVA_VER}-oracle/jre/bin/jjs \
           /usr/lib/jvm/java-${JAVA_VER}-oracle/jre/bin/orbd \
           /usr/lib/jvm/java-${JAVA_VER}-oracle/jre/bin/rmid \
           /usr/lib/jvm/java-${JAVA_VER}-oracle/jre/lib/javaws.jar \
           /usr/lib/jvm/java-${JAVA_VER}-oracle/jre/lib/desktop \
           /usr/lib/jvm/java-${JAVA_VER}-oracle/jre/lib/plugin.jar \
           /usr/lib/jvm/java-${JAVA_VER}-oracle/jre/lib/deploy* \
           /usr/lib/jvm/java-${JAVA_VER}-oracle/jre/lib/*javafx* \
           /usr/lib/jvm/java-${JAVA_VER}-oracle/jre/lib/*jfx* \
           /usr/lib/jvm/java-${JAVA_VER}-oracle/jre/lib/amd64/libdecora_sse.so \
           /usr/lib/jvm/java-${JAVA_VER}-oracle/jre/lib/amd64/libprism_*.so \
           /usr/lib/jvm/java-${JAVA_VER}-oracle/jre/lib/amd64/libfxplugins.so \
           /usr/lib/jvm/java-${JAVA_VER}-oracle/jre/lib/amd64/libglass.so \
           /usr/lib/jvm/java-${JAVA_VER}-oracle/jre/lib/amd64/libgstreamer-lite.so \
           /usr/lib/jvm/java-${JAVA_VER}-oracle/jre/lib/amd64/libjavafx*.so \
           /usr/lib/jvm/java-${JAVA_VER}-oracle/jre/lib/amd64/libjfx*.so \
           /usr/lib/jvm/java-${JAVA_VER}-oracle/jre/lib/oblique-fonts \
           /usr/lib/jvm/java-${JAVA_VER}-oracle/jre/lib/ext/jfxrt.jar \
           /usr/lib/jvm/java-${JAVA_VER}-oracle/jre/lib/ext/nashorn.jar \
           /var/lib/apt/lists/*

RUN update-java-alternatives -s java-8-oracle

RUN echo "export JAVA_HOME=/usr/lib/jvm/java-8-oracle" >> /etc/profile
