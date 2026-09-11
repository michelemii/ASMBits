.global _start
_start:
    bl get_opcode
1:  b 1b  // done

// Your function starts here:
get_opcode:
    ldr r1, =MyFunc
    ldr r0, [r1]
    bx lr
