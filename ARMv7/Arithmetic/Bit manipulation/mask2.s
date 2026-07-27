.global _start
_start:
	ldr r0, =4
	ldr r1, =2
	bl mask
1:	b 1b    // Done

mask:
    // Build upper mask
    cmp r0,#32
    mvneq r2,#0
    beq upper_done

    mov r2,#1
    lsl r2,r2,r0
    sub r2,r2,#1

upper_done:
    // Build lower mask
    cmp r1,#32
    mvneq r3,#0
    beq lower_done

    mov r3,#1
    lsl r3,r3,r1
    sub r3,r3,#1

lower_done:
    mvn r3,r3
    and r0,r2,r3
    bx lr
