# ASCII to Decimal and Sum

text = input("Enter a string: ")

print("")
print("Char      Decimal   Binary      Hex")


total = 0
for char in text:
    # Get ASCII value manually
    ascii_val = 0
    for i in range(256):
        if chr(i) == char:
            ascii_val = i
            break
    
    total = total + ascii_val
    
    # Convert to binary manually
    binary = ""
    temp = ascii_val
    if temp == 0:
        binary = "0"
    while temp > 0:
        remainder = temp % 2
        if remainder == 0:
            binary = "0" + binary
        else:
            binary = "1" + binary
        temp = temp // 2
    # Pad to 8 bits
    while len(binary) < 8:
        binary = "0" + binary
    
    # Convert to hex manually
    hexval = ""
    temp = ascii_val
    if temp == 0:
        hexval = "0"
    while temp > 0:
        remainder = temp % 16
        if remainder == 0:
            hexval = "0" + hexval
        elif remainder == 1:
            hexval = "1" + hexval
        elif remainder == 2:
            hexval = "2" + hexval
        elif remainder == 3:
            hexval = "3" + hexval
        elif remainder == 4:
            hexval = "4" + hexval
        elif remainder == 5:
            hexval = "5" + hexval
        elif remainder == 6:
            hexval = "6" + hexval
        elif remainder == 7:
            hexval = "7" + hexval
        elif remainder == 8:
            hexval = "8" + hexval
        elif remainder == 9:
            hexval = "9" + hexval
        elif remainder == 10:
            hexval = "A" + hexval
        elif remainder == 11:
            hexval = "B" + hexval
        elif remainder == 12:
            hexval = "C" + hexval
        elif remainder == 13:
            hexval = "D" + hexval
        elif remainder == 14:
            hexval = "E" + hexval
        elif remainder == 15:
            hexval = "F" + hexval
        temp = temp // 16
    
    # Display character
    if char == " ":
        display = "SPACE"
    else:
        display = char
    
    print(display, "        ", ascii_val, "      ", binary, "   ", hexval)

print("Sum of ASCII values:", total)