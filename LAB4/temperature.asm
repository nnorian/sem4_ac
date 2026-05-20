;Program:TemperatureConverter(Celsius→Fahrenheit);Formula:F=(C*9/5)+32

section .data
msg_input db "Enter Celsius: ",0
msg_result db "Fahrenheit: ",0
newline db 10

section .bss
input resb 10
celsius resd 1
fahrenheit resd 1
output resb 10

section .text
global main

main:

mov eax,4;sys_write to display prompt
mov ebx,1;stdout file descriptor
mov ecx,msg_input;pointer to "Enter Celsius: "
mov edx,15;length of prompt
int 0x80;call kernel

mov eax,3;sys_read to get user input
mov ebx,0;stdin file descriptor
mov ecx,input;buffer for input
mov edx,10;max bytes to read
int 0x80;call kernel

mov esi,input;ESI points to input buffer
xor eax,eax;clear EAX to store result

convert_loop:
mov cl,[esi];load current character
cmp cl,10;check for newline
je done_convert;stop if Enter pressed
cmp cl,'0';check if below '0'
jb done_convert;stop if not digit
cmp cl,'9';check if above '9'
ja done_convert;stop if not digit

sub cl,'0';convert ASCII to number
movzx ecx,cl;IMPORTANT:clear upper bits of ECX
imul eax,eax,10;multiply current result by 10
add eax,ecx;add digit to result

inc esi;move to next character
jmp convert_loop;repeat

done_convert:
mov [celsius],eax;store Celsius value

imul eax,eax,9;multiply by 9
cdq;extend for division
mov ecx,5;divisor = 5
idiv ecx;divide by 5
add eax,32;add 32
mov [fahrenheit],eax;store result

mov eax,[fahrenheit];load result
mov edi,output;point to output buffer
add edi,9;go to end of buffer
mov byte[edi],0;null terminator

int_to_str:
dec edi;move backward
xor edx,edx;clear remainder
mov ecx,10;divisor = 10
div ecx;EAX/10
add dl,'0';convert digit to ASCII
mov [edi],dl;store digit
test eax,eax;check if done
jnz int_to_str;loop if not

mov eax,4;sys_write label
mov ebx,1;stdout
mov ecx,msg_result;pointer to label
mov edx,12;length of "Fahrenheit: "
int 0x80;print

mov eax,4;sys_write number
mov ebx,1;stdout
mov ecx,edi;pointer to first digit
mov edx,output;calculate length
add edx,9;end of buffer
sub edx,edi;length = end - start
int 0x80;print number

mov eax,4;sys_write newline
mov ebx,1;stdout
mov ecx,newline;newline char
mov edx,1;length = 1
int 0x80;print newline

mov eax,1;sys_exit
xor ebx,ebx;exit code 0
int 0x80;terminate program