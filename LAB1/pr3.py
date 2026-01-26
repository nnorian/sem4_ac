# Base p to Base q

base_p = int(input("Enter source base p (2-36): "))
base_q = int(input("Enter target base q (2-36): "))
number_str = input("Enter number in base " + str(base_p) + ": ")

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

# Convert base p to decimal
decimal_value = 0
for digit in upper_str:
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

# Convert decimal to base q
if decimal_value == 0:
    result = "0"
else:
    result = ""
    temp = decimal_value
    while temp > 0:
        remainder = temp % base_q
        if remainder == 0:
            result = "0" + result
        elif remainder == 1:
            result = "1" + result
        elif remainder == 2:
            result = "2" + result
        elif remainder == 3:
            result = "3" + result
        elif remainder == 4:
            result = "4" + result
        elif remainder == 5:
            result = "5" + result
        elif remainder == 6:
            result = "6" + result
        elif remainder == 7:
            result = "7" + result
        elif remainder == 8:
            result = "8" + result
        elif remainder == 9:
            result = "9" + result
        elif remainder == 10:
            result = "A" + result
        elif remainder == 11:
            result = "B" + result
        elif remainder == 12:
            result = "C" + result
        elif remainder == 13:
            result = "D" + result
        elif remainder == 14:
            result = "E" + result
        elif remainder == 15:
            result = "F" + result
        elif remainder == 16:
            result = "G" + result
        elif remainder == 17:
            result = "H" + result
        elif remainder == 18:
            result = "I" + result
        elif remainder == 19:
            result = "J" + result
        elif remainder == 20:
            result = "K" + result
        elif remainder == 21:
            result = "L" + result
        elif remainder == 22:
            result = "M" + result
        elif remainder == 23:
            result = "N" + result
        elif remainder == 24:
            result = "O" + result
        elif remainder == 25:
            result = "P" + result
        elif remainder == 26:
            result = "Q" + result
        elif remainder == 27:
            result = "R" + result
        elif remainder == 28:
            result = "S" + result
        elif remainder == 29:
            result = "T" + result
        elif remainder == 30:
            result = "U" + result
        elif remainder == 31:
            result = "V" + result
        elif remainder == 32:
            result = "W" + result
        elif remainder == 33:
            result = "X" + result
        elif remainder == 34:
            result = "Y" + result
        elif remainder == 35:
            result = "Z" + result
        temp = temp // base_q

print(upper_str, "(base", base_p, ") =", result, "(base", base_q, ")")