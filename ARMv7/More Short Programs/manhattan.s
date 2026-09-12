.data
Map: .byte 1, 0, 0, 1, 0
.text

.global _start
_start:
    ldr r0, =5    // width
    ldr r1, =1    // height
    ldr r2, =Map // Pointer to 2D char array
    bl manhattan
    1: b 1b    // Done

manhattan:
    push {r4, r5, r6, r7, lr}

    mov r4, r0          // width
    mov r5, r1          // height
    mov r6, r2          // map pointer

    // Center coordinates
    lsr r2, r4, #1      // center x
    lsr r3, r5, #1      // center y

    mov r7, #-1         // minimum distance

    mov r0, #0          

row_loop:
    cmp r0, r5
    bge done

    mov r1, #0          

col_loop:
    cmp r1, r4
    bge next_row

    // offset = y * width + x
    mul r12, r0, r4
    add r12, r12, r1
    ldrb r12, [r6, r12]

    cmp r12, #0
    beq next_col

    // |x - center_x|
    lsr r2, r4, #1
    subs r12, r1, r2
    rsblt r12, r12, #0

    // |y - center_y|
    lsr r2, r5, #1
    subs r3, r0, r2
    rsblt r3, r3, #0

    add r12, r12, r3

    // Update minimum
    cmp r7, #-1
    moveq r7, r12
    cmp r12, r7
    movlt r7, r12

next_col:
    add r1, r1, #1
    b col_loop

next_row:
    add r0, r0, #1
    b row_loop

done:
    mov r0, r7
    pop {r4, r5, r6, r7, lr}
    bx lr
