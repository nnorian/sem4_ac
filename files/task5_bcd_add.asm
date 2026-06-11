; Task 5: Add two packed BCD numbers using the DAA instruction
%include "io.inc"

section .data
    bcd1        db 0x47         
    ; first operand  - represents decimal 47
    bcd2        db 0x38         
    ; second operand - represents decimal 38

    msg_op1     db "BCD operand 1 : 0x47  (decimal 47)", 0
    msg_op2     db "BCD operand 2 : 0x38  (decimal 38)", 0
    msg_raw     db "Raw sum before BCD fix : ", 0
    msg_result  db "BCD result after DAA   : ", 0
    msg_carry   db "Carry out              : ", 0

section .bss
    result    resb 1     
    ; stores the corrected BCD byte
    carry_out resb 1     
    ; 0 if no carry, 1 if there was one

section .text
    global main

main:
    ; print what we're working with
    PRINT_STRING msg_op1
    NEWLINE
    PRINT_STRING msg_op2
    NEWLINE

    ; do the raw binary addition first, just to show the uncorrected value
    mov  al, [bcd1]
    add  al, [bcd2]         
    ; al = 0x47 + 0x38 = 0x7F  (not valid BCD yet)

    PRINT_STRING msg_raw
    movzx eax, al
    PRINT_HEX 1, eax        
    ; should print 7F
    NEWLINE

    ; redo the addition and then apply DAA to correct it to proper BCD
    mov  al, [bcd1]
    add  al, [bcd2]         
    ; al = 0x7F again
    daa                     
    ; DAA adjusts the result: 0x7F becomes 0x85

    mov  [result], al

    ; check if the addition produced a carry (result > 99 in BCD)
    jnc  no_carry
    mov  byte [carry_out], 0x01
    jmp  print_result

no_carry:
    mov  byte [carry_out], 0x00

print_result:
    PRINT_STRING msg_result
    movzx eax, byte [result]
    PRINT_HEX 1, eax        
    ; should print 85
    NEWLINE

    PRINT_STRING msg_carry
    movzx eax, byte [carry_out]
    PRINT_DEC 1, eax        
    ; 0 or 1
    NEWLINE

    xor  eax, eax
    ret
