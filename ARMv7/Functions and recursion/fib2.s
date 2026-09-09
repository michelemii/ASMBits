.global _start
_start:
    mov r0, #4
    bl fib
    1: b 1b

.global fib
fib:
    cmp r0, #1
    bls base

    push {r4, r5, lr}

    mov r4, #1
    mov r5, #1
    mov r1, #2

loop:
    add r2, r4, r5
    cmp r2, r4
    blo overflow

    mov r4, r5
    mov r5, r2

    add r1, r1, #1
    cmp r1, r0
    bls loop

    mov r0, r5
    pop {r4, r5, lr}
    bx lr

overflow:
    mov r0, #0
    pop {r4, r5, lr}
    bx lr

base:
    mov r0, #1
    bx lr
