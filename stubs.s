/* The one Hare rt symbol our bare object references: the abort called on a
   failed bounds check. Our loops stay in bounds, so it is never reached; the
   stub just halts to satisfy the linker. */
.text
.global rt.abort_fixed
rt.abort_fixed:
	cli
1:	hlt
	jmp 1b
