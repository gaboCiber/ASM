%include "io.inc"

section .data
b db 0
c db 2
n dd 4
L db 4, 3, 5, 6


section .text
global main
main:
    ; Obtener la direccion L+b
    mov ebx, L
    add bl, [b]
    
    mov al, [ebx] ; max = [L+b]
    mov cl, [b]
    
    While: ; b <= c
    cmp cl, [c]
    JA End
    
    cmp al, [ebx] ; if(max <= [b])
    JA Incremet
    mov al, [ebx] ; max = [b]
    
    Incremet: 
    inc cl
    inc ebx ; b++
    
    jmp While
    
    End:
    PRINT_DEC 1, al
    xor al, al
    xor ebx, ebx
    xor cl, cl
    ret