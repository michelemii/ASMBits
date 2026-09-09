.data
.byte 0    // Strings aren't word-aligned
MyString: .string "Hello World"

.text
.global _start
_start:
    ldr r0, =MyString
    bl strtolower
    1: b 1b

.global strtolower
strtolower:
	ldrb r1, [r0]
    cmp r1, #0
    beq done

    cmp r1, #'A'
    blt next
    cmp r1, #'Z'
    bgt next

    add r1, r1, #32
    strb r1, [r0]

next:
    add r0, r0, #1
    b strtolower

done:
    bx lr
