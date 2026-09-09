.data
A: .word B, C
B: .word 0, 0
C: .word 0, 0

.text
.global _start

_start:
    ldr r0, =A
    bl size
    1: b 1b

.global size
size:
    cmp r0, #0
    beq null

    push {r4, r5, lr}
    mov r4, r0

    ldr r0, [r4]
    bl size
    mov r5, r0

    ldr r0, [r4, #4]
    bl size

    add r0, r0, r5
    add r0, r0, #1

    pop {r4, r5, lr}
    bx lr

null:
    mov r0, #0
    bx lr
