// A test case to test your function with
.global _start
_start:
    ldr r0, =0xa    // First parameter is always in r0
    bl hex1
    b _start        // End of testing code

// Print one hex digit
hex1:
	cmp r0, #10
    addlo r0, r0, #'0'
    addhs r0, r0, #87
    bx lr
	
