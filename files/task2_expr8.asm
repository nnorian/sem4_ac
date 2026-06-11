; Task 2 - Expression 8:  z = (-a+b+c+1)^3 / (a - b*c + d)^2
; With a=2, b=3, c=1, d=2 the answer should be 27

%include "io.inc"

section .data
    a   dd 2
    b   dd 3
    c   dd 1
    d   dd 2

    msg_top db "Numerator base (-a+b+c+1)    = ", 0
    msg_num db "Numerator base cubed         = ", 0
    msg_bot db "Denominator base (a-b*c+d)   = ", 0
    msg_den db "Denominator base squared     = ", 0
    msg_res db "z = numerator / denominator  = ", 0

section .text
    global main

main:
    ; numerator base: -a + b + c + 1
    mov  eax, [b]
    sub  eax, [a]       
    ; eax = b - a
    add  eax, [c]       
    ; eax = b - a + c
    add  eax, 1         
    ; eax = b - a + c + 1

    PRINT_STRING msg_top
    PRINT_DEC 4, eax
    NEWLINE

    ; base^3
    mov  ebx, eax       
    ; save the base
    imul eax, ebx       
    ; eax = base^2
    imul eax, ebx       
    ; eax = base^3
    mov  ecx, eax       
    ; ecx holds the numerator

    PRINT_STRING msg_num
    PRINT_DEC 4, ecx
    NEWLINE

    ; denominator base: a - b*c + d 
    mov  eax, [b]
    imul eax, dword [c] 
    ; eax = b*c
    mov  edx, [a]
    sub  edx, eax       
    ; edx = a - b*c
    add  edx, [d]       
    ; edx = a - b*c + d

    PRINT_STRING msg_bot
    PRINT_DEC 4, edx
    NEWLINE

    ; square it: base^2
    imul edx, edx       
    ; edx = denominator

    PRINT_STRING msg_den
    PRINT_DEC 4, edx
    NEWLINE

    ; final division: z = numerator / denominator 
    ; move denominator out of edx before cdq clobbers it
    mov  edi, edx
    mov  eax, ecx       
    ; put numerator back in eax
    cdq                 
    ; sign-extend eax into edx:eax
    idiv edi            
    ; eax = z

    PRINT_STRING msg_res
    PRINT_DEC 4, eax
    NEWLINE

    xor  eax, eax
    ret
