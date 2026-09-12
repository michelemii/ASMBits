.global _start
_start:
    mov r0, #4
    bl numfib
    1: b 1b

.global numfib
numfib:
    cmp r0, #1
    ble base

    mov r1, #1
    mov r2, #1
    mov r3, #2

loop:
    add r3, r1, r2
    add r3, r3, #1
    mov r1, r2
    mov r2, r3

    subs r0, r0, #1
    cmp r0, #1
    bgt loop

    mov r0, r3
    bx lr

base:
    mov r0, #1
    bx lr
