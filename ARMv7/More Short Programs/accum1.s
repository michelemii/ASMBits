// Some testing code
.data
Cmd: .string "+0+@-P"
.text

.global _start
_start:
	ldr r0, =Cmd
	bl calc	
	1: b 1b  // done

// Your function starts here:
calc:
    mov r1, #0

loop:
    ldrb r2, [r0], #1
    cmp r2, #0
    beq done

    ldrsb r3, [r0], #1

    cmp r2, #'+'
    addeq r1, r1, r3
    cmp r2, #'-'
    subeq r1, r1, r3
    cmp r2, #'*'
    muleq r1, r1, r3

    b loop

done:
    mov r0, r1
    bx lr
