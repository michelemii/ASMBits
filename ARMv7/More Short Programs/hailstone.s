.global _start
_start:
    mov r0, #5
    bl hailstone
    1: b 1b    // Done

.global hailstone
hailstone:
	 mov r1, #0          

loop:
    cmp r0, #1
    beq done

    add r1, r1, #1      

    tst r0, #1           
    beq even

    // n is odd: n = 3n + 1
    add r0, r0, r0, lsl #1
    add r0, r0, #1
    b loop

even:
    // n is even: n = n / 2
    lsr r0, r0, #1
    b loop

done:
    mov r0, r1          
    bx lr
