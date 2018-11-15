git clone https://github.com/nccgroup/TriforceAFL.git
cd TriforceAFL
cd qemu_mode
git clone https://github.com/espes/xqemu.git
cp ./qemu/afl-qemu-cpu-inl.h ./xqemu/afl-qemu-cpu-inl.h
cp ./qemu/afl.h ./xqemu/afl.h
cp ../../Patches/qemu-options.hx ./xqemu/qemu-options.hx
cp ../../Patches/include/exec/cpu_ldst.h ./xqemu/include/exec/cpu_ldst.h
cp ../../Patches/include/exec/cpu_ldst_template.h ./xqemu/include/exec/cpu_ldst_template.h
cp ../../Patches/include/exec/cpu_ldst_useronly_template.h ./xqemu/include/exec/cpu_ldst_useronly_template.h
cp ../../Patches/boot.sh ./xqemu/boot.sh
cp ../../Patches/build.sh ./xqemu/build.sh
patch ./xqemu/hw/audio/ac97.c ../../Patches/hw/audio/ac97.c.patch
patch ./xqemu/hw/xbox/dsp/dsp.c ../../Patches/hw/xbox/dsp/dsp.c.patch
patch ./xqemu/hw/xbox/acpi_xbox.c ../../Patches/hw/xbox/acpi_xbox.c.patch
patch ./xqemu/target-i386/helper.h ../../Patches/target-i386/helper.h.patch
patch ./xqemu/target-i386/translate.c ../../Patches/target-i386/translate.c.patch
patch ./xqemu/afl.h ../../Patches/afl.h.patch
patch ./xqemu/afl-qemu-cpu-inl.h ../../Patches/afl-qemu-cpu-inl.h.patch
patch ./xqemu/cpu-exec.c ../../Patches/cpu-exec.c.patch
patch ./xqemu/cpus.c ../../Patches/cpus.c.patch
patch ./xqemu/exec.c ../../Patches/exec.c.patch
patch ./xqemu/translate-all.c ../../Patches/translate-all.c.patch
patch ./xqemu/vl.c ../../Patches/vl.c.patch
patch ../afl-fuzz.c ../../Patches/base/afl-fuzz.c.patch
patch ../config.h ../../Patches/base/config.h.patch
patch ../Makefile ../../Patches/base/Makefile.patch
cp ../../Patches/base/xfuzz.sh ../xfuzz.sh
cd xqemu
sh ./build.sh
cd ../../
make
