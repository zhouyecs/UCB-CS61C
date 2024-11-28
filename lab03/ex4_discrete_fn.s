.globl f # this allows other files to find the function f

# f takes in two arguments:
# a0 is the value we want to evaluate f at
# a1 is the address of the "output" array
# The return value should be stored in a0
f:
    # Adjust the input value to get an index between 0 and 6
    addi t0, a0, 3

    # Calculate byte offset (index * 4)
    slli t1, t0, 2

    # Calculate the address of the desired element
    add t2, a1, t1

    # Load the value into a0
    lw a0, 0(t2)

    # Return from the function
    jr ra