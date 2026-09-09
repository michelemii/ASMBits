// A test case to test your function with
Array: .word 1, 2, 3

.global _start
_start:
    ldr r0, =3 
    ldr r1, =Array
    bl peak
    b _start        // End of testing code

// Return the difference between max and min array elements
peak:
	ldr r2, [r1], #4    
    mov r3, r2          
    mov r12, r2         
    subs r0, r0, #1     
    beq done            

loop:
    ldr r2, [r1], #4    
    cmp r2, r3          
    movgt r3, r2        
    cmp r2, r12          
    movlt r12, r2       
    subs r0, r0, #1     
    bne loop            

done:
    sub r0, r3, r12     
    bx lr
	
