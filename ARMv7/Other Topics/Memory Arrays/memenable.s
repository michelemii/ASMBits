.global _start
_start:
	ldr r0, =0xff3100
	bl memenable
1:	b 1b    // Done

memenable:
	ldr r1, =0xfffff000
	and r0, r0, r1
	ldr r1, =0xff3000
	cmp r0, r1
	moveq r0, #1
	movne r0, #0
	bx lr
