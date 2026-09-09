.global _start
_start:
    mov r0, #4
    bl fib
    1: b 1b

.global fib
fib:
    cmp r0, #1
    ble base

    push {r4, lr}
    mov r4, r0

    sub r0, r4, #1
    bl fib
    push {r0}

    sub r0, r4, #2
    bl fib

    pop {r1}
    add r0, r0, r1

    pop {r4, lr}
    bx lr

base:
    mov r0, #1
    bx lr
