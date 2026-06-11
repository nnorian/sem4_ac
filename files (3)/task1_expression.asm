; Task 1: A = (A + B) - (C + D)
; Works in SASM (64-bit mode, entry point: main)

section .data
    A      dd 10
    B      dd  5
    C      dd  3
    D      dd  2
    result dd  0

section .text
    global main

main:
    mov eax, [A]       ; eax = A
    add eax, [B]       ; eax = A + B

    mov ebx, [C]       ; ebx = C
    add ebx, [D]       ; ebx = C + D

    sub eax, ebx       ; eax = (A+B) - (C+D)  = 10

    mov [result], eax  ; store result

    xor eax, eax       ; return 0
    ret
