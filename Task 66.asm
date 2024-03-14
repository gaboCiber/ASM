%include "io.inc"

section .data
n_1 dd 4
array_1 dd 1, 3, 5, 7
n_2 dd 4
array_2 dd 2, 4, 6, 8

section .bss
;sorted_index resd 0
sorted resd 8

section .text
global main
main:
    mov ebp, esp; for correct debugging
    
    xor eax, eax
    
    ;------------------------------------------------------------------
    
    mov eax, array_1
    mov ebx, array_2
    mov ecx, [n_1]
    add ecx, [n_2]
    mov edi, sorted
    
    while:  
    mov edx, [eax]
    cmp edx, [ebx]
    JA menor_2
  
    menor_1:
    mov edx, [eax] 
    add eax, 4
    
    ;Last item -----------
    cmp ecx, 2
    jNE incrementar
    mov [edi] , edx
    add edi, 4
    mov edx, [ebx] 
    add ebx, 4
    mov [edi], edx
    jmp pirnt
    ;----------------------
    
    menor_2:
    mov edx, [ebx] 
    add ebx, 4
    
    ;Last item -----------
    cmp ecx, 2
    jNE incrementar
    mov [edi] , edx
    add edi, 4
    mov edx, [eax] 
    add ebx, 4
    mov [edi], edx
    jmp pirnt
    ;----------------------
    
    
    incrementar:
    mov [edi] , edx
    add edi, 4
    xor edx, edx
    dec ecx
    jmp while    
    
    ;------------------------------------------------------------------
    
    pirnt:
    xor eax, eax
    xor ebx, ebx
    xor cx, cx
    
    mov ebx, sorted
    mov cx, [n_1]
    add cx, [n_2]
    while2:    
    cmp cx, 0
    JE end
    
    PRINT_DEC 4, [ebx]
    PRINT_STRING ","
    add ebx, 4
    dec cx
    jmp while2
    
    ;------------------------------------------------------------------
    
    end:
    xor ax, ax
    xor ebx, ebx
    xor cx, cx      
    
    ret