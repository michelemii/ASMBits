// A test case to test your function with
.global _start
_start:
    ldr r0, =0x1000
    bl bits
    b _start        // End of testing code

// Return minimum number of bits to represent first parameter
bits:
    mov r1, #0

loop:
    cmp r0, #0
    beq done
    lsr r0, r0, #1
    add r1, r1, #1
    b loop

done:
    mov r0, r1
    bx  lr
	
