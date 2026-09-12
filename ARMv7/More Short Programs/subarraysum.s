// A test case to test your function with
Array: .word -1, -1, 3, -1, 3, -2

.global _start
_start:
    ldr r0, =Array
    ldr r1, =6 
    bl subarraysum
    b _start        // End of testing code

// Sum elements of array
subarraysum:
    ldr r2, [r0], #4
    mov r3, r2
    mov r12, r2

    subs r1, r1, #1
    beq done

loop:
    ldr r2, [r0], #4

    add r3, r3, r2
    cmp r2, r3
    movgt r3, r2

    cmp r3, r12
    movgt r12, r3

    subs r1, r1, #1
    bne loop

done:
    mov r0, r12
    bx lr
