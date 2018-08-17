FROM ubuntu:16.04
MAINTAINER xiang_zhi_@126.com

RUN apt-get update && apt-get install -y gcc autoconf automake g++ make git
RUN git clone https://github.com/loneknightpy/idba.git
RUN perl -pi -e 's/128/151/' /idba/src/sequence/short_sequence.h
RUN cd idba && ./build.sh
ENV PATH=${PATH}:/idba/bin/

ADD ./idba_ud.assembly.sh /idba/
