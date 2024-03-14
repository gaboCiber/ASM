%include "io.inc"

section .data
n dw 10
L dw 20,4,1,10,5,2, 8,15,3,5

section .bss
arrmax resw 6

section .text
global main
main:
    mov ebp, esp; for correct debugging
    
    ;------------------------------------------------ 
    
    mov ax, [L]
    mov ebx, L
    mov edx, arrmax
    mov cx, 0
    
    While:
    cmp cx, [n]
    jA PRINT
    
    cmp ax, [ebx]
    JAE Incrementar
    
    mov ax, [ebx]
    
    Incrementar:
    mov [edx], ax
    add bx, 2
    add cx, 1
    add dx, 2
    jmp While
    
    ;---------------------------------------------------
    
    PRINT:
    xor eax, eax
    xor ebx, ebx
    xor cx, cx
    
    mov ebx, arrmax
    mov cx, [n]
    while2:    
    cmp cx, 0
    JE End
    
    PRINT_DEC 2, [ebx]
    PRINT_STRING ","
    add ebx, 2
    dec cx
    jmp while2
    
    End:
    xor ax, ax
    xor ebx, ebx
    xor cx, cx
    ret