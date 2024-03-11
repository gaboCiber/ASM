%include "io.inc"

section .data
x db 7
n dd 4
L db 5, 8, 9, 6

section .text
global main
main:
    mov ebp, esp; for correct debugging
    mov al, 0 ; sum = 0
    mov bl, [x]
    mov ecx, 0 ; count = 0
    
    while:
    cmp ecx, [n] ; while count < n
    jAE End
    
    cmp bl, [L + ecx] ; if [L] > x
    jA Increment
    add al, [L + ecx] ; sum += [L]
    
    Increment:
    inc ecx
    jmp while 
    
    End:
    PRINT_DEC 1, al
    xor al, al
    xor ecx, ecx  
    ret