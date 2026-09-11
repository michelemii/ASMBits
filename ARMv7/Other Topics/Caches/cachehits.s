.data
// This direct-mapped cache has 4 sets/blocks. Their tags are 0, 0x100, 0xc0, and 0x40
// for set 0, 1, 2, and 3, respectively.
CacheTags:
.word 0
.word 0x100
.word 0xc0
.word 0x40

AddressList:
.word 0x110	// This is hit (set 1)
.word 0x120	// This is a miss (set 2)
.word -1

.text
.global _start
_start:
	ldr sp, =0x4000000	// This problem will probably use the stack
	ldr r0, =4	// Cache has 2^4 byte blocks
	ldr r1, =2	// Cache has 2^2 sets
	ldr r2, =CacheTags
	ldr r3, =AddressList
	bl cachehits

cachehits:
    push {r4, r5, r6, r7, r8, r9, lr}
    mov r4, r0
    mov r5, r1
    mov r6, r2
    mov r7, r3
    mov r8, #0
.Loop:
    ldr r3, [r7], #4
    cmn r3, #1
    beq .Done
    mov r0, r4
    mov r1, r5
    mov r2, r6
    bl cachehit
    add r8, r8, r0
    b .Loop
.Done:
    mov r0, r8
    pop {r4, r5, r6, r7, r8, r9, pc}

cachehit:
    push {r4, r5, r6, lr}
    add r4, r0, r1
    lsr r5, r3, r0
    mov r6, #1
    lsl r6, r6, r1
    sub r6, r6, #1
    and r5, r5, r6
    ldr r5, [r2, r5, lsl #2]
    lsr r5, r5, r4
    lsr r6, r3, r4
    cmp r5, r6
    moveq r0, #1
    movne r0, #0
    pop {r4, r5, r6, pc}
