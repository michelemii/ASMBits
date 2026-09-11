.global _start
_start:
	ldr r0, =12	// 12 address lines
	ldr r1, =8	// 8 data lines
	bl memsize
1:	b 1b    // Done

memsize:
	mov r2, #1
	lsl r2, r2, r0
	mul r0, r2, r1
	bx lr
