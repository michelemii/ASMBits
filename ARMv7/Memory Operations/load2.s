Data: .word 0x123, 0x124, 0x125
.global _start
_start:
    ldr r0, =Data
    ldr r1, =1
    bl load
    1: b 1b    // Done

// Dereference a pointer
load:
    lsl r1, r1, #2      
    ldr r0, [r0, r1]    
    bx  lr
