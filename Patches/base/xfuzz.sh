./afl-fuzz -t 60000 -i inputs -o outputs -QQ -- \
	./qemu_mode/xqemu/xbox-softmmu/qemu-system-xbox -cpu pentium3 -machine xbox,short_animation,bootrom=./qemu_mode/xqemu/mcpx.bin -m 64 -drive file=/home/user/Documents/XForceAFL/qemu_mode/qemu/state.qcow2,index=0,media=disk,locked=on -drive index=1,media=cdrom,file=/home/user/Documents/XForceAFL/qemu_mode/qemu/nothing.iso -bios /home/user/Documents/XForceAFL/qemu_mode/qemu/complex_4627debug.bin -usb -device usb-hub,bus=usb-bus.0,port=3 -device usb-xbox-gamepad,bus=usb-bus.0,port=3.2 \
	-aflPanicAddr 8003ef50 \
	-aflFile @@


#./afl-fuzz -i inputs -o outputs -QQ -- \
#        ./qemu_mode/qemu/i386-softmmu/qemu-system-i386 \
#        -cpu pentium3 \
#        -machine xbox,short-animation,bootrom=./qemu_mode/qemu/mcpx_1.0.bin \
#        -m 64 \
#        -bios ./qemu_mode/qemu/complex_4627debug.bin \
#        -drive index=0,media=disk,format=raw,file=./qemu_mode/qemu/img.bin,locked \
#        -drive index=1,media=cdrom,file=./qemu_mode/qemu/nothing.iso \
#        -usb -device usb-xbox-gamepad \
#        -net nic,model=nvnet -net tap,ifname=tap0,script=no \
#        -aflFile @@
#	-1342010307
