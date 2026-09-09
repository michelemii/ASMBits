// https://en.wikipedia.org/wiki/Ackermann_function

.global _start
_start:
    mov r0, #1
    mov r1, #1
    bl ackermann
    1: b 1b

.global ackermann
ackermann:
    push {r4, r5, lr}

    mov r4, r0
    mov r5, r1

    cmp r4, #0
    beq m_zero

    cmp r5, #0
    beq n_zero

    sub r1, r5, #1
    mov r0, r4
    bl ackermann

    mov r5, r0
    sub r0, r4, #1
    mov r1, r5
    bl ackermann

    pop {r4, r5, lr}
    bx lr

m_zero:
    add r0, r5, #1
    pop {r4, r5, lr}
    bx lr

n_zero:
    sub r0, r4, #1
    mov r1, #1
    bl ackermann

    pop {r4, r5, lr}
    bx lr
