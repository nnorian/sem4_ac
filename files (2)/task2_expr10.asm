; Task 2 - Expression 10: z = (-a^2 + b^2) / (a^2 - b^2 - 5)
; Values: a=5, b=3  =>  z = -1
; nasm -f elf64 task2_expr10.asm -o task2_expr10.o && ld task2_expr10.o -o task2_expr10

section .data
    a      dd  5
    b      dd  3
    result dd  0

section .text
    global _start

_start:
    ; --- a^2 ---
    mov  eax, [a]
    imul eax, eax          ; eax = 25
    mov  esi, eax          ; save a^2

    ; --- b^2 ---
    mov  ebx, [b]
    imul ebx, ebx          ; ebx = 9

    ; --- numerator: -a^2 + b^2 ---
    mov  ecx, ebx
    sub  ecx, esi          ; ecx = 9-25 = -16

    ; --- denominator: a^2 - b^2 - 5 ---
    mov  edx, esi
    sub  edx, ebx          ; edx = 16
    sub  edx, 5            ; edx = 11

    ; --- z = numerator / denominator ---
    mov  eax, ecx
    cdq
    idiv edx               ; eax = -16/11 = -1  => z

    mov  [result], eax

    mov  edi, eax
    mov  eax, 60
    syscall
