git clone https://gitcode.com/tianocore/edk2.git --depth=1
cd OvmfPkg



all: |preboot_win
all: |preboot_linux
preboot_win.zip:preboot_win-clean
	curl -o preboot_win.zip https://downloadmirror.intel.com/822666/PREBOOT.zip
preboot_win:preboot_win.zip
	unzip -o preboot_win.zip -d preboot_win 


preboot_linux.tar.gz:preboot_linux-clean
	curl -o preboot_linux.tar.gz https://downloadmirror.intel.com/822666/Preboot.tar.gz
preboot_linux: preboot_linux.tar.gz
	mkdir -p preboot_linux && tar -xvf ./preboot_linux.tar.gz -C preboot_win


preboot_clean:preboot_win-clean preboot_linux-clean
preboot_dist-clean:preboot_clean
	- rm -rf preboot_win preboot_linux

preboot_win-clean:
	- rm -f preboot_win.zip ;
preboot_linux-clean:
	- rm -f preboot_linux.tar.gz ;

dist-clean:preboot_dist-clean