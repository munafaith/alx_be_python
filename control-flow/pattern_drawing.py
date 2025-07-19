size = int(input("Enter the size of the pattern: "))

row = 0

# Outer while loop for each row
while row < size:
    # Inner for loop to print each asterisk in the row
    for col in range(size):
        print("*", end="")
    print()  # Move to the next line after each row
    row += 1
