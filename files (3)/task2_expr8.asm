; Task 2 - Expression 8: z = (-a+b+c+1)^3 / (a - b*c + d)^2
; Values: a=2, b=3, c=1, d=2  =>  z = 27
; Works in SASM (64-bit mode, entry point: main)

section .data
    a      dd  2
    b      dd  3
    c      dd  1
    d      dd  2
    result dd  0

section .text
    global main

main:
    ; --- numerator base: -a+b+c+1 ---
    mov  eax, [b]
    sub  eax, [a]          ; eax = 1
    add  eax, [c]          ; eax = 2
    add  eax, 1            ; eax = 3

    ; --- base^3 ---
    mov  ebx, eax          ; save base
    imul eax, ebx          ; eax = 9
    imul eax, ebx          ; eax = 27  (numerator)
    mov  ecx, eax

    ; --- denominator base: a - b*c + d ---
    mov  eax, [b]
    imul eax, dword [c]    ; eax = 3
    mov  edx, [a]
    sub  edx, eax          ; edx = -1
    add  edx, [d]          ; edx = 1

    ; --- base^2 ---
    imul edx, edx          ; edx = 1

    ; --- z = numerator / denominator ---
    mov  edi, edx          ; save denominator BEFORE cdq overwrites edx
    mov  eax, ecx          ; eax = 27 (numerator)
    cdq                    ; edx:eax = sign_extend(27), edx = 0
    idiv edi               ; eax = 27/1 = 27  => z

    mov  [result], eax

    xor  eax, eax
    ret
