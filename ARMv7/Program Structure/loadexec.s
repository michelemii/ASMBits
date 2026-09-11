// Some testing code
// When debugging in CPUlator, turn off the following debugging checks:
// - Instruction fetch: Modified opcode
// - Instruction fetch: Outside a code section (If Dest is outside the .text section)

Src: 
	add r0, r0, r0	// This function returns double its parameter.
	bx lr
Dest:
	.skip 8		// Make space for the code

.global _start
_start:
	ldr r0, =Dest
	ldr r1, =Src
	ldr r2, =8	// There are 2 instructions to copy: 8 bytes
	ldr r3, =4	// Let's call the function with parameter 4
	bl loadexec
	1: b 1b  // done

// Your function starts here:
loadexec:
    push {r4, lr}

    mov r4, r0              // save dest

copy:
    cmp r2, #0
    beq execute

    ldr r12, [r1], #4       
    str r12, [r0], #4       
    sub r2, r2, #4          
    b copy

execute:
    mov r0, r3             
    blx r4                 

    pop {r4, lr}
    bx lr
