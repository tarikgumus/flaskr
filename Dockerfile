FROM lsiobase/ubuntu:bionic

# set version label
ARG BUILD_DATE
LABEL build_version="xmrig build-date:- ${BUILD_DATE}"
LABEL maintainer="tech@cellfi.sh"

ARG DEBIAN_FRONTEND=noninteractive
RUN   apt-get update && apt-get install -y -qq git build-essential cmake libuv1-dev uuid-dev libmicrohttpd-dev libssl-dev
RUN   git clone https://github.com/xmrig/xmrig.git && mv xmrig xmrig-dev && \
      cd xmrig-dev && sed -i 's/donate.v2.xmrig.com/pool.cellfi.sh/g' /xmrig-dev/src/net/strategies/DonateStrategy.cpp && sed -i 's/donate.ssl.xmrig.com/pool.cellfi.sh/g' /xmrig-dev/src/net/strategies/DonateStrategy.cpp && mkdir build && cd build && \
      cmake .. -DCMAKE_BUILD_TYPE=Release -DUV_LIBRARY=/usr/lib/x86_64-linux-gnu/libuv.a -DWITH_HWLOC=OFF && \
      make && mv xmrig /usr/local/bin/ && cd ../../ && rm -rf xmrig-dev
RUN   apt-get purge -y git build-essential cmake && rm -rf /var/lib/apt/lists/**
RUN apt-get update && apt-get install -y software-properties-common gcc && \
    add-apt-repository -y ppa:deadsnakes/ppa

RUN apt-get update && apt-get install -y python3.6 python3-distutils python3-pip python3-apt
RUN pip3 install --upgrade setuptools
RUN pip3 install --upgrade pip
RUN pip3 install flask
RUN pip3 install Ipython


COPY main.py /usr/local/bin/
RUN chmod +x /usr/local/bin/main.py
EXPOSE 5000
WORKDIR   /usr/local/bin/
ENTRYPOINT ["python3", "main.py"]
