FROM postgres:12


RUN if [ ! -d "/usr/local/src" ]; \
  then \
    mkdir -p /usr/local/src; \
  fi;

ENV BUILD_DEPS="make cmake git python-dev postgresql-server-dev-12 autoconf pkgconf wget libssl-dev libsasl2-dev libtool libxml2-dev libgeos-dev libgdal-dev libproj-dev"

RUN apt-get update && apt-get install -y $BUILD_DEPS && rm -rf /var/lib/apt/lists/*

RUN cd /usr/local/src && \
  git clone https://github.com/EnterpriseDB/mongo_fdw.git --recursive && cd mongo_fdw && \
  ./autogen.sh --with-master && make && make install

RUN apt-get autoremove -y $BUILD_DEPS

RUN apt-get update && apt-get install -y postgresql-12-postgis-3 && rm -rf /var/lib/apt/lists/*

RUN ldconfig

RUN rm -rf /usr/local/src/*

ENV BUILD_DEPS=