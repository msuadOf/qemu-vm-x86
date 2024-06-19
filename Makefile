QEMU_DIR=./qemu#./qemu
QEMU_BUILD_DIR=${QEMU_DIR}/build
QEMU_X86_64=${QEMU_BUILD_DIR}/qemu-system-x86_64

all build:${QEMU_X86_64}

run:build
	${QEMU_X86_64} -h

include build_qemu.mk

dist-clean:
	- rm -rf ./qemu