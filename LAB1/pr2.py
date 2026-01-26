# Base p to Decimal

base_p = int(input("Enter the base p (2-36): "))
number_str = input("Enter the number in base " + str(base_p) + ": ")

# Convert to uppercase manually
upper_str = ""
for char in number_str:
    ascii_code = 0
    for i in range(256):
        if chr(i) == char:
            ascii_code = i
            break
    if ascii_code >= 97 and ascii_code <= 122:
        upper_str = upper_str + chr(ascii_code - 32)
    else:
        upper_str = upper_str + char

decimal_value = 0
for digit in upper_str:
    # Get digit value
    digit_value = -1
    if digit == '0':
        digit_value = 0
    elif digit == '1':
        digit_value = 1
    elif digit == '2':
        digit_value = 2
    elif digit == '3':
        digit_value = 3
    elif digit == '4':
        digit_value = 4
    elif digit == '5':
        digit_value = 5
    elif digit == '6':
        digit_value = 6
    elif digit == '7':
        digit_value = 7
    elif digit == '8':
        digit_value = 8
    elif digit == '9':
        digit_value = 9
    elif digit == 'A':
        digit_value = 10
    elif digit == 'B':
        digit_value = 11
    elif digit == 'C':
        digit_value = 12
    elif digit == 'D':
        digit_value = 13
    elif digit == 'E':
        digit_value = 14
    elif digit == 'F':
        digit_value = 15
    elif digit == 'G':
        digit_value = 16
    elif digit == 'H':
        digit_value = 17
    elif digit == 'I':
        digit_value = 18
    elif digit == 'J':
        digit_value = 19
    elif digit == 'K':
        digit_value = 20
    elif digit == 'L':
        digit_value = 21
    elif digit == 'M':
        digit_value = 22
    elif digit == 'N':
        digit_value = 23
    elif digit == 'O':
        digit_value = 24
    elif digit == 'P':
        digit_value = 25
    elif digit == 'Q':
        digit_value = 26
    elif digit == 'R':
        digit_value = 27
    elif digit == 'S':
        digit_value = 28
    elif digit == 'T':
        digit_value = 29
    elif digit == 'U':
        digit_value = 30
    elif digit == 'V':
        digit_value = 31
    elif digit == 'W':
        digit_value = 32
    elif digit == 'X':
        digit_value = 33
    elif digit == 'Y':
        digit_value = 34
    elif digit == 'Z':
        digit_value = 35
    
    if digit_value >= base_p or digit_value == -1:
        print("Error: Invalid digit for base", base_p)
        exit()
    
    decimal_value = decimal_value * base_p + digit_value

print(upper_str, "(base", base_p, ") =", decimal_value, "(decimal)")