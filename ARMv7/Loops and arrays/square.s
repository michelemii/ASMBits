.data
Img: .skip 640*480*2
.text

.global _start
_start:
    ldr r0, =Img    // Image
    ldr r1, =1    // left
    ldr r2, =0    // top
    ldr r3, =3    // size
    bl square
    1: b 1b    // Done

square:
	push    {r4, r5, r6, r7, r8, lr}

    mov     r4, r3              
    mov     r5, #1280           
    mul     r6, r2, r5          
    add     r6, r0, r6          
    add     r7, r1, r1          
    add     r6, r6, r7          
    ldr     r8, =0xffff         

.Lrowloop:
    cmp     r4, #0
    beq     .Ldone

    mov     r5, r3              
    mov     r7, r6              

.Lcolloop:
    cmp     r5, #0
    beq     .Lnextrow
    strh    r8, [r7], #2
    sub     r5, r5, #1
    b       .Lcolloop

.Lnextrow:
    add     r6, r6, #1280       // advance to next row
    sub     r4, r4, #1
    b       .Lrowloop

.Ldone:
    pop     {r4, r5, r6, r7, r8, lr}
    bx      lr
