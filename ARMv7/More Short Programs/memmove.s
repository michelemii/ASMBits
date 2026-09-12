.data
.word 0x9999
Dest: .word 0, 0, 0, 0, 0xaaaa
Src: .word 1, 2, 3, 4, 0xbbbb

.text
.global _start
_start:
    ldr r0, =Dest
    ldr r1, =Src
    ldr r2, =16
    bl memmove
    1: b 1b    // Done

.global memmove
memmove:
    cmp r2, #0
    beq done

    cmp r0, r1
    beq done

    // Destination before source: copy forward
    blo copy_forward

    // Destination after source: check for overlap
    add r3, r1, r2
    cmp r0, r3
    bhs copy_forward

    // Overlap: copy backwards
    add r0, r0, r2
    add r1, r1, r2

copy_backward:
    ldrb r3, [r1, #-1]!
    strb r3, [r0, #-1]!
    subs r2, r2, #1
    bne copy_backward
    b done

copy_forward:
    ldrb r3, [r1], #1
    strb r3, [r0], #1
    subs r2, r2, #1
    bne copy_forward

done:
    bx lr
