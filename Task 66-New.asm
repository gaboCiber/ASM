%include "io.inc"

section .data
n_1 dd 4
array_1 dd 1, 3, 5, 7
n_2 dd 4
array_2 dd 2, 4, 6, 8

section .bss
n1 resd 0
n2 resd 0
sorted resd 8

section .text
global main
main:
    mov edx, 4
    mov eax, [n1]
    mul edx
    add eax, array_2
    mov [n1], eax
    
    xor eax, eax
    
    mov eax, [n1]
    mul edx
    add eax, array_1
    mov ebx, eax
    
    xor eax, eax
    
    
;    mov edi, sorted
;    mov eax, array_1
;    mov ebx, array_2
;    mov ecx, [n_1]
;    add ecx, [n_2]
;    
;    while:
;    cmp ecx, 0
;    jE end
;    
;    For_n1:
;    mov edx, array_1
;    add edx
;    cmp eax , array_1 + [n_1]
;    jE For_n2
;    
;    cmp ebx, [n_2]
;    jE indexar1
;    mov edi
;    cmp [array_1 + eax], 
;    
;    
;    For_n2:
;    cmp ebx, [n_2]
;    jE while
;    
;    indexar1:
;    
;    indexar2:
;    
;    end:
    ret