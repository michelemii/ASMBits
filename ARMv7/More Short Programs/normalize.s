// A test case to test your function with

Input: .word 0x10000, 0x20000, 0x80000, 0x4000
Output: .skip 8

.global _start
_start:
    ldr r0, =4
    ldr r1, =Input
    ldr r2, =Output
    bl normalize
    b _start        // End of testing code

// Normalize to U16
normalize:
    push {r4, r5, r6, lr}

    mov r4, r0
    mov r5, r1
    mov r6, #0

find_max:
    ldr r3, [r5], #4
    cmp r3, r6
    movhi r6, r3
    subs r4, r4, #1
    bne find_max

    mov r5, r1
    mov r4, #0

count_bits:
    cmp r6, #0
    beq calculate
    lsr r6, r6, #1
    add r4, r4, #1
    b count_bits

calculate:
    cmp r4, #16
    bgt shift_right

    rsb r4, r4, #16
    b shift_left

shift_right:
    sub r4, r4, #16

write_right:
    ldr r3, [r5], #4
    lsr r3, r3, r4
    strh r3, [r2], #2
    subs r0, r0, #1
    bne write_right
    b finish

shift_left:
    ldr r3, [r5], #4
    lsl r3, r3, r4
    strh r3, [r2], #2
    subs r0, r0, #1
    bne shift_left

finish:
    pop {r4, r5, r6, lr}
    bx lr
