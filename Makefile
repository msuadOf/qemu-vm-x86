QEMU_DIR=./qemu#./qemu
QEMU_BUILD_DIR=${QEMU_DIR}/build
QEMU_X86_64=${QEMU_BUILD_DIR}/qemu-system-x86_64

all build:${QEMU_X86_64}

run:build
	${QEMU_X86_64} \
	-machine q35,smm=on,accel=tcg \
  -m 4G \
  -smp 4 \
  -vga virtio \
  -global driver=cfi.pflash01,property=secure,value=on \
  -drive if=pflash,format=raw,unit=0,file=OVMF_CODE.fd,readonly=on \
  -drive if=pflash,format=raw,unit=1,file=OVMF_VARS.fd \
  -cdrom /Users/asuad/Downloads/ubuntu-24.04-desktop-amd64.iso  #\       # 添加ISO镜像作为光驱设备
	#-drive file=/path/to/harddisk.raw,if=sata,index=0,media=disk   # 添加SATA硬盘

include build_qemu.mk

dist-clean:
	- rm -rf ./qemu

#include get_uefi.mk