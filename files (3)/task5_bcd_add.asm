; Task 5: Add two 8-bit packed BCD numbers
; Uses SASM's io.inc for output (32-bit mode required for DAA)
;
; In SASM: Settings -> Assembler -> check "Use 32-bit program"
;
; Example: 0x47 + 0x38 = 0x85  (47 + 38 = 85),  carry = 0

%include "io.inc"

section .data
    bcd1        db 0x47             ; first BCD number  (decimal 47)
    bcd2        db 0x38             ; second BCD number (decimal 38)
    msg_op1     db "BCD operand 1 : 0x47  (decimal 47)", 0
    msg_op2     db "BCD operand 2 : 0x38  (decimal 38)", 0
    msg_raw     db "Raw binary sum: ", 0
    msg_result  db "BCD result    : ", 0
    msg_carry   db "Carry out     : ", 0

section .bss
    result    resb 1       ; BCD result byte
    carry_out resb 1       ; carry byte (0x00 or 0x01)

section .text
    global main

main:
    ; --- print operands ---
    PRINT_STRING msg_op1
    NEWLINE
    PRINT_STRING msg_op2
    NEWLINE

    ; --- binary addition (raw, not yet valid BCD) ---
    mov  al, [bcd1]        ; al = 0x47
    add  al, [bcd2]        ; al = 0x47 + 0x38 = 0x7F  (invalid BCD)

    ; --- print raw sum before correction ---
    PRINT_STRING msg_raw
    movzx eax, al
    PRINT_HEX 1, eax       ; prints 7F
    NEWLINE

    ; --- reload and apply DAA ---
    mov  al, [bcd1]
    add  al, [bcd2]        ; al = 0x7F again
    daa                    ; DAA corrects: 0x7F -> 0x85  (BCD 85)

    mov  [result], al      ; store corrected BCD result

    ; --- check and store carry ---
    jnc  no_carry
    mov  byte [carry_out], 0x01
    jmp  print_result

no_carry:
    mov  byte [carry_out], 0x00

print_result:
    ; --- print BCD result in hex ---
    PRINT_STRING msg_result
    movzx eax, byte [result]
    PRINT_HEX 1, eax       ; prints 85
    NEWLINE

    ; --- print carry ---
    PRINT_STRING msg_carry
    movzx eax, byte [carry_out]
    PRINT_DEC 1, eax       ; prints 0 or 1
    NEWLINE

    xor  eax, eax
    ret