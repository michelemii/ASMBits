.data
A: .word B
B: .word C
C: .word 0
.text
.global _start
    ldr r0, =A
    bl listlen
1:  b 1b  // done

.global listlen
listlen:
	mov     r1, #0         

.Lloop:
    cmp     r0, #0          
    beq     .Ldone          

    add     r1, r1, #1      
    ldr     r0, [r0]        
    b       .Lloop

.Ldone:
    mov     r0, r1          
    bx      lr
