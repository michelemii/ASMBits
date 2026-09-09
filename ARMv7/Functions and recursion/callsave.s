.global _start
	ldr sp, =0x40000000
	mov r0, #10
	mov r1, #10
	mov r2, #20
	mov r3, #30
	bl call1234
	1: b 1b

//secret:  // For debugging, uncomment this label
             // Don't submit with this label though, or you will get a duplicate label error.
	mov r0, #10
	bx lr

.global call1234
call1234:
    push {r0, r1, r2, r3, r4, lr}

    mov r0, #1
    mov r1, #2
    mov r2, #3
    mov r3, #4
    bl secret

    mov r4, r0
    mov r0, #0

    ldr r1, [sp]
    cmp r1, r4
    addeq r0, r0, #1

    ldr r1, [sp, #4]
    cmp r1, r4
    addeq r0, r0, #1

    ldr r1, [sp, #8]
    cmp r1, r4
    addeq r0, r0, #1

    ldr r1, [sp, #12]
    cmp r1, r4
    addeq r0, r0, #1

    ldr r4, [sp, #16]
    ldr lr, [sp, #20]
    add sp, sp, #24
    bx lr
