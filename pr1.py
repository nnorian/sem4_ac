
number = int(input("Enter a positive integer: "))

if number < 0:
    print("Error: Enter a positive number")
else:
    # Binary
    binary = ""
    temp = number
    if temp == 0:
        binary = "0"
    while temp > 0:
        remainder = temp % 2
        if remainder == 0:
            binary = "0" + binary
        else:
            binary = "1" + binary
        temp = temp // 2
    
    # Octal
    octal = ""
    temp = number
    if temp == 0:
        octal = "0"
    while temp > 0:
        remainder = temp % 8
        if remainder == 0:
            octal = "0" + octal
        elif remainder == 1:
            octal = "1" + octal
        elif remainder == 2:
            octal = "2" + octal
        elif remainder == 3:
            octal = "3" + octal
        elif remainder == 4:
            octal = "4" + octal
        elif remainder == 5:
            octal = "5" + octal
        elif remainder == 6:
            octal = "6" + octal
        elif remainder == 7:
            octal = "7" + octal
        temp = temp // 8
    
    # Hexadecimal
    hexadecimal = ""
    temp = number
    if temp == 0:
        hexadecimal = "0"
    while temp > 0:
        remainder = temp % 16
        if remainder == 0:
            hexadecimal = "0" + hexadecimal
        elif remainder == 1:
            hexadecimal = "1" + hexadecimal
        elif remainder == 2:
            hexadecimal = "2" + hexadecimal
        elif remainder == 3:
            hexadecimal = "3" + hexadecimal
        elif remainder == 4:
            hexadecimal = "4" + hexadecimal
        elif remainder == 5:
            hexadecimal = "5" + hexadecimal
        elif remainder == 6:
            hexadecimal = "6" + hexadecimal
        elif remainder == 7:
            hexadecimal = "7" + hexadecimal
        elif remainder == 8:
            hexadecimal = "8" + hexadecimal
        elif remainder == 9:
            hexadecimal = "9" + hexadecimal
        elif remainder == 10:
            hexadecimal = "A" + hexadecimal
        elif remainder == 11:
            hexadecimal = "B" + hexadecimal
        elif remainder == 12:
            hexadecimal = "C" + hexadecimal
        elif remainder == 13:
            hexadecimal = "D" + hexadecimal
        elif remainder == 14:
            hexadecimal = "E" + hexadecimal
        elif remainder == 15:
            hexadecimal = "F" + hexadecimal
        temp = temp // 16
    
    print("Decimal: ", number)
    print("Binary: ", binary)
    print("Octal: ", octal)
    print("Hexadecimal: ", hexadecimal)