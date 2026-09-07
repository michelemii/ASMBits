.data
Pointer: .word 1234
.text
.global _start
_start:
    ldr r0, =Pointer
    bl load
    1: b 1b    // Done

.global load
load:
    and r1, r0, #3       // r1 = byte offset within aligned word
    bic r0, r0, #3       // r0 = aligned address

    ldr r2, [r0]         
    ldr r3, [r0, #4]     // next aligned word

    cmp r1, #0
    beq offset0
    cmp r1, #1
    beq offset1
    cmp r1, #2
    beq offset2

offset3:
    lsr r2, r2, #24
    lsl r3, r3, #8
    orr r0, r2, r3
    bx lr

offset2:
    lsr r2, r2, #16
    lsl r3, r3, #16
    orr r0, r2, r3
    bx lr

offset1:
    lsr r2, r2, #8
    lsl r3, r3, #24
    orr r0, r2, r3
    bx lr

offset0:
    mov r0, r2
    bx lr
