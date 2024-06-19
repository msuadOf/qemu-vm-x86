${QEMU_BUILD_DIR}:
	- brew install libffi gettext glib pkg-config autoconf automake pixman ninja;
	git clone https://gitee.com/soc-esl/qemu.git --depth=1 \
		&& mkdir -p ${QEMU_BUILD_DIR}

${QEMU_BUILD_DIR}/Makefile: | ${QEMU_BUILD_DIR}
	cd ${QEMU_BUILD_DIR} \
		&& ../configure --target-list=x86_64-softmmu

${QEMU_X86_64}:${QEMU_BUILD_DIR}/Makefile
	cd ${QEMU_BUILD_DIR} \
		&& make -j8

build:${QEMU_X86_64}

rebuild:
	mkdir -p ${QEMU_BUILD_DIR}
	cd ${QEMU_BUILD_DIR} \
		&& ../configure --target-list=x86_64-softmmu \
		&& make -j8
