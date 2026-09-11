.global _start
_start:
    ldr r0, =2    // First function parameter is always passed through r0.
    bl random
    1: b 1b    // Done

random:
	mov r1, #0              

loop:
    cmp r0, #0
    beq done

    ldr r2, =134775813
    mul r1, r1, r2          
    add r1, r1, #1         

    sub r0, r0, #1
    b loop

done:
    mov r0, r1              
    bx lr
	
