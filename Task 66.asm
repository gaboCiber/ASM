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
    mov [len_1], eax ; count1 = n1
    
    mov ebx, [n_2]
    mov [len_2], ebx ; counn2 = n2
    
    add eax, ebx
    mov [len], eax 
    mov ecx, [len] ; count = n1 + n2
    
    mov eax, array_1 ; d1 = L1
    mov ebx, array_2 ; d2 = L2
    mov edi, sort ; sort = new array[n1 + n2]
    
    while: 
        cmp ecx, 0 ; count > 0
        jE PRINT
        
        cmp dword[len_1], 0 ; if count1 == 0:
        jE insertar2
        
        cmp dword[len_2], 0 ; if count2 == 0:
        jE insertar1
        
        
        mov edx, [ebx] 
        cmp [eax], edx ; if [d1] < [d2]
        JA insertar2
        jmp insertar1
        
        insertar1:
            mov edx, [eax]
            mov [edi], edx ; [d1] = [sort]
            add edi, 4 ; sort++
            add eax, 4 ; d1++
            
            mov edx, [len_1]
            dec edx 
            mov [len_1], edx ; count1--
            
            xor edx, edx
            dec ecx ; count--
            jmp while
        
        insertar2:
            mov edx, [ebx] 
            mov [edi], edx ; [d2] = [sort]
            add edi, 4 ; sort++
            add ebx, 4 ; d2++
            
            mov edx, [len_2]
            dec edx
            mov [len_2], edx ; count2--
            
            xor edx, edx
            dec ecx ; count--
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