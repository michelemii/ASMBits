// Some input data and testing code
.data
ProdList: 
.word 0x1000, 10
.word 0x1001, 11
.word 0x1002, 9


.text
.global _start
_start:
	ldr r0, =ProdList
	ldr r1, =3
	bl sort
	
	1: b 1b  // done

// Your function starts here:
sort:
	push    {r4, r5, r6, r7, r8, r9, lr}

    mov     r4, r0              
    mov     r5, r1              

    cmp     r5, #2
    blt     .Lret               

    sub     r8, r5, #1          
    mov     r6, #0              

.Louter:
    cmp     r6, r8
    bge     .Lret

    mov     r7, #0              
    mov     r9, r4             
.Linner:
    cmp     r7, r8
    bge     .Lnextouter

    ldr     r0, [r9]           
    ldr     r1, [r9, #4]       
    ldr     r2, [r9, #8]        
    ldr     r3, [r9, #12]       

    cmp     r1, r3              
    blt     .Lswap              
    bgt     .Lnoswap            

    cmp     r0, r2             
    bls     .Lnoswap            
                               

.Lswap:
    str     r2, [r9]
    str     r3, [r9, #4]
    str     r0, [r9, #8]
    str     r1, [r9, #12]

.Lnoswap:
    add     r9, r9, #8
    add     r7, r7, #1
    b       .Linner

.Lnextouter:
    add     r6, r6, #1
    b       .Louter

.Lret:
    pop     {r4, r5, r6, r7, r8, r9, lr}
    bx      lr
