.data
List:
	.string "M5S3G4"
	.align 1
	.hword 416
	.string "V6T1Z4"
	.align 1
	.hword 604
	.string "K7L3N6"
	.align 1
	.hword 613
.align 2
PCode: .string "N2L3G1"

.text
.global _start
_start:
	ldr r0, =List
	mov r1, #1
	ldr r2, =PCode
	ldr r3, =519
	
	bl set_data
	1: b 1b  // done

set_data:
	push    {r4, r5, r6, r7, lr}
    mov     r4, r3             
    mov     r5, #10
    mul     r6, r1, r5          
    add     r6, r0, r6          
    mov     r7, r6             

.Lcopy:
    ldrb    r3, [r2], #1
    strb    r3, [r7], #1
    cmp     r3, #0
    bne     .Lcopy

    strh    r4, [r6, #8]

    pop     {r4, r5, r6, r7, lr}
    bx      lr
