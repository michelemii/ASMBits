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
    mov r3, #1

    ldrb r2, [r1]
    cmp r2, #'-'
    bne loop
    mov r3, #-1
    add r1, r1, #1

loop:
    ldrb r2, [r1], #1
    cmp r2, #0
    beq done

    sub r2, r2, #'0'
    mov r12, #10
    mul r0, r12, r0
    add r0, r0, r2

    b loop

done:
    cmp r3, #1
    beq return
    rsb r0, r0, #0

return:
    bx lr
