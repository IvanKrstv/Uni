.text
.global start
start:
    ldr r0,=A
    ldr r1,=N
    ldr r1,[r1]
    bl CountZeros

    mov r4,#10
    mul r2,r2,r4
    ldr r3,=ZERO_BONUS
    str r2,[r3]
    swi 0x11

CountZeros:
    mov r2,#0
L1:
    ldr r3,[r0],#4
    cmp r3,#0
    bne Skip
    add r2,r2,#1

Skip:
    subs r1,r1,#1
    bne L1
    bx lr

.data
A:  .word  0, 5, 0, -3, 8, 0, 12, 0, 0, 7
N:  .word  10
ZERO_BONUS:  .word  0
.end
