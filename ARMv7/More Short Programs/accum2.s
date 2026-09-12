// Some testing code
.data
Cmd:  .byte '+', 1,   'B', 1,   '+', 2,   '+', 3,   0
Cmd2: .byte '+', 1,   'b', 1,   '+', 2,   '+', 3,   0
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
    beq add_op

    cmp r2, #'-'
    beq sub_op

    cmp r2, #'*'
    beq mul_op

    cmp r2, #'b'
    beq branch_negative

    cmp r2, #'B'
    beq branch_nonnegative

    b loop

add_op:
    add r1, r1, r3
    b loop

sub_op:
    sub r1, r1, r3
    b loop

mul_op:
    mul r1, r1, r3
    b loop

branch_negative:
    cmp r1, #0
    bge loop
    b branch

branch_nonnegative:
    cmp r1, #0
    blt loop

branch:
    add r3, r3, r3
    add r0, r0, r3
    b loop

done:
    mov r0, r1
    bx lr
