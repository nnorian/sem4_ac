extern printf

section .data
    a dd 5
    b dd 3
    result dd 0
    fmt db "z = %d", 10, 0

section .text
global main

main:
    ; a^2
    mov eax, [a]
    imul eax, eax
    mov esi, eax          ; save a^2

    ; b^2
    mov ebx, [b]
    imul ebx, ebx

    ; numerator: -a^2 + b^2
    mov ecx, ebx
    sub ecx, esi

    ; denominator: a^2 - b^2 - 5
    mov edx, esi
    sub edx, ebx
    sub edx, 5

    ; division
    mov eax, ecx
    cdq
    idiv edx

    mov [result], eax

    ; ---- FIXED PRINT PART ----
    mov eax, [result]
    mov esi, eax          ; value → esi (will extend to rsi)
    lea rdi, [rel fmt]    ; format string (RIP-relative)
    xor eax, eax          ; required for printf
    call printf
    ; --------------------------

    xor eax, eax
    ret