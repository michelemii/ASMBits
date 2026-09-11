.global _start
_start:
	ldr r0, =0
	ldr r1, =2
	bl cacheblock
1:	b 1b    // Done

cacheblock:
	lsr r0, r0, #4      
    lsr r1, r1, #4      
    
    cmp r0, r1          
    
    moveq r0, #1        
    movne r0, #0        
    
    bx lr
