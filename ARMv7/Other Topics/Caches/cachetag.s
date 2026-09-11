.global _start
_start:
	ldr r0, =16384
	ldr r1, =2
	ldr r2, =0
	ldr r3, =2
	bl cachetag
1:	b 1b    // Done


cachetag:
	push {r4, lr}
    clz r4, r0
    rsb r4, r4, #31
    sub r4, r4, r1
    lsr r2, r2, r4
    lsr r3, r3, r4
    cmp r2, r3
    moveq r0, #1
    movne r0, #0
    pop {r4, pc}
