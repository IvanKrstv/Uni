.text
.global start
start:
    ldr r0,=A
    mov r1, #0

L1:
    ldrb r2, [r0], #1
    cmp r2, #0              
    beq End

    cmp r2,#'0'
    blt L1

    cmp r2,#'9'
    bgt L1

    add r1,r1,#1
    b L1

End:
    ldr r3,=counter
    str r1,[r3]
    swi 0x11

.data
A:  .asciz  "V0758TACAR2"
counter:  .word  0
.end
