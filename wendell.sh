#-nographic \
#-M q35

#VFIO!
#-x-vga=on
#-multifunction=on
#,x-vga=on,romfile=vga-GF116.rom
qemu-system-x86_64 \
	-bios /usr/share/seabios/bios.bin \
	-M q35 \
        -nodefaults \
        -nodefconfig \
        -enable-kvm \
        -name CentOS \
        -cpu host,kvm=off,check \
        -smp sockets=1,cores=2,threads=1 \
        -m 4096 \
	-nographic \
        -device ich9-usb-uhci3,id=uhci \
        -device usb-ehci,id=ehci \
        -device nec-usb-xhci,id=xhci \
        -rtc base=localtime \
	-usb -usbdevice host:1bcf:05ca \
        -netdev tap,id=t0,ifname=tap0,script=no,downscript=no -device e1000,netdev=t0,id=nic0 \
        -device vfio-pci,host=01:00.0,x-vga=on,romfile=/home/sergey/qemu/vga-GF116.rom \
        -device vfio-pci,host=01:00.1 \
        -vga none \
        -hda /dev/sdb
