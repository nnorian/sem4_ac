; Task 1: A = (A + B) - (C + D)
; With A=10, B=5, C=3, D=2 the answer should be 10

%include "io.inc"

section .data
    A   dd 10
    B   dd  5
    C   dd  3
    D   dd  2

    msg_ab  db "A + B       = ", 0
    msg_cd  db "C + D       = ", 0
    msg_res db "Final result = ", 0

section .text
    global main

main:
    ; first, add A and B
    mov eax, [A]
    add eax, [B]            
    ; eax now holds A+B = 15
    mov ebx, eax            
    ; keep A+B in ebx while we print it

    PRINT_STRING msg_ab
    PRINT_DEC 4, ebx
    NEWLINE

    ; now add C and D
    mov ecx, [C]
    add ecx, [D]            
    ; ecx now holds C+D = 5

    PRINT_STRING msg_cd
    PRINT_DEC 4, ecx
    NEWLINE

    ; subtract (C+D) from (A+B)
    mov eax, ebx
    sub eax, ecx            
    ; eax = (A+B) - (C+D) = 10

    PRINT_STRING msg_res
    PRINT_DEC 4, eax
    NEWLINE

    xor eax, eax
    ret
