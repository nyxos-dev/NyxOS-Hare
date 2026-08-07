# NyxOS-Hare - a freestanding 64-bit Hare kernel, booted via a GRUB ISO.
KERNEL := nyxos-hare.elf
ISO    := nyxos-hare.iso

$(ISO): $(KERNEL) grub.cfg
	mkdir -p isodir/boot/grub
	cp $(KERNEL) isodir/boot/kernel.elf
	cp grub.cfg isodir/boot/grub/grub.cfg
	grub-mkrescue -o $(ISO) isodir 2>/dev/null
	@echo "iso: $(ISO)"

$(KERNEL): boot.o kernel.o stubs.o linker64.ld
	ld -T linker64.ld -o $@ boot.o kernel.o stubs.o
	@grub-file --is-x86-multiboot $@ && echo "multiboot: OK"

boot.o: boot64.asm
	nasm -f elf64 $< -o $@

stubs.o: stubs.s
	as stubs.s -o stubs.o

kernel.o: kernel.ha
	hare build -t o -o kernel.o kernel.ha

run: $(ISO)
	qemu-system-x86_64 -cdrom $(ISO)

clean:
	rm -rf *.o $(KERNEL) $(ISO) isodir

.PHONY: run clean
