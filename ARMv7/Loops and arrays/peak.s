// A test case to test your function with
Array: .word 1, 2, 3

.global _start
_start:
    ldr r0, =3 
    ldr r1, =Array
    bl peak
    b _start        // End of testing code

// Return the difference between max and min array elements
peak:
	ldr r2, [r1]          // r2 = max
    mov r3, r2            // r3 = min
    sub r0, r0, #1

loop:
    cmp r0, #0
    beq done

    add r1, r1, #4
    ldr r4, [r1]

    cmp r4, r2
    ble check_min
    mov r2, r4

check_min:
    cmp r4, r3
    bge next
    mov r3, r4

next:
    sub r0, r0, #1
    b loop

done:
    sub r0, r2, r3
    bx lr
	
