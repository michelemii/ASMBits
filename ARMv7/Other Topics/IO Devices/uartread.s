.data
Out: .skip 256	// Reserve some space for output

.text
//read_uart:	// This may be useful for debugging
	ldr r0, =0xff201000
	ldr r0, [r0]
	bx lr

.global _start
_start:
	ldr sp, =0x04000000	// Initialize SP for debugging.
	ldr r0, =Out		// Use Out as the output string
	bl uartgets
1:	b 1b			// Done


uartgets:
    push {r4, r5, lr}

    mov r4, r0          // r4 = current output pointer
    mov r5, #0          // r5 = string length

poll:
    bl read_uart

    tst r0, #(1 << 15)  
    beq poll

    and r0, r0, #0xff  

    cmp r0, #0x0d       
    beq done

    strb r0, [r4], #1  
    add r5, r5, #1     
    b poll

done:
    mov r0, #0
    strb r0, [r4]      

    mov r0, r5         // Return length

    pop {r4, r5, pc}
