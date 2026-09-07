// A test case to test your function with
.global _start
_start:
    ldr r0, =2       // 2 = sign extend 8->32
    ldr r1, =0xf0    // The number to extend
    bl extend
    b _start        // End of testing code

// A function to extend. Only this part will be tested.
extend:
    cmp r0, #0
    beq zero8
    cmp r0, #1
    beq zero16
    cmp r0, #2
    beq sign8
    cmp r0, #3
    beq sign16
    bx  lr

zero8:
    and r0, r1, #0xFF
    bx  lr

zero16:
    uxth r0, r1
    bx  lr

sign8:
    lsl r0, r1, #24
    asr r0, r0, #24
    bx  lr

sign16:
    lsl r0, r1, #16
    asr r0, r0, #16
    bx  lr
