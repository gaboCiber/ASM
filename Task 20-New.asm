%include "io.inc"

section .data
b db 5
c db 5
n dd 10
L db 4, 3, 5, 6, 8, 2, 5, 5, 6, 7

section .text
global main
main:
    mov ebp, esp; for correct debugging
    mov ebx, 0
    mov ecx, 0
    mov edx, L
    
    While:
    cmp cl, [c]
    JA End
    
    cmp cl, [b]
    JE Igual
    
    Mayor:
    cmp al, [edx]
    JA Incrementar
    mov eax, [edx]
    jmp Incrementar
    
    Igual:
    mov eax, [edx]
    
    Incrementar:
    add edx, 1
    add ecx, 1
    jmp While
    
    End:
    PRINT_DEC 1, al
    xor eax, eax
    xor ebx, ebx
    xor ecx, ecx
    ret