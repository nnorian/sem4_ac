; Task 2 - Expression 14:  z = ((a*c - b*d)/f  +  (-a+b)*c/d) / h
; With a=6, b=3, c=9, d=3, f=3, h=2 the answer should be 3
;
%include "io.inc"

section .data
    a   dd 6
    b   dd 3
    c   dd 9
    d   dd 3
    f   dd 3
    h   dd 2

    msg_p1  db "Part 1: (a*c - b*d) / f  = ", 0
    msg_p2  db "Part 2: (-a+b)*c / d     = ", 0
    msg_sum db "Sum of both parts        = ", 0
    msg_res db "z = sum / h              = ", 0

section .text
    global main

main:
    ; part 1: (a*c - b*d) / f 
    mov  eax, [a]
    imul eax, dword [c]     
    ; eax = a*c = 54
    mov  ebx, [b]
    imul ebx, dword [d]     
    ; ebx = b*d = 9
    sub  eax, ebx           
    ; eax = a*c - b*d = 45
    cdq
    idiv dword [f]          
    ; eax = 45 / 3 = 15
    mov  ecx, eax           
    ; save part 1 result

    PRINT_STRING msg_p1
    PRINT_DEC 4, ecx
    NEWLINE

    ; part 2: (-a+b)*c / d
    mov  eax, [b]
    sub  eax, [a]           
    ; eax = b - a = -3  (same as -a+b)
    imul eax, dword [c]     
    ; eax = -3 * 9 = -27
    cdq
    idiv dword [d]          
    ; eax = -27 / 3 = -9

    PRINT_STRING msg_p2
    PRINT_DEC 4, eax
    NEWLINE

    ; add both parts 
    add  eax, ecx           
    ; eax = -9 + 15 = 6

    PRINT_STRING msg_sum
    PRINT_DEC 4, eax
    NEWLINE

    ; final divide by h to get z
    cdq
    idiv dword [h]          
    ; eax = 6 / 2 = 3

    PRINT_STRING msg_res
    PRINT_DEC 4, eax
    NEWLINE

    xor  eax, eax
    ret
