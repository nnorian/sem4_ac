; Task 5: Add two 8-bit packed BCD numbers
; DAA only works in 32-bit mode!
; nasm -f elf32 task5_bcd_add.asm -o task5_bcd_add.o && ld -m elf_i386 task5_bcd_add.o -o task5_bcd_add
;
; Example: 0x47 + 0x38 = 0x85  (47 + 38 = 85),  carry = 0

bits 32

section .data
    bcd1  db 0x47          ; first BCD number  (47)
    bcd2  db 0x38          ; second BCD number (38)

section .bss
    result    resb 1       ; BCD result byte
    carry_out resb 1       ; carry byte (0x00 or 0x01)

section .text
    global _start

_start:
    mov  al, [bcd1]        ; al = \documentclass{article}
\usepackage{graphicx} % Required for inserting images
￼
\title{ac}
\author{Ecaterina Kushnirenko}
\date{April 2026}
￼
\begin{document}
￼
\maketitle
￼
\section{Introduction}
￼
\end{document}
0x47
    add  al, [bcd2]        ; al = 0x7F  (raw binary, not valid BCD yet)
    daa                    ; fix al to valid BCD: 0x7F -> 0x85
                           ; DAA adds 6 to any nibble that exceeds 9

    mov  [result], al      ; store result

    jnc  no_carry
    mov  byte [carry_out], 0x01   ; result > 99, carry to next digit
    jmp  done

no_carry:
    mov  byte [carry_out], 0x00

done:
    mov  eax, 1            ; sys_exit
    xor  ebx, ebx
    int  0x80
