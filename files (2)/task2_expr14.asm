; Task 2 - Expression 14: z = ((a*c - b*d)/f + (-a+b)*c/d) / h
; Values: a=6, b=3, c=9, d=3, f=3, h=2  =>  z = 3
; nasm -f elf64 task2_expr14.asm -o task2_expr14.o && ld task2_expr14.o -o task2_expr14

section .data
    a      dd  6
    b      dd  3
    c      dd  9
    d      dd  3
    f      dd  3
    h      dd  2
    result dd  0

section .text
    global _start

_start:
    ; --- part 1: (a*c - b*d) / f ---
    mov  eax, [a]
    imul eax, dword [c]    ; eax = a*c = 54
    mov  ebx, [b]
    imul ebx, dword [d]    ; ebx = b*d = 9
    sub  eax, ebx          ; eax = 45
    cdq
    idiv dword [f]         ; eax = 45/3 = 15
    mov  ecx, eax          ; save first term

    ; --- part 2: (-a+b)*c / d ---
    mov  eax, [b]
    sub  eax, [a]          ; eax = b-a = -3
    imul eax, dword [c]    ; eax = -3*9 = -27
    cdq
    idiv dword [d]         ; eax = -27/3 = -9

    ; --- part 3: add terms, divide by h ---
    add  eax, ecx          ; eax = -9+15 = 6
    cdq
    idiv dword [h]         ; eax = 6/2 = 3  => z

    mov  [result], eax

    mov  edi, eax
    mov  eax, 60
    syscall
