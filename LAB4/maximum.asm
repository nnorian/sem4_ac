; =============================================
; Program 2: Find the Maximum of Three Numbers
; Compares three predefined values, prints the
; largest one to the screen
; =============================================

section .data                    ; Initialised data section
    num1 dd 42                  ; First number (4 bytes)
    num2 dd 87                  ; Second number (4 bytes)
    num3 dd 65                  ; Third number (4 bytes)
    msg db "The maximum is: ", 0  ; Output label
    newline db 10               ; Newline character

section .bss                     ; Uninitialised data section
    output resb 12              ; Reserve 12 bytes for result

section .text                    ; Executable code section
    global main                  ; Declare entry point

main:                            ; Program entry point
    ; --- Load first number as initial max ---
    mov eax, [num1]            ; EAX = 42 (load from memory)

    ; --- Compare with second number ---
    cmp eax, [num2]            ; compare EAX with num2 (87)
    jge skip_num2              ; if EAX >= num2, keep EAX
    mov eax, [num2]            ; else EAX = num2 (new max)

skip_num2:                       ; EAX = max(num1, num2) = 87
    ; --- Compare with third number ---
    cmp eax, [num3]            ; compare EAX with num3 (65)
    jge skip_num3              ; if EAX >= num3, keep EAX
    mov eax, [num3]            ; else EAX = num3 (new max)

skip_num3:                       ; EAX = max of all three = 87
    ; --- Convert max to ASCII string ---
    mov edi, output            ; EDI -> output buffer
    add edi, 11                ; start from end of buffer
    mov byte [edi], 0          ; null-terminate

convert_max:                     ; Extract digits right-to-left
    dec edi                    ; move pointer left 1 byte
    xor edx, edx              ; clear EDX for division
    mov ecx, 10               ; divisor = 10
    div ecx                   ; EAX=quotient, EDX=last digit
    add dl, '0'               ; convert digit to ASCII
    mov [edi], dl             ; store in buffer
    test eax, eax             ; quotient zero?
    jnz convert_max           ; no -> continue extracting

    ; --- Print label ---
    mov eax, 4                ; sys_write
    mov ebx, 1                ; stdout
    mov ecx, msg              ; pointer to label string
    mov edx, 17               ; length of label
    int 0x80                  ; invoke kernel

    ; --- Print the number ---
    mov eax, 4                ; sys_write
    mov ebx, 1                ; stdout
    mov ecx, edi              ; pointer to first digit
    mov edx, output           ; calculate string length
    add edx, 11
    sub edx, edi              ; EDX = number of characters
    int 0x80                  ; invoke kernel

    ; --- Print newline ---
    mov eax, 4                ; sys_write
    mov ebx, 1                ; stdout
    mov ecx, newline          ; pointer to newline
    mov edx, 1                ; 1 byte
    int 0x80                  ; invoke kernel

    ; --- Exit ---
    mov eax, 1                ; syscall 1 = sys_exit
    xor ebx, ebx              ; return code 0
    int 0x80                  ; terminate program
