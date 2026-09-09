// A test case to test your function with
Array: .word 1, 2, 3

.global _start
_start:
    ldr r0, =3 
    ldr r1, =Array
    bl max
    b _start        // End of testing code

// Return maximum element of unsigned array
max:
	ldr r2, [r1]
    sub r0, r0, #1

loop:
    cmp r0, #0
    beq done

    add r1, r1, #4
    ldr r3, [r1]

    cmp r3, r2
    bls skip
    mov r2, r3

skip:
    sub r0, r0, #1
    b loop

done:
    mov r0, r2
    bx lr
