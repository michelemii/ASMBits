.data 
// Leave some space for the expanded array
Array: .word 1, 2, 3, 4, 0xff, 0xff

.text
.global _start
_start:
    ldr r0, =Array
    ldr r1, =4
    ldr r2, =2
    ldr r3, =123
    bl array_insert
    1: b 1b    // Done

array_insert:
	subs r1, r1, r2
    add r12, r0, r2, lsl #2
    beq 2f
    add r0, r12, r1, lsl #2
1:
    ldr r2, [r0, #-4]!
    str r2, [r0, #4]
    subs r1, r1, #1
    bne 1b
2:
    str r3, [r12]
    bx lr
