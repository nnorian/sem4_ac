; Task 2 - Expression 8: z = (-a+b+c+1)^3 / (a - b*c + d)^2
; Values: a=2, b=3, c=1, d=2  =>  z = 27
; nasm -f elf64 task2_expr8.asm -o task2_expr8.o && ld task2_expr8.o -o task2_expr8

section .data
    a      dd  2
    b      dd  3
    c      dd  1
    d      dd  2
    result dd  0

section .text
    global _start

_start:
    ; --- numerator base: -a+b+c+1 ---
    mov  eax, [b]
    sub  eax, [a]          ; eax = b-a = 1
    add  eax, [c]          ; eax = 2
    add  eax, 1            ; eax = 3

    ; --- base^3 ---
    mov  ebx, eax          ; save base
    imul eax, ebx          ; eax = 9
    imul eax, ebx          ; eax = 27  (numerator)
    mov  ecx, eax

    ; --- denominator base: a - b*c + d ---
    mov  eax, [b]
    imul eax, dword [c]    ; eax = b*c = 3
    mov  edx, [a]
    sub  edx, eax          ; edx = a - b*c = -1
    add  edx, [d]          ; edx = 1

    ; --- base^2 ---
    imul edx, edx          ; edx = 1  (denominator)

    ; --- z = numerator / denominator ---
    mov  eax, ecx
    cdq
    idiv edx               ; eax = 27/1 = 27  => z

    mov  [result], eax

    mov  edi, eax
    mov  eax, 60
    syscall
