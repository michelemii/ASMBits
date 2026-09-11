// A test case to test your function with
.data
Str: .string "1234"

.text
.global _start
_start:
    ldr r0, =Str    
    bl decstr
    b _start        // End of testing code

// Parse a decimal string
decstr:
    mov r1, r0
    mov r0, #0

loop:
    ldrb r2, [r1], #1
    cmp r2, #0
    beq done

    sub r2, r2, #'0'
    mov r3, #10
    mul r0, r3, r0
    add r0, r0, r2

    b loop

done:
    bx lr
