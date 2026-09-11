.global _start
_start:
	ldr r0, =8
	ldr r1, =4
	ldr r2, =0
	ldr r3, =2
	bl cacheset
1:	b 1b    // Done

cacheset:
	lsr r2, r2, r1
	lsr r3, r3, r1
	cmp r2, r3
	moveq r0, #0
	bxeq lr
	rsb r0, r0, #32
	lsl r2, r2, r0
	lsr r2, r2, r0
	lsl r3, r3, r0
	lsr r3, r3, r0
	cmp r2, r3
	moveq r0, #1
	movne r0, #0
	bx lr
