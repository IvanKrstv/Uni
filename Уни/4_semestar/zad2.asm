.486
.model flat, stdcall
includelib \masm32\lib\kernel32.lib
ExitProcess proto:DWORD

.data
      A  db  "V0758TACAR2", 0
      len  equ  $-A
      counter  dd  0
.code
start:
    cld
    lea esi,A
    mov ebx,0
    mov ecx,len
L1:
    lodsb
    cmp al,'0'
    jl Skip
    cmp al,'9'
    jg Skip
    add ebx,1

Skip:
    loop L1

    mov counter,ebx

invoke ExitProcess, 0
end start
