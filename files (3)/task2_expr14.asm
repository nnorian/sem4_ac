; Task 2 - Expression 14: z = ((a*c - b*d)/f + (-a+b)*c/d) / h
; Values: a=6, b=3, c=9, d=3, f=3, h=2  =>  z = 3

%include "io.inc"

section .data
    a       dd  6
    b       dd  3
    c       dd  9
    d       dd  3
    f       dd  3
    h       dd  2
    result  dd  0
    msg_p1  db "Part 1: (a*c - b*d) / f = ", 0
    msg_p2  db "Part 2: (-a+b)*c / d    = ", 0
    msg_sum db "Sum of parts            = ", 0
    msg_z   db "Result z                = ", 0

section .text
    global main

main:
    ; --- part 1: (a*c - b*d) / f ---
    mov  eax, [a]
    imul eax, dword [c]    ; eax = a*c = 54
    mov  ebx, [b]
    imul ebx, dword [d]    ; ebx = b*d = 9
    sub  eax, ebx          ; eax = 45
    cdq
    idiv dword [f]         ; eax = 15
    mov  ecx, eax          ; save first term

    PRINT_STRING msg_p1
    PRINT_DEC 4, ecx       ; prints 15
    NEWLINE

    ; --- part 2: (-a+b)*c / d ---
    mov  eax, [b]
    sub  eax, [a]          ; eax = -3
    imul eax, dword [c]    ; eax = -27
    cdq
    idiv dword [d]         ; eax = -9

    PRINT_STRING msg_p2
    PRINT_DEC 4, eax       ; prints -9
    NEWLINE

    ; --- part 3: add terms, divide by h ---
    add  eax, ecx          ; eax = -9 + 15 = 6

    PRINT_STRING msg_sum
    PRINT_DEC 4, eax       ; prints 6
    NEWLINE

    cdq
    idiv dword [h]         ; eax = 6 / 2 = 3  => z

    mov  [result], eax

    PRINT_STRING msg_z
    PRINT_DEC 4, eax       ; prints 3
    NEWLINE

    xor  eax, eax
    ret