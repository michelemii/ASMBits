// A test case to test your function with
.global _start
_start:
    ldr r0, =0x123    // First parameter is always in r0
    bl saturate
    b _start        // End of testing code

// Convert signed 32 bit to 8 bit, with saturation
saturate:
    cmp r0, #127
    movgt r0, #127
    bgt done

    cmp r0, #-128
    movlt r0, #128
    blt done

    and r0, r0, #0xFF

done:
    bx  lr
