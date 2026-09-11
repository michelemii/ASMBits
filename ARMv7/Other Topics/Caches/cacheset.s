.global _start
_start:
	ldr r0, =0
	ldr r1, =2
	bl cacheset
1:	b 1b    // Done

cacheset:
	lsr r0, r0, #4
    and r0, r0, #0xFF
    lsr r1, r1, #4
    and r1, r1, #0xFF
    cmp r0, r1
    moveq r0, #1
    movne r0, #0
    bx lr
