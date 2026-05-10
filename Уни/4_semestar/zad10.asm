.486
.model flat, stdcall
includelib \masm32\lib\kernel32.lib
ExitProcess proto:DWORD

.data
      A  dd  0, 5, 0, -3, 8, 0, 12, 0, 0, 7
      N  dd  10
      ZERO_BONUS  dd  0
.code
start:
    lea esi,A
    mov ecx,N
    call CountZeros

    imul eax,10
    mov ZERO_BONUS, eax
    invoke ExitProcess,0

CountZeros proc
    mov eax,0
Next:
    mov ebx,[esi]
    cmp ebx, 0
    jne Skip
    add eax,1
Skip:
    add esi,4
    loop Next
    ret
CountZeros endp
end start
