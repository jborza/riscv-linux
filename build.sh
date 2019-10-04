make ARCH=riscv CROSS_COMPILE=$CCPREFIX vmlinux
echo "copying files..."
cp vmlinux vmlinux.elf
riscv32-unknown-linux-gnu-objcopy -O binary vmlinux vmlinux.bin
cp vmlinux.bin /mnt/c/projects/emuriscv/linux/
echo "generating dump..."
riscv32-unknown-linux-gnu-objdump -dS vmlinux.elf > vmlinux.s
cp vmlinux.s /mnt/c/projects/emuriscv/linux/
riscv32-unknown-linux-gnu-objdump -t vmlinux.elf > vmlinux-symbol.s
cp vmlinux-symbol.s /mnt/c/projects/emuriscv/linux
#sshpass -f pi_pass scp vmlinux.bin pi@192.168.0.106:/data/vmlinux_store/
