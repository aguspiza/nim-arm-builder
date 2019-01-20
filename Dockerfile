#docker run -it -v /usr/bin/qemu-arm-static:/usr/bin/qemu-arm-static  armv7/armhf-ubuntu:xenial bash

FROM armv7/armhf-ubuntu:xenial

COPY qemu-arm-static /usr/bin/

RUN apt update -y && apt install -y git gcc

RUN git clone https://github.com/nim-lang/Nim.git nim && cd nim && git checkout devel && bash build_all.sh && ./koch install /usr/bin

