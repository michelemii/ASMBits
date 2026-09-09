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
    bl memcpy
    1: b 1b    // Done

.global memcpy
memcpy:
	cmp     r2, #0
    bxeq    lr
    push    {r4, lr}

.Lloop:
    cmp     r2, #0
    beq     .Ldone
    ldrb    r3, [r1], #1
    strb    r3, [r0], #1
    sub     r2, r2, #1
    b       .Lloop

.Ldone:
    pop     {r4, lr}
    bx      lr
