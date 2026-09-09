// A test case to test your function with
.data
Array: .byte 1, 2, 3

.text
.global _start
_start:
    ldr r0, =3 
    ldr r1, =Array
    bl max
    b _start        // End of testing code

// Return maximum element of unsigned array
max:
	ldrsb r2, [r1]
    sub r0, r0, #1

loop:
    cmp r0, #0
    beq done

    add r1, r1, #1
    ldrsb r3, [r1]

    cmp r3, r2
    ble skip
    mov r2, r3

skip:
    sub r0, r0, #1
    b loop

done:
    mov r0, r2
    bx lr
