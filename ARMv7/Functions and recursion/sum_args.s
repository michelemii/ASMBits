.global _start
_start:
	ldr sp, =0x40000000	// Initial sp
	mov r0, #2
	mov r1, #1
	mov r2, #2
	
	bl sum
	1: b 1b  // done

.global sum
sum:
    push {r4, lr}

    mov r4, r0
    mov r0, #0

    cmp r4, #0
    beq done

    add r0, r0, r1
    cmp r4, #1
    beq done

    add r0, r0, r2
    cmp r4, #2
    beq done

    add r0, r0, r3
    cmp r4, #3
    beq done

    sub r4, r4, #3
    add r1, sp, #8

loop:
    ldr r2, [r1], #4
    add r0, r0, r2
    subs r4, r4, #1
    bne loop

done:
    pop {r4, lr}
    bx lr
