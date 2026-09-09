// Some testing code
// You may uncomment these during testing
// add_a: bx lr
// add_b: bx lr
// add_c: bx lr
// add_d: bx lr
// add_e: bx lr
// done: bx lr

.global _start
_start:
	ldr r0, =5    // First function parameter is always passed through r0.
	bl build
	1: b 1b    // Done

build:
	// Because there are nested function calls, lr needs to be saved and restored.
	push {lr}

	// Your code here
    tst r0, #1
	bne do_a
	
	tst r0, #2
	bne do_b
	
	tst r0, #4
	bne do_c
	
	tst r0, #8
	bne do_d
	
	tst r0, #16
	bne do_e
	
	// If no items were requested (or all checks failed), just finish the plate.
	b finish

do_a:
	bl add_a
	b finish
do_b:
	bl add_b
	b finish
do_c:
	bl add_c
	b finish
do_d:
	bl add_d
	b finish
do_e:
	bl add_e
	// Fall-through to finish

finish:
	bl done

	// Restore lr and return.
	pop {pc}
