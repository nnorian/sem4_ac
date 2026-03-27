; =============================================
; Program 1: Temperature Converter (C to F)
; Formula: F = C * 9 / 5 + 32
; =============================================

section .data                    ; Initialised data section
    msg_input db "Enter Celsius: ", 0
                                 ; Prompt string, null-terminated
    msg_result db "Fahrenheit: ", 0
                                 ; Result label string
    newline db 10                ; Newline character (ASCII 10)

section .bss                     ; Uninitialised data section
    input resb 10               ; Reserve 10 bytes for user input
    celsius resd 1              ; Reserve 4 bytes for Celsius value
    fahrenheit resd 1           ; Reserve 4 bytes for Fahrenheit
    output resb 10              ; Reserve 10 bytes for output string

section .text                    ; Executable code section
    global main                  ; Declare entry point for linker

main:                            ; Program entry point
    ; --- Print the input prompt ---
    mov eax, 4                  ; syscall 4 = sys_write
    mov ebx, 1                  ; fd 1 = stdout (screen)
    mov ecx, msg_input          ; pointer to prompt string
    mov edx, 16                 ; number of bytes to write
    int 0x80                    ; invoke kernel

    ; --- Read user input from keyboard ---
    mov eax, 3                  ; syscall 3 = sys_read
    mov ebx, 0                  ; fd 0 = stdin (keyboard)
    mov ecx, input              ; buffer to store typed text
    mov edx, 10                 ; max bytes to read
    int 0x80                    ; invoke kernel

    ; --- Convert ASCII string to integer ---
    mov esi, input              ; ESI points to input buffer
    xor eax, eax               ; clear EAX (result accumulator)
    xor ecx, ecx               ; clear ECX (current character)

convert_loop:                    ; Process each ASCII digit
    mov cl, [esi]              ; load 1 byte from buffer
    cmp cl, 10                 ; is it newline? (Enter key)
    je done_convert            ; yes -> conversion done
    cmp cl, '0'                ; below ASCII '0'?
    jb done_convert            ; yes -> not a digit, stop
    cmp cl, '9'                ; above ASCII '9'?
    ja done_convert            ; yes -> not a digit, stop
    sub cl, '0'                ; convert ASCII to number (0-9)
    imul eax, eax, 10          ; shift result left by one decimal
    add eax, ecx              ; add new digit to result
    inc esi                    ; advance to next character
    jmp convert_loop           ; repeat for next digit

done_convert:                    ; EAX now holds integer value
    mov [celsius], eax         ; store Celsius in memory

    ; --- Apply formula: F = C * 9 / 5 + 32 ---
    imul eax, eax, 9           ; EAX = Celsius * 9
    cdq                        ; sign-extend EAX -> EDX:EAX
    mov ecx, 5                 ; divisor = 5
    idiv ecx                   ; EAX = (C*9)/5, EDX = remainder
    add eax, 32               ; EAX = (C*9)/5 + 32 = Fahrenheit
    mov [fahrenheit], eax      ; store result in memory

    ; --- Convert integer to ASCII string ---
    mov eax, [fahrenheit]      ; load result into EAX
    mov edi, output            ; EDI points to output buffer
    add edi, 9                 ; start from end (reverse fill)
    mov byte [edi], 0          ; null-terminate

int_to_str:                      ; Extract digits right-to-left
    dec edi                    ; move pointer left
    xor edx, edx              ; clear EDX before division
    mov ecx, 10               ; divisor = 10
    div ecx                   ; EAX=quotient, EDX=remainder
    add dl, '0'               ; convert digit to ASCII
    mov [edi], dl             ; store in buffer
    test eax, eax             ; quotient zero?
    jnz int_to_str            ; no -> more digits remain

    ; --- Print result label ---
    mov eax, 4                ; sys_write
    mov ebx, 1                ; stdout
    mov ecx, msg_result       ; pointer to "Fahrenheit: "
    mov edx, 13               ; length of label
    int 0x80                  ; invoke kernel

    ; --- Print the number ---
    mov eax, 4                ; sys_write
    mov ebx, 1                ; stdout
    mov ecx, edi              ; pointer to first digit
    mov edx, output           ; calculate length:
    add edx, 9                ;   end of buffer
    sub edx, edi              ;   minus start = length
    int 0x80                  ; invoke kernel

    ; --- Print newline ---
    mov eax, 4                ; sys_write
    mov ebx, 1                ; stdout
    mov ecx, newline          ; pointer to newline byte
    mov edx, 1                ; 1 byte
    int 0x80                  ; invoke kernel

    ; --- Exit program ---
    mov eax, 1                ; syscall 1 = sys_exit
    xor ebx, ebx              ; exit code 0 (success)
    int 0x80                  ; terminate process
