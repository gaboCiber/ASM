%include "io.inc"

section .data
n_1 dd 6
array_1 dd 1, 3, 5, 7,10,11
n_2 dd 4
array_2 dd 2, 4, 6, 15

section .bss
sort resd 10
len resd 1
len_1 resd 1
len_2 resd 1

section .text
global main
main:
    mov ebp, esp; for correct debugging
    cld
    mov eax, [n_1]
    mov [len_1], eax
    
    mov ebx, [n_2]
    mov [len_2], ebx
    
    add eax, ebx
    mov [len], eax
    
    
    mov ecx, [len]
    mov eax, array_1
    mov ebx, array_2
    mov edi, sort
    
    while: 
        cmp ecx, 0
        jE PRINT
        
        cmp dword[len_1], 0
        jE insertar2
        
        cmp dword[len_2], 0
        jE insertar1
        
        
        mov edx, [ebx]          
        cmp [eax], edx
        JA insertar2
        jmp insertar1
        
        insertar1:
            mov edx, [eax]
            mov [edi], edx
            add edi, 4
            add eax, 4
            mov edx, [len_1]
            dec edx
            mov [len_1], edx
            xor edx, edx
            dec ecx    
            jmp while
        
        insertar2:
            mov edx, [ebx]
            mov [edi], edx
            add edi, 4
            add ebx, 4
            mov edx, [len_2]
            dec edx
            mov [len_2], edx
            xor edx, edx
            dec ecx
            jmp while
            
     
    PRINT:
        xor eax, eax
        xor ebx, ebx
        xor cx, cx
        
        mov ebx, sort
        mov cx, [len]
        while2:    
            cmp cx, 0
            JE End
            
            PRINT_DEC 4, [ebx]
            PRINT_STRING ","
            add ebx, 4
            dec cx
            jmp while2
    
    End:
        xor ax, ax
        xor ebx, ebx
        xor cx, cx
        ret
     
    ret