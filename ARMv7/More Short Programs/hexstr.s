// A test case to test your function with
MyString: .skip 12    // Reserve some space to hold the output string

.global _start
_start:
    ldr r0, =MyString     // First parameter: Where to write
    ldr r1, =0x12345678   // Second parameter: The number to process
    bl hexstr
    b _start        // End of testing code

// Convert number to string
hexstr:
    mov r2, r0
    mov r3, #8

    cmp r1, #0
    bne find_first

    mov r1, #'0'
    strb r1, [r2]
    mov r1, #0
    strb r1, [r2, #1]
    bx lr

find_first:
    lsr r0, r1, #28
    cmp r0, #0
    bne convert

    lsl r1, r1, #4
    sub r3, r3, #1
    b find_first

convert:
    lsr r0, r1, #28
    cmp r0, #10
    addlo r0, r0, #'0'
    addhs r0, r0, #87
    strb r0, [r2], #1

    lsl r1, r1, #4
    sub r3, r3, #1
    cmp r3, #0
    bne convert

    mov r0, #0
    strb r0, [r2]
    bx lr
