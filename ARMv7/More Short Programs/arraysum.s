// A test case to test your function with
Array: .word 1, 2, 3

.global _start
_start:
    ldr r0, =Array
    ldr r1, =3 
    bl arraysum
    b _start        // End of testing code

// Sum elements of array
arraysum:
    mov r2, #0

loop:
    ldr r3, [r0], #4
    add r2, r2, r3
    subs r1, r1, #1
    bne loop

    mov r0, r2
    bx lr
	
