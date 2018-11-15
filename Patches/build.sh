./configure --enable-system --enable-guest-base --python=python2 --enable-opengl --disable-vnc --disable-user --enable-kvm --disable-xen --audio-drv-list=alsa --target-list=xbox-softmmu --extra-cflags="-march=native" --disable-werror --enable-debug 
make -j 8
