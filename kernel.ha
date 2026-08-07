// ============================================================
// NyxOS-Hare - a freestanding kernel in Hare.
// ============================================================
// Built with `hare build -t o` (a bare object - no rt start, no libc). Entered
// in 64-bit long mode from boot64.asm; writes its banner straight to VGA text
// memory and returns to the assembly stub, which halts.

export fn kmain() void = {
	let vga = 0xB8000: uintptr: *[2000]u16;

	for (let i = 0z; i < 2000; i += 1) {
		vga[i] = 0x0F20u16;                     // white space
	};

	const msg: str = "NyxOS-Hare  ::  booting from scratch in Hare";
	const bytes = *(&msg: *[]u8);                   // the string's UTF-8 bytes (no allocation)
	for (let i = 0z; i < len(bytes); i += 1) {
		vga[i] = 0x0D00u16 | (bytes[i]: u16);   // bright magenta - Nyx purple
	};
};
