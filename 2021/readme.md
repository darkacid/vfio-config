https://wiki.archlinux.org/title/PCI_passthrough_via_OVMF

$ looking-glass-client  -a -p 5999

0. Ryzen 3900x, GTX 1650 (VM), GTS 450 (Host)
1. Created /etc/modprobe.d/vfio.conf
2. Edited /etc/mkinitcpio.conf (adding MODULES=....)
3. Shared memory buffer stuff
4. Make sure spice port is properly selected on lookinglass start
5. Looking Glass version B4
6. No special kernel patches. (stock 5.10.61-1-MANJARO)
7. Dummy plug for GTX 1650
