.data
MyString: .string "Hello World"

.text
.global _start
_start:
    ldr r0, =MyString
    bl strlen
    1: b 1b

.global strlen
strlen:
	mov r1, #0          

loop:
    ldrb r2, [r0, r1]   
    cmp r2, #0          
    beq done            
    add r1, r1, #1      
    b loop              

done:
    mov r0, r1          
    bx lr
