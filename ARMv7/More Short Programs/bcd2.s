// A test case to test your function with
.global _start
_start:
    ldr r0, =10    // First parameter is always in r0
    bl bcd
    b _start        // End of testing code

// Convert a number to BCD representation
bcd:
    cmp r0, #10
    blt done

    add r0, r0, #6

done:
    bx lr
	
