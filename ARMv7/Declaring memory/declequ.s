// Insert declarations here

.equ LEDS, 0xff200000

.global get_led
get_led:
    ldr r0, =0xff200000
    bx lr
