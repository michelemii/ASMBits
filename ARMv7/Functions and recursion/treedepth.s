.data
A: .word B, C
B: .word 0, 0
C: .word 0, 0

.text
.global _start

_start:
    ldr r0, =A
    mov r1, #2
    bl depth
    1: b 1b

.global depth
depth:
    cmp r0, #0
    beq valid

    cmp r1, #0
    beq invalid

    push {r4, r5, lr}
    mov r4, r0
    mov r5, r1

    ldr r0, [r4]
    sub r1, r5, #1
    bl depth
    cmp r0, #0
    beq invalid_pop

    ldr r0, [r4, #4]
    sub r1, r5, #1
    bl depth

    pop {r4, r5, lr}
    bx lr

invalid_pop:
    pop {r4, r5, lr}

invalid:
    mov r0, #0
    bx lr

valid:
    mov r0, #1
    bx lr
