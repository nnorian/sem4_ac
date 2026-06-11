; Task 1: A = (A + B) - (C + D)
; nasm -f elf64 task1_expression.asm -o task1.o && ld task1.o -o task1

section .data
    A      dd 10
    B      dd  5
    C      dd  3
    D      dd  2
    result dd  0

section .text
    global _start

_start:
    mov eax, [A]       ; eax = A
    add eax, [B]       ; eax = A + B

    mov ebx, [C]       ; ebx = C
    add ebx, [D]       ; ebx = C + D

    sub eax, ebx       ; eax = (A+B) - (C+D)

    mov [result], eax  ; store result

    movzx edi, byte [result]
    mov eax, 60        ; sys_exit
    syscall
