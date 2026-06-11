; Task 2 - Expression 10:  z = (-a^2 + b^2) / (a^2 - b^2 - 5)
; With a=5, b=3:  numerator = -25+9 = -16,  denominator = 25-9-5 = 11
; Integer division gives z = -1
%include "io.inc"

section .data
    a   dd 5
    b   dd 3

    msg_a2  db "a^2                          = ", 0
    msg_b2  db "b^2                          = ", 0
    msg_num db "Numerator  (-a^2 + b^2)      = ", 0
    msg_den db "Denominator (a^2 - b^2 - 5)  = ", 0
    msg_res db "z = numerator / denominator  = ", 0

section .text
    global main

main:
    ; compute a^2
    mov eax, [a]
    imul eax, eax       
    ; eax = a^2
    mov esi, eax        
    ; keep a^2 in esi

    PRINT_STRING msg_a2
    PRINT_DEC 4, esi
    NEWLINE

    ; compute b^2 
    mov ebx, [b]
    imul ebx, ebx       ; ebx = b^2

    PRINT_STRING msg_b2
    PRINT_DEC 4, ebx
    NEWLINE

    ; numerator: -a^2 + b^2
    mov ecx, ebx
    sub ecx, esi        
    ; ecx = b^2 - a^2  (same as -a^2 + b^2)

    PRINT_STRING msg_num
    PRINT_DEC 4, ecx
    NEWLINE

    ; denominator: a^2 - b^2 - 5 
    mov edx, esi
    sub edx, ebx        
    ; edx = a^2 - b^2
    sub edx, 5          
    ; edx = a^2 - b^2 - 5

    PRINT_STRING msg_den
    PRINT_DEC 4, edx
    NEWLINE

    ; z = numerator / denominator
    mov edi, edx        
    ; save denominator before cdq touches edx
    mov eax, ecx        
    ; numerator into eax
    cdq                 
    ; sign-extend for signed division
    idiv edi            
    ; eax = z

    PRINT_STRING msg_res
    PRINT_DEC 4, eax
    NEWLINE

    xor eax, eax
    ret
