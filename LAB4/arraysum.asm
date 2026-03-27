; =============================================
; Program 3: Sum of Array Elements
; Calculates the sum of numbers stored in an
; array using a loop and prints the result
; =============================================

section .data                    ; Initialised data section
    array dd 10, 20, 30, 40, 50  ; Array of 5 integers (4B each)
    array_len equ 5             ; Number of elements in array
    msg db "Sum of array: ", 0   ; Label for output
    newline db 10               ; Newline character (line feed)

section .bss                     ; Uninitialised data section
    output resb 12              ; Reserve 12 bytes for result

section .text                    ; Executable code section
    global main                  ; Declare entry point for linker

main:                            ; Program entry point
    mov esi, array             ; ESI = pointer to first element
    mov ecx, array_len         ; ECX = loop counter (5)
    xor eax, eax               ; EAX = 0 (sum accumulator)

sum_loop:                        ; Iterate through array
    add eax, [esi]             ; sum += current element
                                ; [ESI] dereferences the pointer
    add esi, 4                 ; advance pointer by 4 bytes
                                ; (each dd element is 4 bytes)
    dec ecx                    ; decrement loop counter
    jnz sum_loop               ; if counter != 0, repeat
                                ; (jnz = jump if not zero)

    ; --- EAX now contains 150 (10+20+30+40+50) ---

    ; --- Convert integer to ASCII string ---
    mov edi, output            ; EDI -> output buffer
    add edi, 11                ; position at end of buffer
    mov byte [edi], 0          ; null-terminate string

convert_sum:                     ; Extract digits right-to-left
    dec edi                    ; move pointer left 1 byte
    xor edx, edx              ; clear EDX (needed before div)
    mov ecx, 10               ; divisor = 10
    div ecx                   ; EAX=EAX/10, EDX=EAX%10
                                ; quotient in EAX for next iter
                                ; remainder = last digit
    add dl, '0'               ; convert digit to ASCII
                                ; e.g. 5 + 48 = 53 = '5'
    mov [edi], dl             ; store ASCII char in buffer
    test eax, eax             ; is quotient zero?
    jnz convert_sum           ; no -> more digits remain

    ; --- Print label ---
    mov eax, 4                ; syscall 4 = sys_write
    mov ebx, 1                ; fd 1 = stdout
    mov ecx, msg              ; pointer to label string
    mov edx, 15               ; number of bytes to write
    int 0x80                  ; trigger kernel interrupt

    ; --- Print the sum ---
    mov eax, 4                ; sys_write
    mov ebx, 1                ; stdout
    mov ecx, edi              ; pointer to first digit char
    mov edx, output           ; calculate string length:
    add edx, 11               ;   end of buffer position
    sub edx, edi              ;   minus start = length
    int 0x80                  ; print the number

    ; --- Print newline ---
    mov eax, 4                ; sys_write
    mov ebx, 1                ; stdout
    mov ecx, newline          ; pointer to newline byte
    mov edx, 1                ; 1 byte
    int 0x80                  ; print it

    ; --- Exit program cleanly ---
    mov eax, 1                ; syscall 1 = sys_exit
    xor ebx, ebx              ; exit status 0 (no error)
    int 0x80                  ; terminate the process
