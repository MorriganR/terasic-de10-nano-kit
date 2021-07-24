FROM ubuntu:20.04

ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y curl locales

RUN sed -i '/en_US.UTF-8/s/^# //g' /etc/locale.gen && locale-gen
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

RUN apt-get install -y --no-install-recommends ubuntu-desktop

# add Cyclone IV
#  curl -O https://download.altera.com/akdlm/software/acdsinst/20.1std.1/720/ib_installers/cyclone-20.1.1.720.qdz &&\
RUN mkdir /qinst &&\
  cd /qinst &&\
  curl -O https://download.altera.com/akdlm/software/acdsinst/20.1std.1/720/ib_installers/QuartusLiteSetup-20.1.1.720-linux.run &&\
  curl -O https://download.altera.com/akdlm/software/acdsinst/20.1std.1/720/ib_installers/cyclonev-20.1.1.720.qdz &&\
  chmod +x *.run &&\
  ./QuartusLiteSetup-20.1.1.720-linux.run --mode unattended --unattendedmodeui minimal --installdir /root/intelFPGA_lite/20.1 --accept_eula 1 &&\
  cd / &&\
  rm -rf /qinst

RUN pwd && ls -la
