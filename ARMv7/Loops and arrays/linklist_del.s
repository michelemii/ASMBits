.data
A: .word B
D: .word 0
C: .word D
B: .word C
.text
.global _start
_start:
    ldr r0, =A
    bl listdel
    1: b 1b   // done

.global listdel
listdel:
	cmp     r0, #0          
    beq     .Lfail

    ldr     r1, [r0]        
    cmp     r1, #0          
    beq     .Lfail

    ldr     r2, [r1]        
    str     r2, [r0]        

    mov     r0, r1         
    bx      lr

.Lfail:
    mov     r0, #0         
    bx      lr
