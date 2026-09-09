// Some input data and testing code
.data
ProdList: 
.word 0x1000, 10
.word 0x1001, 11	// 11 is the maximum profit. Product_id=0x1001
.word 0x1002, 9

ProdInfo:
.word 0x1000, 0x200
.word 0x1001, 0x210	// Product_id 0x1001 has name 0x210. Return 0x210.
.word 0x1002, 0x220


.text
.global _start
_start:
	ldr r0, =ProdList
	ldr r1, =3
	ldr r2, =ProdInfo
	ldr r3, =3	
	bl find
	
	1: b 1b  // done

// Your function starts here:
find:
	 push    {r4, r5, r6, r7, r8, r9, lr}

    mov     r7, r0              
    ldr     r5, [r7]            
    ldr     r4, [r7, #4]        
    add     r7, r7, #8
    mov     r6, #1              

.Lscanloop:
    cmp     r6, r1
    bge     .Lscandone

    ldr     r8, [r7]            
    ldr     r9, [r7, #4]        
    cmp     r9, r4
    ble     .Lscannext         

    mov     r5, r8              
    mov     r4, r9

.Lscannext:
    add     r7, r7, #8
    add     r6, r6, #1
    b       .Lscanloop

.Lscandone:
    mov     r7, r2              
    mov     r6, #0

.Llookuploop:
    cmp     r6, r3
    bge     .Lnotfound

    ldr     r8, [r7]            
    cmp     r8, r5
    beq     .Lfound

    add     r7, r7, #8
    add     r6, r6, #1
    b       .Llookuploop

.Lfound:
    ldr     r0, [r7, #4]        
    b       .Ldone

.Lnotfound:
    mov     r0, #0

.Ldone:
    pop     {r4, r5, r6, r7, r8, r9, lr}
    bx      lr
